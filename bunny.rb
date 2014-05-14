require 'rrobots'

class FluffyBunny
  include Robot

  def tick events
    # battlefield_height = 100
    turn_radar 1 if time == 0
    turn_gun 10
    accelerate 8
    turn 3
    fire 3 unless events['robot_scanned'].empty?
  end
end
