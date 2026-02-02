extends Node

func _ready():
    var animation_players = []
    _find_animation_players(get_tree().get_root(), animation_players)
    var rng = RandomNumberGenerator.new()
    rng.randomize()
    for player in animation_players:
        # Launch a delayed animation in a new coroutine for each AnimationPlayer
        _play_random_animation_delayed(player, rng)

func _play_random_animation_delayed(player, rng):
    var anims = player.get_animation_list()
    if anims.size() > 0:
        var anim_name = anims[rng.randi_range(0, anims.size() - 1)]
        var animation = player.get_animation(anim_name)
        if animation:
            animation.loop = true
            animation.loop_mode = Animation.LOOP_PINGPONG
        var delay = rng.randf_range(0.5, 2.0) # 0.5 to 2 seconds random delay
        await get_tree().create_timer(delay).timeout
        player.play(anim_name)

func _find_animation_players(node, results):
    if node is AnimationPlayer:
        results.append(node)
    for child in node.get_children():
        if child is Node:
            _find_animation_players(child, results)
