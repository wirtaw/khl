# -*- coding: utf-8 -*-
#!/usr/bin/ruby
require "Qt4"
require "English"
require "time"
require "./dashboard_khl.rb"
require "./team.rb"
require "./work_json.rb"
 
class StartQT4 < Qt::MainWindow
  slots 'select_date()',
      'select_date2()',
      'file_dialog()',
      'run_tab1()',
      'dateChanged()',
      'teamAChanged()',
      'teamBChanged()',
      'run_tab2()',
      'run_tab3()',
      'run_tab4()',
      'run_tab5()',
      'get_my_stat()',
      'get_stat_table()'
  def initialize parent=nil
    super
    @ui = Ui_MainWindow.new
    @ui.setupUi self
    Qt::Object.connect(@ui.calendarWidget, SIGNAL('selectionChanged()'), self, SLOT('select_date2()'))
    Qt::Object.connect(@ui.a_open, SIGNAL('activated()'), self, SLOT('file_dialog()'))
    Qt::Object.connect(@ui.pushButton, SIGNAL('clicked()'), self, SLOT('run_tab1()'))
    Qt::Object.connect(@ui.d_text, SIGNAL('textChanged()'), self, SLOT('dateChanged()'))
    Qt::Object.connect(@ui.textEdit_4, SIGNAL('textChanged()'), self, SLOT('teamAChanged()'))
    Qt::Object.connect(@ui.textEdit_5, SIGNAL('textChanged()'), self, SLOT('teamBChanged()'))
    Qt::Object.connect(@ui.actionShow, SIGNAL('activated()'), self, SLOT('run_tab2()'))
    Qt::Object.connect(@ui.b_get_bet_games, SIGNAL('clicked()'), self, SLOT('run_tab2()'))
    Qt::Object.connect(@ui.actionShow_2, SIGNAL('activated()'), self, SLOT('run_tab3()'))
    Qt::Object.connect(@ui.b_get_result_games, SIGNAL('clicked()'), self, SLOT('run_tab3()'))
    Qt::Object.connect(@ui.actionWrite, SIGNAL('activated()'), self, SLOT('run_tab4()'))
    Qt::Object.connect(@ui.actionWrite_2, SIGNAL('activated()'), self, SLOT('run_tab5()'))
    #Qt::Object.connect(@ui.tab3.button_b_show_matches, SIGNAL('clicked()'), self, SLOT('run_tab2()'))
    Qt::Object.connect(@ui.b_write_bet, SIGNAL('clicked()'), self, SLOT('run_tab4()'))
    Qt::Object.connect(@ui.b_write_result, SIGNAL('clicked()'), self, SLOT('run_tab5()'))
    Qt::Object.connect(@ui.b_get_my_stat, SIGNAL('clicked()'), self, SLOT('get_my_stat()'))
    Qt::Object.connect(@ui.b_reload_tables_results, SIGNAL('clicked()'), self, SLOT('get_stat_table()'))
    #Qt::Object.connect(@ui.b_calculte, SIGNAL('clicked()'), self, SLOT('calculate()'))
    
    si  = Qt::SystemTrayIcon.new

    si.icon = Qt::Icon.new('./khl_logo2.png')
    si.show
    
    @filename = "./data.json"
    @jsondata = Read_JSON(@filename)
    @filename2 = "./pre_data.json"
    @jsondata2 = Read_JSON(@filename2)
    @teams = createTeams()
    @ui.editor_window.setText ShowTeams(@teams)
    @teamA = ''
    @teamB = ''
    @date = getTodayDate()
    MakeList()
  end
  
  def file_dialog
    if @jsondata
      begin
	     answer = ShowTeams(@teams)
	     answer1 = ShowTeamsName(@teams)
	     if answer && answer.to_s != ''
	       @ui.editor_window.setText answer	  
	     end
      rescue => ex
	     puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def select_date
    if @jsondata
      begin 
      	answer = @ui.date_field::currentDate()
      	if answer && answer.to_s != ''
      	  @ui.editor_window.setText answer
      	end
      rescue => ex
	     puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def select_date2
    if @jsondata
      begin
        getdate = ''
        tnow = Time.now
        y = @ui.calendarWidget.selectedDate::year()
        m = @ui.calendarWidget.selectedDate::month()
        d = @ui.calendarWidget.selectedDate::day()
        #puts "#{y} #{m} #{d}\n"
        tnow = Time.local(y.to_i,m.to_i,d.to_i)
        
        getdate = y.to_s+'.'+m.to_s+'.'+d.to_s
      	if getdate && getdate != ''
           @date = getdate
           @ui.d_text.plainText = getdate
      	end
      rescue => ex
	     puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def run_tab1
    if @jsondata
      begin 
      	#puts "#{@ui.plainTextEdit} \n"
      	@ui.textEdit_3.setText ''
      	
      	answer = @ui.d_text.plainText
      	@date = answer.to_s
      	if @date && @date != '' && @teamA && @teamA != '' && @teamB && @teamB != ''
      	  #puts "run analyze \n"
      	  
      	  answer = GetTeamBeforeDate(@date, @teamA, @jsondata)
      	  result = answer['result']
      	  resulta = GetTeamPreseason(@teamA, @jsondata2)
      	  if resulta != ''
      	    result = result + "------\n"+resulta
      	  end
      	  @ui.textEdit.setText result
      	  
      	  last10 = answer['last_games']
          @ui.label_22.setText last10

      	  answer2 = GetTeamBeforeDate(@date, @teamB, @jsondata)
      	  result2 = answer2['result']
      	  resultb = GetTeamPreseason(@teamB, @jsondata2)
          if resultb != ''
            result2 = result2 + "------\n"+resultb
          end
      	  @ui.textEdit_2.setText result2
      	  
      	  last10b = answer2['last_games']
      	  @ui.label_21.setText last10b
      	  
      	  if result2.include? @teamA.to_s 
      	    if result.include? @teamB.to_s
      	       @ui.textEdit_3.setText '"include"'
      	    end
      	  end
      	end
      rescue => ex
	       puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def run_tab2
    if @jsondata
      begin 
      	#puts "#{@ui.plainTextEdit} \n"
      	answer = @ui.d_text.plainText
      	@date = answer.to_s
      	if @date && @date != '' 
      	  result = GetGamesByDate(@date, @jsondata)
      	  @ui.t_bet_games_by_date.setText result 
      	end
      rescue => ex
	       puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def run_tab3
    if @jsondata
      begin 
      	#puts "#{@ui.plainTextEdit} \n"
      	answer = @ui.d_text.plainText
      	@date = answer.to_s
      	if @date && @date != '' 
      	  result = GetGamesByDate(@date, @jsondata)
      	  @ui.t_result_games_by_date.setText result 
      	end
      rescue => ex
	       puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def run_tab4
    if @jsondata
      begin 
      	#puts "#{@ui.plainTextEdit} \n"
      	answer = @ui.d_text.plainText
      	@date = answer.to_s
      	
      	nr = @ui.t_bet_game.plainText
      	nr = nr.to_s
      	
      	home = @ui.t_bet_score_home.plainText
      	home = home.to_s
      	
      	away = @ui.t_bet_score_away.plainText
      	away = away.to_s
      	
      	if @date && @date != '' && nr && nr != '' && home && home != '' && away && away != ''
      	  result = SetGamesBetByGameNr(@date, nr, home, away, @jsondata)
      	  if result != false
      	    @jsondata = Write_JSON(@filename, result)
      	    reload = GetGamesByDate(@date, @jsondata)
            @ui.t_bet_games_by_date.setText reload
             
      	  end
      	  @ui.t_bet_game.setText ''
      	  @ui.t_bet_score_home.setText ''
      	  @ui.t_bet_score_away.setText ''
      	  #@ui.t_bet_games_by_date.setText result 
      	end
      rescue => ex
	       puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def run_tab5
    if @jsondata
      begin 
        #puts "#{@ui.plainTextEdit} \n"
        answer = @ui.d_text.plainText
        @date = answer.to_s
        
        nr = @ui.t_result_game.plainText
        nr = nr.to_s
        
        home = @ui.t_result_score_home.plainText
        home = home.to_s
        
        away = @ui.t_result_score_away.plainText
        away = away.to_s
        
        addtime = @ui.t_result_additional_time.plainText
        addtime = addtime.to_s.downcase()
        if addtime != ''
          if addtime == 'ot' || addtime == 'o'
            ot = true
          else
            ot = nil
          end
          if addtime == 'sh' || addtime == 's'
            sh = true
          else
            sh = nil
          end
        end
        
        if @date && @date != '' && nr && nr != '' && home && home != '' && away && away != ''
          result = SetGamesResultByGameNr(@date, nr, home, away, @jsondata, ot, sh)
          if result != false
            #puts "changed \n"
            @jsondata = Write_JSON(@filename, result)
            reload = GetGamesByDateByResult(@date, @jsondata)
            @ui.t_result_games_by_date.setText reload
          end
          @ui.t_result_game.setText ''
          @ui.t_result_score_home.setText ''
          @ui.t_result_score_away.setText ''
          @ui.t_result_additional_time.setText ''
          #@ui.t_result_games_by_date.setText result 
        end
      rescue => ex
         puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def get_my_stat
    begin 
      #puts "#{@ui.d_text.plainText}\n"
      games = GetGames(@jsondata)
      points = GetPoints(@jsondata)
      
      @ui.t_played_games.setText games.to_s
      @ui.t_earned_points.setText points.to_s
    rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
    end
  end
  
  def get_stat_table
    begin 
      #puts "#{@ui.list_west_conference}\n"
      #games,wins,wins_o,wins_s,losts_o,losts_s,losts,goals_scored,goals_offered,points
      cols = {0=>"title",1=>"games",2=>"wins",3=>"winso",4=>"winss",5=>"losts",6=>"losto",7=>"lost",8=>"goalss",9=>"goalso",10=>"points"}
      @teams = GetTeamTable(@date, @teams, @jsondata)
      if @teams
        i = 0
        for key, value in @teams
          if value.conference == "Запад".force_encoding("utf-8")
            Qt::ListWidgetItem.new(@ui.list_west_conference)
            @ui.list_west_conference.item(i).text = Qt::Application.translate("Dialog", value.title+"/"+value.games.to_s, nil, Qt::Application::UnicodeUTF8)
            i += 1
          end
        end
        i = 0
        
        for key, value in @teams
          if value.conference == "Восток".force_encoding("utf-8")
            #Qt::TableViewItem.new(@ui.table_east_conference)
            #@ui.table_east_conference.item(i).text = Qt::Application.translate("Dialog", value.title+"/"+value.games.to_s, nil, Qt::Application::UnicodeUTF8)
            i += 1
          end
        end
        i = 0
        for key, value in @teams
          j=0
          if value.conference == "Восток".force_encoding("utf-8")
            #Qt::TableViewItem.new(@ui.table_east_conference)
            #@ui.table_east_conference.item(i).text = Qt::Application.translate("Dialog", value.title+"/"+value.games.to_s, nil, Qt::Application::UnicodeUTF8)
            #cell = Qt::TableWidgetItem.new(@ui.table_east_conference)
            #cell.setText(Qt::Application.translate("MainWindow", (i+1).to_s, nil, Qt::Application::UnicodeUTF8))
            #@ui.table_east_conference.setVerticalHeaderItem(i, cell)
            for k, v in cols
              #cell = Qt::TableWidgetItem.new(@ui.table_east_conference)
              #cell.setText(Qt::Application.translate("Dialog", value.getValue(v).to_s, nil, Qt::Application::UnicodeUTF8))
              #@ui.table_east_conference.setItem(i, j, cell)
              j += 1
            end
            i += 1
          end
        end
      end
    rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
    end
  end
  
  def dateChanged()
    begin 
      #puts "#{@ui.d_text.plainText}\n"
      value = @ui.d_text.plainText
      @date = value.to_s 
    rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
    end
  end
  
  def teamAChanged()
    begin 
      #puts "#{@ui.textEdit_4.plainText}\n"
      value = @ui.textEdit_4.plainText
      @teamA = value.to_s.force_encoding("utf-8")
      @ui.textEdit.setText ''
      
      answer = @ui.d_text.plainText
      @date = answer.to_s
      if @date && @date != '' && @teamA && @teamA != ''
        #puts "run analyze \n"
        
        answer = GetTeamBeforeDate(@date, @teamA, @jsondata)
        result = answer['result']
        resulta = GetTeamPreseason(@teamA, @jsondata2)
        if resulta != ''
          result = result + "------\n"+resulta
        end
        @ui.textEdit.setText result
        
        last10 = answer['last_games']
        @ui.label_22.setText last10
        
        @ui.textEdit_3.setText ''
      end
    rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
    end
  end
  
  def teamBChanged()
    begin 
      #puts "#{@ui.textEdit_5.plainText}\n"
      value = @ui.textEdit_5.plainText
      @teamB = value.to_s.force_encoding("utf-8")
      @ui.textEdit_2.setText ''
      
      answer = @ui.d_text.plainText
      @date = answer.to_s
      if @date && @date != '' && @teamB && @teamB != ''
        #puts "run analyze \n"

        answer2 = GetTeamBeforeDate(@date, @teamB, @jsondata)
        result2 = answer2['result']
        resultb = GetTeamPreseason(@teamB, @jsondata2)
        if resultb != ''
          result2 = result2 + "------\n"+resultb
        end
        @ui.textEdit_2.setText result2
        
        last10b = answer2['last_games']
        @ui.label_21.setText last10b
        
        @ui.textEdit_3.setText ''
      end
    rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
    end
  end
  
  def MakeList()
    if @jsondata
      begin 
      	#puts "#{@jsondata}"
      	#@ui.editor_window.setText @jsondata
      rescue => ex
	     puts  "#{ex.class}: #{ex.message}\n"
      end
    end
  end
  
  def getTodayDate()
    begin 
      tnow = Time.now
      stnow = tnow.strftime("%Y.%m.%d")
      @ui.d_text.plainText= stnow
      
    rescue => ex
      puts  "#{ex.class}: #{ex.message}\n"
    end
    
    return stnow
  end
end
 
if $0 == __FILE__
    app = Qt::Application.new(ARGV)
    myapp = StartQT4.new
    myapp.show
    app.exec
end