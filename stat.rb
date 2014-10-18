# -*- coding: utf-8 -*-
#!/usr/bin/ruby
require "json"
require "time"
require "./team.rb"

def ShowTeams(teams)
    if teams
      for key, value in teams
        puts "#{key} #{value.report}\n"
      end
    end
end

def ShowTourGames(tour)
   date = tour["date"]
   matches = tour["matches"]
   puts "#{date} \n"
   for value in matches
     puts "#{value['num']} #{value['match']}\n"
   end
end

def GetNextTour(jsondata)
  tour = []
  if jsondata
      begin 
        i=0
        index=0
        tnow = Time.now
        mas = []
        teams = createTeams()
        playing_teams = []
        #tnow = Time.local(2014, 10, 15)
        stnow = tnow.strftime("%Y-%m-%d")
        #puts " #{tnow.to_s} \n"
        for value in jsondata
          dt = value["date"].split(".")
          #puts " #{dt} \n"
          t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
          #puts " #{t.to_i} #{tnow.to_i}\n"
          if (tnow.to_i+86400) >= t.to_i 
            index=i
            mas[i]=i
            playing_teams= GetTeamsFromDay(value)
            #puts "#{i} => #{value} \n"
          end
          i+=1
        end
        tour = jsondata[index]
        #puts "#{playing_teams}\n"
        if playing_teams.length > 0
          i = 0
          result = []
          for key, value in teams
            if playing_teams.include? value.title
              puts "#{value.title}\n"
              stat = GetTeamStatByDate(stnow, value.title, jsondata)
              result[i] = {"title"=>value.title,"stat"=>stat}
              puts "#{result[i]}\n"
              i += 1
            end
          end
        end
      rescue => ex
        puts  "#{ex.class}: #{ex.message}\n"
      end
  end
  return tour
end

def GetTeamsFromDay(day)
  result = []
  if day && day["matches"]
    begin
      i = 0
      for match in day["matches"]
        result[i] = match['home']
        i += 1
        result[i] = match['away']
        i += 1
      end
    rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
    end
  end
  return result
end

def GetTeamStatByDate(getdate, team, mas)
  result = []
  games = 0
  wins = 0
  wo = 0
  ws = 0
  lo = 0
  ls = 0
  lost = 0
  goal_scored = 0
  goal_offered = 0
  points = 0
  begin
    tnow = Time.now
    for value in mas
      dt = value["date"].split(".")
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      if (tnow.to_i+86400) >= t.to_i 
        if value["matches"]
          for match in value["matches"]
            if match['result'] != ":"
              result_mas = match['result'].split(":")
              if result_mas.length == 2
                result_home=result_mas[0].to_i
                result_away=result_mas[1].to_i
              else
                result_home = 0
                result_away = 0
              end
              if match['home'] == team
                goal_scored += result_home
                goal_offered += result_away
                
                if match["overtime"] == nil && match["shootout"] == nil
                  if  result_home > result_away
                    points += 3
                    wins += 1
                  else
                    lost +=1
                  end
                else
                  if match["overtime"] == true
                    if  result_home > result_away
                      points += 2
                      wo += 1
                    else
                      points += 1
                      lo +=1
                    end
                  end
                  if match["shootout"] == true
                    if  result_home > result_away
                      points += 2
                      ws += 1
                    else
                      points += 1
                      ls +=1
                    end
                  end
                end
                
                games += 1
              end
              if team == match['away']
                goal_scored += result_away
                goal_offered += result_home
                if match["overtime"] == nil && match["shootout"] == nil
                  if  result_home < result_away
                    points += 3
                    wins += 1
                  else
                    lost +=1
                  end
                else
                  if match["overtime"] == true
                    if  result_home < result_away
                      points += 2
                      wo += 1
                    else
                      points += 1
                      lo +=1
                    end
                  end
                  if match["shootout"] == true
                    if  result_home < result_away
                      points += 2
                      ws += 1
                    else
                      points += 1
                      ls +=1
                    end
                  end
                end
                games += 1
              end
            end
          end
        end
      end
    end
    result = {"games"=>games,"W"=>wins,"WO"=>wo,"WS"=>ws,"LO"=>lo,"LS"=>ls,"L"=>lost,"GS"=>goal_scored,"GO"=>goal_offered,"PTS"=>points}
    #puts "#{result}\n"
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  return result
end

def Read_JSON(filename)
  file = open(filename)
  json = file.read

  parsed = JSON.parse(json)
  
  return parsed
end

fiName = "data.json"

if not File.exists? fiName then
  puts "File #{fiName} does not exist."
  exit
end

now = Time.now
jsondata = Read_JSON(fiName)

if jsondata
  nexttour = GetNextTour(jsondata)
  if nexttour.length > 0
    ShowTourGames(nexttour)
  end
  teams = createTeams()
  #ShowTeams(teams)
end