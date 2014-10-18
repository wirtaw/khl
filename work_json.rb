# -*- coding: utf-8 -*-
#!/usr/bin/ruby
require "json"

def ShowTeamsName(teams)
    result = ''
    if teams
      for key, value in teams
        result = result + "#{value.report}\n"
      end
    end
    return result
end

def ShowTeams(teams)
    result = ''
    if teams
      for key, value in teams
        result = result + "#{value.report}\n"
      end
    end
    return result
end

def GetTeamTable(getdate, teams, mas)
  result = false
  begin
    if teams
      i=0
      result = []
      for key, value in teams
        stat = GetTeamStatByDate(getdate, value.title, mas)
        result[i] = {"title"=>value.title,"stat"=>stat}
        puts " b #{value.games} \n"
        #games,wins,wins_o,wins_s,losts_o,losts_s,losts,goals_scored,goals_offered,points
        #{"games"=>games,"W"=>wins,"WO"=>wo,"WS"=>ws,"LO"=>lo,"LS"=>ls,"L"=>lost,"GS"=>goal_scored,"GO"=>goal_offered,"PTS"=>points}
        value.SetStat(stat["games"],stat["W"],stat["WO"],stat["WS"],stat["LO"],stat["LS"],stat["L"],stat["GS"],stat["GO"],stat["PTS"])
        puts " a #{value.games} \n"
        puts " #{result[i]} \n"
        i += 1
      end
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  return teams
end

def GetGamesByDate(getdate, mas)
  result = ''
  mas2 = []
  i=0
  j=0
  index=0
  begin
    m=getdate.split(".")
    #puts "#{getdate} #{m} \n"
    tnow = Time.now
    if m.length == 3
      tnow = Time.local(m[0].to_i,m[1].to_i,m[2].to_i)
    end
    for value in mas
      dt = value["date"].split(".")
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      
      if tnow.to_i == t.to_i 
      	if value["matches"]
      	  for match in value["matches"]
      	    result = result+ ""+match['num'].to_s+" "+match['match']
      	    if match['bet'] != ":"
      	      result = result +" "+match['bet']
      	    end
      	    result = result +" \n"
      	  end
      	end
      	break
      end
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  #puts "#{result} \n"
  return result
end

def GetGamesByDateByResult(getdate, mas)
  result = ''
  mas2 = []
  i=0
  j=0
  index=0
  begin
    m=getdate.split(".")
    #puts "#{getdate} #{m} \n"
    tnow = Time.now
    if m.length == 3
      tnow = Time.local(m[0].to_i,m[1].to_i,m[2].to_i)
    end
    for value in mas
      dt = value["date"].split(".")
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      
      if tnow.to_i == t.to_i 
        if value["matches"]
          for match in value["matches"]
            result = result+ ""+match['num'].to_s+" "+match['match']
            if match['bet'] != ":" && match['result'] != ":"
              
              addtime = ""
              if match["overtime"] == true
                addtime = " ОТ"
              else
                if match["shootout"] == true
                  addtime = " Б"
                else
                  addtime = ""
                end
              end
              
              bet_mas = match['bet'].split(":")
              result_mas = match['result'].split(":")
              answer = ""
              if bet_mas.length == 2 && result_mas.length == 2
                bet_home=bet_mas[0].to_i
                bet_away=bet_mas[1].to_i
                
                result_home=result_mas[0].to_i
                result_away=result_mas[1].to_i
                
                if result_home == bet_home && result_away == bet_away
                  answer = "угадал счёт"
                else
                  if match['points'] > 0
                    answer = "угадал победителя"
                  else
                    answer = "не угадал"
                  end
                end 
              end
              
              result = result +" "+match['result']+" "+addtime+" "+answer
            else
                if match['bet'] != ":"
                  result = result +" "+match['bet']
                end
            end
            result = result +" \n"
          end
        end
        break
      end
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  #puts "#{result} \n"
  return result
end


