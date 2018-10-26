require "pry"

def game_hash  
  game_hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['black', 'white'],
      :players => [
        {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['turquoise', 'purple'],
      :players => [
        {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        {player_name: 'Bismak Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

def get_players
  player_hash = game_hash.collect do |turf, details|
    details[:players]
  end
  player_hash.flatten
end

def find_player(name)
  player = get_players.find do |player|
    player[:player_name] == name
  end
end 

def num_points_scored(name)
  find_player(name)[:points]
end

def shoe_size(name)
  find_player(name)[:shoe]
end

def team_colors(team)
  game_hash.each do |turf, details|
    return details[:colors].map(&:capitalize) if details[:team_name] == team
  end 
end 

def team_names
  team_array = game_hash.collect do |turf, details| 
    details[:team_name] 
  end
end

def pick_side(team)
  side = game_hash.select do |turf, details|
    return details[:players] if details[:team_name] == team
  end 
  side
end 

def player_numbers(team)
  jerseys = pick_side(team).collect do |player|
    player[:number]
  end
end 

def player_stats(name)
  return find_player(name).reject{|k,v|(k == :player_name)} if find_player(name)[:player_name] == name
end

def team_datas
  team_data = game_hash.collect do |turf, details|
    details[:players]
  end
  team_data.flatten
end 

def big_shoe_rebounds
  rebound = 0
  size = 0
  team_datas.collect do |player|
    size = player[:shoe] and rebound = player[:rebounds] if player[:shoe] > size
    return rebound
  end
end 

def most_points_scored
  highest = 0
  mvp_player = nil
  team_datas.collect do |player|
      mvp_player = player[:player_name] and highest = player[:points] if player[:points] > highest
  end 
  return mvp_player
end 

def winning_team
  winner = nil 
  highest_team_points = 0
  game_hash.each do |turf, details|
    team_points = 0
    details[:players].each do |player|
      team_points += player[:points]
      highest_team_points = team_points and winner = details[:team_name] if team_points > highest_team_points
    end
  end 
  return winner
end 

def player_with_longest_name
  long_player = nil
  longest = 0
  team_datas.each do |player|
    long_player = player[:player_name] and longest = player[:player_name].length if player[:player_name].length > longest
  end 
  return long_player
end 

def long_name_steals_a_ton?
  steal_king = nil
  highest_steals = 0
  team_datas.each do |player|
    steal_king = player[:player_name] and highest_steals = player[:steals] if player[:steals] > highest_steals
  end 
  long_player = player_with_longest_name
  true if steal_king == long_player
end