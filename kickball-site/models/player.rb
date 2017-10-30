require_relative "./team_data"

class Player
  attr_reader :name, :position, :team_name

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    result = []
    TeamData::ROLL_CALL.each do |team|
      team[1].each do |k,v|
        result << Player.new(v,k,team[0])
      end
    end
    result
  end
end