def SetGamesBetByGameNr(getdate, nr, home, away, mas)
  result = ''
  mas2 = [] 
  changed = false
  i = 0
  begin
    m=getdate.split(".")
    tnow = Time.now
    if m.length == 3
      tnow = Time.local(m[0].to_i,m[1].to_i,m[2].to_i)
    end
    for value in mas
      dt = value["date"].split(".")
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      if tnow.to_i == t.to_i 
      	j=0
      	index = i
      	if value["matches"]
      	  for match in value["matches"]
      	    if match['num'] == nr.to_i
      	      mas2[j] = {"num"=>match['num'], "match"=>match['match'], "home"=>match['home'], "away"=>match['away'], "result"=>match['result'], "bet"=>home.to_s+":"+away.to_s, "points"=>match['points'], "overtime"=>match['overtime'], "shootout"=>match['shootout']}
      	    else
      	      mas2[j]=match
      	    end
      	    j += 1
      	  end
	     end
	     #puts "mas2 #{mas2}\n"
	     mas[i]={"matches" => mas2, "date" => value["date"]}
	     changed = true
	     break
      end
      i += 1
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  if changed
    return mas
  else
    return changed
  end
end

def SetGamesResultByGameNr(getdate, nr, home, away, mas, ot, sh)
  result = ''
  mas2 = [] 
  changed = false
  i = 0
  begin
    m=getdate.split(".")
    tnow = Time.now
    if m.length == 3
      tnow = Time.local(m[0].to_i,m[1].to_i,m[2].to_i)
    end
    for value in mas
      dt = value["date"].split(".")
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      if tnow.to_i == t.to_i 
        j=0
        index = i
        if value["matches"]
          for match in value["matches"]
            if match['num'] == nr.to_i
              bet_mas = match['bet'].split(":")
              points = 0
              if bet_mas.length == 2
                home_goals = home.to_i
                away_goals = away.to_i
                #puts "result #{home_goals} #{away_goals}\n"
                bet_home=bet_mas[0].to_i
                bet_away=bet_mas[1].to_i
                #puts "bet #{bet_home} #{bet_away201}\n"
                if home_goals == bet_home && away_goals == bet_away
                  points += 3
                else
                  if (home_goals - away_goals) == (bet_home - bet_away) 
                    points += 2
                  else
                    if (home_goals - away_goals) == 1 &&  (bet_home - bet_away) == 1
                      points += 2
                    else
                      diff1 = home_goals - away_goals
                      diff2 = bet_home - bet_away
                      if diff1 > 0 && diff2 > 0 
                        points += 1
                      end
                      if diff1 < 0 && diff2 < 0 
                        points += 1
                      end
                    end
                  end
                end
              end
              mas2[j] = {"num"=>match['num'], "match"=>match['match'], "home"=>match['home'], "away"=>match['away'], "result"=>home.to_s+":"+away.to_s, "bet"=>match['bet'], "points"=>points, "overtime"=>ot, "shootout"=>sh}
            else
              mas2[j]=match
            end
            j += 1
          end
       end
       #puts "mas2 #{mas2}\n"
       mas[i]={"matches" => mas2, "date" => value["date"]}
       changed = true
       break
      end
      i += 1
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  if changed
    return mas
  else
    return changed
  end
end

