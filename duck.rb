require 'rrobots'

class Duck
  include Robot

  def tick events
    turn 2
    fire 3 unless events['robot_scanned'].empty?
  end
end
