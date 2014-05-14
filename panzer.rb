require 'rrobots'

class Panzer
  include Robot

  def tick events
    turn_radar 1 if time == 0
    turn_gun 30 if time < 3
    move_random
    fire 3 unless events['robot_scanned'].empty?
  end


  def move_random
    accelerate -1 + rand(2)
    turn -10 + rand(20)

  end
end
