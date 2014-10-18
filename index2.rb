# -*- coding: utf-8 -*-
#!/usr/bin/ruby
require "English"
require "json"

def Get_Matches(block, num)
  result = {}
  begin
    matches = block.scan(/[а-яА-Я]+\D+/)
    date = block.scan(/\d\d\d\d.\d\d.\d\d/)
    if date && matches
      str = matches[0]
      #str["\n"] = " "
      i=0
      is_match = /[:]+\n/.match(str)
      if is_match
  tmp = str.split(/[:]+\n/)
  mas = []
  
  for value in tmp
    value[-1]=''
    teams = value.split(/[-]/)
    if teams
      team1 = teams[0]
      team1[-1]=''
      team2 = teams[1]
      team2[0]=''
    end
    mas[i] = {"num"=>(i+1+num), "match"=>value, "home"=>team1, "away"=>team2, "result"=>":", "bet"=>":", "points"=>0}
    i+=1
  end
      else
        mas = str
      end
      #matches[0]=matches[0].gsub(/\\([nrt])/) { escapes[$1] }
      #result = result+" #{date}  #{matches}"
      result = {"matches" => mas, "date" => date[0]}
    end
  rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
  end
  return result
end

fiName = "data4.txt"

if not File.exists? fiName then
  puts "File #{fiName} does not exist."
  exit
end

contents = File.read(fiName).encode("utf-8")

if contents.valid_encoding?
  begin
    i=0
    tour = []
    #is_match = /\d\d\d\d.\d\d.\d\d+\D+[а-яА-Я]+\D+/.match(contents)
    #if is_match
      #puts "match #{is_match} \n"
      #mas = contents.scan(/\d\d\d\d.\d\d.\d\d+\D+[а-яА-Я]+\D+/)
      #num = 0
      #for key, value in mas
        #puts "#{i}  #{key} => #{value} \n"
        #tour[i] = Get_Matches(key, num)
        #num += tour[i]['matches'].length
        #if i == 9
          #puts "#{i}  #{key} => #{value} \n"
          #puts "#{tour[i]} #{tour[i]['matches'].length}"
        #end
        #i+=1
      #end
      #puts "#{i}\n"
    #end 
    tour_count=0
    tour_date = ''
    games = []
    j=0
    contents.gsub!(/\r\n?/, "\n")
    contents.each_line do |line|
      if i==3
          print "#{i += 1} #{line}"
      end
      is_match = /\d\d\d\d.\d\d.\d\d/.match(line)
      if is_match
          if tour_date != "" && games.length >0
              tour[tour_count-1] = {"matches" => games, "date" => tour_date}
          end
          tour_date = line.scan(/\d\d\d\d.\d\d.\d\d/)
          games = []
          j=0
          tour_count+=1
      else
          teams = line.split(/[–]/)
          if teams
            #puts "#{teams}"
            team1 = teams[0]
            team1[-1]=''
            team2 = teams[1]
            team2[0]=''
            team2[-1]=''
            match = team1 + "-" + team2;
            score = teams[2]
            score[0]=''
            score[-1]=''
            games[j] = {"num"=>j+1, "match"=>match ,"home"=>team1, "away"=>team2, "result"=>score}
            j+=1
          end
      end
    end
    #is_match = /\d\d \a-zA-Z\ (\a-zA-Z\)/.match(contents)
    #if is_match
      #mas = contents.split(/\d\d\ \/a-zA-Z\ /(\a-zA-Z\)\/)
    #end
  puts "end show mas\n"
  
  puts JSON.generate(tour)
  File.open('pre_data.json', 'w') do |f2|  
    # use "\n" for two lines of text  
    f2.puts JSON.generate(tour)  
  end 
  rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
  end
else
  puts "File #{fiName} has bad encoding"
  exit
end

