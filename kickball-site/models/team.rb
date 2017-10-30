require_relative "./team_data"

class Team
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all
    result = []
    TeamData::ROLL_CALL.each do |team|
      result << Team.new(team[0])
    end
  end

  def players
    result = []
    Player.all.each do |player|
      if player.team_name == @name
        result << player
      end
    end
    result
  end
end
