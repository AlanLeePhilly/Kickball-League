require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces



get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
  @teams = Team.all

  erb :team_list
end
#
# get "/teams/test" do
#   slammers = Team.all[0].players
# end

get "/teams/:one_team" do
  @one_team = params[:one_team]
  @current_team = TeamData::ROLL_CALL.assoc(:"#{@one_team}")
  require 'pry'
  binding.pry
  erb :show_roster
end
