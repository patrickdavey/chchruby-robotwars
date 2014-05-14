require 'rrobots'

class Duck
  include Robot

  def tick events
    turn_radar 60
    #turn_radar -60
    turn_gun 30 if time < 3
    accelerate 1
    turn -2
    fire 3 unless events['robot_scanned'].empty?
  end
end
