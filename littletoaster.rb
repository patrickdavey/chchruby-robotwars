require 'rrobots'

class LittleToaster
  include Robot

  def tick events
    turn_gun(10)
    if time % 2 == 0
    turn 10
  else
    turn 5
  end

    accelerate 3
    fire 3 unless events['robot_scanned'].empty?
  end
end
