require 'rrobots'

class LittleToaster
  include Robot

  def tick events
    turn_gun(7)
    turning
    accelerate 8
    firing
  end

  def turning
    if time % 3 == 0
      turn Random.rand(2..4)
    else
      turn 1
    end
  end

  def firing
   if events['robot_scanned'].empty?
        fire 0.1
      else
        fire 3
  end
end

end
