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

def num_points_scored(name)
  game_hash.values.each do |datas|
    datas[:players].each do |players|
      return players[:points] if players.values.include?(name)
    end 
  end
end

def shoe_size(name)
  game_hash.values.each do |datas|
    datas[:players].each do |players|
      return players[:shoe] if players.values.include?(name)
    end 
  end 
end

def team_colors(team)
  game_hash.values.each do |datas|
    return datas[:colors].map(&:capitalize) if datas.values.include?(team)
  end 
end 

def team_names
  teams = []
  game_hash.values.each do |datas| 
    teams << datas[:team_name] 
  end
  return teams
end
 
def player_numbers(team)
  numbers = []
  game_hash.values.each do |datas|
    datas[:players].each do |players| 
      numbers << players[:number] if datas.values.include?(team)
    end 
  end 
  return numbers
end 

def player_stats(name)
  game_hash.values.each do |datas|
    datas[:players].each do |players| 
      if players.values.include?(name)
        players.delete(:player_name) 
        return players
      end
    end
  end 
end

def big_shoe_rebounds
  rebound = 0
  size = 0
  game_hash.values.each do |datas|
    datas[:players].each do |players|
      size = players[:shoe] and rebound = players[:rebounds] if players[:shoe] > size
    end 
  end 
  return rebound
end 

def most_points_scored
  highest = 0
  player = nil
  game_hash.values.each do |datas|
    datas[:players].each do |players|
      player = players[:player_name] and highest = players[:points] if players[:points] > highest
    end
  end 
  return player
end 

def winning_team
  winner = nil 
  highest_team_points = 0
  game_hash.values.each do |datas|
    team_points = 0
    datas[:players].each do |players|
      team_points += players[:points]
      highest_team_points = team_points and winner = datas[:team_name] if team_points > highest_team_points
    end 
  end 
  return winner
end 

def player_with_longest_name
  player = nil
  longest = 0
  game_hash.values.each do |datas|
    datas[:players].each do |players|
      player = players[:player_name] and longest = players[:player_name].length if players[:player_name].length > longest
    end 
  end 
  return player
end 

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  steal_king = nil
  highest_steals = 0
  game_hash.values.each do |datas|
    datas[:players].each do |players|
      steal_king = players[:player_name] and highest_steals = players[:steals] if players[:steals] > highest_steals
    end 
  end 
  true if steal_king == long_name
end