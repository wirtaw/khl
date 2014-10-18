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
   
   i=0
   for value in matches
     puts "#{value['num']} #{value['match']} #{value['bet']}\n"
     i+=1
   end
end

def SetTourGames(tour)
   date = tour["date"]
   matches = tour["matches"]
   puts "#{date} \n"
   mas = []
   i=0
   for value in matches
     puts "#{value['num']} #{value['match']}\n"
     puts "score #{value['home']}\n"
     home = gets
     home[-1]=''
     puts "score #{value['away']}\n"
     away = gets
     away[-1]=''
     mas[i] = {"num"=>value['num'], "match"=>value['match'], "home"=>value['home'], "away"=>value['away'], "result"=>":", "bet"=>home+":"+away, "points"=>0}
     i+=1
   end
   #puts "#{mas}\n"
   return {"matches" => mas, "date" => tour["date"]}
end

def SetNextTourBets(jsondata)
    tour = []
    if jsondata
      begin 
        i=0
        index=0
        mas = []
        tnow = Time.now
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
            #puts "#{i} => #{value} \n"
            mas[i]=i
          end
   
         
          i+=1
        end
        tour = jsondata[index]
        if tour.length > 0
          #puts "#{tour}\n"
          jsondata[index]=SetTourGames(tour)
          #ShowTourGames(jsondata[index])
          #puts "#{jsondata[index]}\n"
        end
  #puts "#{i} => #{index} #{jsondata[index]}\n"
      rescue => ex
        puts  "#{ex.class}: #{ex.message}\n"
      end
    end
    return jsondata
end

def SetNextTourBetsByDate(jsondata)
    tour = []
    if jsondata
      begin 
        i=0
        index=0
        mas = []
        puts "Write date (yyyy.mm.dd)\n"
        getdate = gets
        getdate[-1]=''
        m=getdate.split(".")
        tnow = Time.now
        if m.length ==3
          tnow = Time.local(m[0].to_i,m[1].to_i,m[2].to_i)
        end
        stnow = tnow.strftime("%Y-%m-%d")
        #puts " #{tnow.to_s} \n"
        for value in jsondata
          dt = value["date"].split(".")
          #puts " #{dt} \n"
          t = Time.local(dt[2].to_i,dt[1].to_i,dt[0].to_i)
          #puts " #{t.to_i} #{tnow.to_i}\n"
          if tnow.to_i == t.to_i  
            index=i
            #puts "#{i} => #{value} \n"
            mas[i]=i
            break
          end
   
         
          i+=1
        end
        tour = jsondata[index]
        if tour.length > 0
          puts "#{tour}\n"
          jsondata[index]=SetTourGames(tour)
          ShowTourGames(jsondata[index])
          puts "#{jsondata[index]}\n"
        end
  #puts "#{i} => #{index} #{jsondata[index]}\n"
      rescue => ex
        puts  "#{ex.class}: #{ex.message}\n"
      end
    end
    return jsondata
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
  puts "Bets\n"
  #puts "#{jsondata[0]}\n"
  jsondata = SetNextTourBetsByDate(jsondata)
  #puts "#{jsondata[0]}\n"
  print "[yes/no]"
  response = gets
  if /^[yes]/.match(response)
    File.open('data.json', 'w') do |f2|  
      # use "\n" for two lines of text  
      f2.puts JSON.generate(jsondata)  
    end
  end
end