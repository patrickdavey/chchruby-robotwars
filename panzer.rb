require 'rrobots'

class Panzer
  #@movement_status = "move_randomly"
  include Robot

  def tick events
    movebot
    aimbot
    say("(" + x.to_s + " ," + y.to_s + ") ")
  end

  def aimbot
    turn_radar 60
    unless events['robot_scanned'].empty?
     turn_gun radar_heading - gun_heading
     fire 2
    end
  end



  def movebot
    if move_away_from_left_wall then
      accelerate 1
      if is_heading_toward_left_wall then
        turn 10
      end
      #@movement_status = "move away from left wall"
    elsif move_away_from_top_wall then
      accelerate 1
      if is_heading_toward_top_wall then
        turn 10
      end
    elsif move_away_from_bottom_wall then
      accelerate 1
      if is_heading_toward_bottom_wall then
        turn 10
      end
    elsif move_away_from_right_wall then
      accelerate 1
      if is_heading_toward_right_wall then
        turn 10
      end
    else
      move_randomly
    end
  end



  def move_randomly
    accelerate -1 + rand(2)
    turn -5 + rand(10)
  end


  def is_heading_toward_top_wall
    heading < 180
  end

  def is_heading_toward_left_wall
    90 < heading && heading < 270
  end

  def is_heading_toward_bottom_wall
    heading > 180
  end

  def is_heading_toward_right_wall
    heading < 90 || heading >270
  end


  def move_away_from_left_wall
    x < 100
  end

  def move_away_from_top_wall
    y < 100
  end

  def move_away_from_bottom_wall
    battlefield_height - y < 100
  end

  def move_away_from_right_wall
    battlefield_width - x < 100
  end
end
