# -*- coding: utf-8 -*-
#!/usr/bin/ruby
require "English"
require "json"
require "time"

def GetGamesByDate(getdate, mas)
  result = ''
  mas2 = []
  i = 0
  j = 0
  k = 0
  index = 0
  gamenr = 0
  index_date = ''
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
        index = k
        index_date = value["date"]
        if value["matches"]
          for match in value["matches"]
            result = result+ ""+match['num'].to_s+" "+match['match']
            if match['bet'] != ":"
              result = result +" "+match['bet']
            end
            result = result +" \n"
            mas2[j] = {"num"=>match['num'], "match"=>match['match'], "home"=>match['home'], "away"=>match['away'], "result"=>match['result'], "bet"=>match['bet'], "points"=>match['points']}
            gamenr = match['num'].to_i
            j +=1
          end
          puts "How mach games to add?\n"
          number_games = gets
          number_games = number_games.to_i
          while i < number_games
            puts "team home?\n"
            home_team = gets
            home_team[-1]=''
            puts "team away?\n"
            away_team = gets
            away_team[-1]=''
            
            mas2[i+j] = {"num"=>(i+1+gamenr), "match"=>home_team+' - '+away_team, "home"=>home_team, "away"=>away_team, "result"=>":", "bet"=>":", "points"=>0}
            i += 1
          end
          gamenr += i
        end
      end
      k += 1
    end
    puts "#{mas2} \n"
    puts "start #{mas[index]} \n"
    mas[index]={"matches" => mas2, "date" => index_date}
    puts "end #{mas[index]} \n"
    i = 1
    index = 0
    for value in mas
      if value["matches"]
        mas2 = []
        j = 0
        for match in value["matches"]
          mas2[j] = {"num"=>i, "match"=>match['match'], "home"=>match['home'], "away"=>match['away'], "result"=>match['result'], "bet"=>match['bet'], "points"=>match['points']}
          i += 1
          j += 1
        end
        mas[index] = {"matches" => mas2, "date" => value["date"]}
      end
      index += 1
    end
  rescue => ex
    puts  "#{ex.class}: #{ex.message}\n"
  end
  #puts "#{result} \n"
  return mas
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


tnow = Time.now
filename = "./data.json"
jsondata = Read_JSON(filename)

if jsondata
  puts "Data missed games\n"
  puts "Write date (yyyy.mm.dd)\n"
  getdate = gets
  getdate[-1]=''
  
  
  #puts "#{jsondata[0]}\n"
  result = GetGamesByDate(getdate, jsondata)
  #puts "#{jsondata[0]}\n"
  print "[yes/no]"
  response = gets
  if /^[yes]/.match(response)
    File.open('data2.json', 'w') do |f2|  
       #use "\n" for two lines of text  
      f2.puts JSON.generate(jsondata)  
    end
  end
end