def GetTeamBeforeDate(getdate, team, mas)
  result = ''
  mas2 = []
  games_stat = []
  i=0
  j=0
  index=0
  begin
    dt = getdate.split(".")
    tnow = Time.local(dt[0].to_i,dt[1].to_i,dt[2].to_i)
    for value in mas
      dt = value["date"].split(".")
      #puts " #{dt} \n"
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      #result = result + "  #{t.to_i} #{tnow.to_i}\n"
      if (tnow.to_i+86400) >= t.to_i 
      	#result = result + "  #{t.to_i} #{tnow.to_i}\n"
      	index=i
      	
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
      	      #puts "#{match['match']}  #{match['result']} \n"
      	      if match['home'] == team
      	        games_stat[j] = {"games"=>0,"wins"=>0,"loses"=>0,"scored"=>0,"offered"=>0}
      	        games_stat[j]["games"] = 1
      	        if result_home > result_away
      	          games_stat[j]["wins"] = 1
      	        else
      	          games_stat[j]["loses"] = 1
      	        end
      	        games_stat[j]["scored"] = result_home
      	        games_stat[j]["offered"] = result_away
            		#result = result+ " "+match['match']+" "+match['result']+"\n"
            		#puts "#{match["overtime"]}  #{match['shootout']} \n"
            		addtime = ""
            		if match["overtime"] == true
            		  addtime = " ОТ"
            		else
            		  if match["shootout"] == true
                    addtime = " Б"
                  else
                    addtime = ""
                  end
            		end
            		mas2[j] = value["date"]+" "+match['match']+" "+match['result']+""+addtime+"\n"
            		j += 1
      	      end
      	      if team == match['away']
      	        games_stat[j] = {"games"=>0,"wins"=>0,"loses"=>0,"scored"=>0,"offered"=>0}
      	        games_stat[j]["games"] = 1
                if result_home < result_away
                  games_stat[j]["wins"] = 1
                else
                  games_stat[j]["loses"] = 1
                end
                games_stat[j]["scored"] = result_away
                games_stat[j]["offered"] = result_home
      	        addtime = ""
                if match["overtime"] == true
                  addtime = " ОТ"
                else
                  if match["shootout"] == true
                    addtime = " Б"
                  else
                    addtime = ""
                  end
                end
            		#result = result+ " "+match['match']+" "+match['result']+"\n"
            		mas2[j] = value["date"]+" "+match['match']+" "+match['result']+""+addtime+"\n"
            		j += 1
      	      end
	    end
	  end
	end
	#puts "#{i} => #{value} \n"
      end
      i+=1
    end
    #puts "#{games_stat} \n"
    last_games = ""
    if j > 0
      index = j-1
      wins = 0
      loses = 0
      scored = 0
      offred = 0
      until index < (j -10)
        if games_stat[index] != nil
          games_stat[index].each do |key, val|
            #puts "#{key} #{value}\n"
            if key.include? "wins"
                if val.to_i != 0
                 wins += 1
                end
            end
            if key.include? "loses"
              if val.to_i != 0
                loses += 1
              end
            end
            if key.include? "scored"
              scored += val.to_i
            end
            if key.include? "offered"
              offred += val.to_i
            end
          end
        end
        index -= 1
      end
      last_games= "Last 10 games - [ W "+wins.to_s+"; L "+loses.to_s+"; Goals "+scored.to_s+"/"+offred.to_s+" ] "
    end
    #puts "#{last_games} \n"
    if j > 0
      index = j
      until index == -1
      	if mas2[index] != ''
      	  value = mas2[index].to_s
      	  result = result + ""+value
      	end
      	index -= 1
      end
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  return {'result' => result,'last_games' => last_games}
end

def GetTeamPreseason(team, mas)
  result = ''
  mas2 = []
  i=0
  j=0
  index=0
  begin
    for value in mas
      index=i
      getdate = value["date"][0]
      if value["matches"]
        for match in value["matches"]
          
          if match['result'] != ":"
            #puts "#{match['match']}  #{match['result']} \n"
            if match['home'] == team
              #result = result+ " "+match['match']+" "+match['result']+"\n"
              mas2[j] = getdate+" "+match['match']+" "+match['result']+"\n"
              j += 1
            end
            if team == match['away']
              #result = result+ " "+match['match']+" "+match['result']+"\n"
              mas2[j] = getdate+" "+match['match']+" "+match['result']+"\n"
              j += 1
            end
 
          end
        end
        #puts "#{i} => #{value} \n"
      end
      i+=1
    end
    if j > 0
      index = j
      until index == -1
        if mas2[index] != ''
          value = mas2[index].to_s
          result = result + ""+value
        end
        index -= 1
      end
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  return result
end

def GetGames(mas)
  result = 0
  begin
    tnow = Time.now
    for value in mas
      dt = value["date"].split(".")
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      if (tnow.to_i+86400) >= t.to_i 
        if value["matches"]
          for match in value["matches"]
            if match['result'] != ":"
              result += 1
            end
          end
        end
      end
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  return result
end

def GetPoints(mas)
  result = 0
  begin
    tnow = Time.now
    for value in mas
      dt = value["date"].split(".")
      t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
      if (tnow.to_i+86400) >= t.to_i 
        if value["matches"]
          for match in value["matches"]
            if match['result'] != ":"
              result += match['points']
            end
          end
        end
      end
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
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

def Write_JSON(filename, data)
  File.open(filename, 'w') do |f2|  
      f2.puts JSON.generate(data)  
  end
  
  return data
end