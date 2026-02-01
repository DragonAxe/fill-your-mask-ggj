class_name C_Mood
extends Component

@export var type: MoodType = MoodType.NONE

enum MoodType {
  NONE,
  HAPPY,
  SAD,
  CALM,
}

static func random_mood() -> MoodType:
    # MoodType values are 0..count-1; skip 0 (NONE)
    var count := MoodType.size()        # total entries
    var idx := randi_range(1, count - 1)
    return MoodType.values()[idx]
