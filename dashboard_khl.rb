=begin
** Form generated from reading ui file 'dashboard_khl.ui'
**
** Created:   12 23:28:56 2014
**      by: Qt User Interface Compiler version 4.8.6
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_MainWindow
    attr_reader :a_open
    attr_reader :a_close
    attr_reader :actionShow
    attr_reader :actionWrite
    attr_reader :actionShow_2
    attr_reader :actionWrite_2
    attr_reader :actionShow_3
    attr_reader :centralwidget
    attr_reader :b_close
    attr_reader :tabWidget
    attr_reader :tab_1
    attr_reader :groupBox
    attr_reader :textEdit
    attr_reader :textEdit_2
    attr_reader :textEdit_4
    attr_reader :textEdit_5
    attr_reader :label
    attr_reader :label_2
    attr_reader :label_3
    attr_reader :label_4
    attr_reader :label_21
    attr_reader :label_22
    attr_reader :textEdit_3
    attr_reader :label_23
    attr_reader :tab_2
    attr_reader :groupBox_4
    attr_reader :t_bet_games_by_date
    attr_reader :label_5
    attr_reader :t_bet_game
    attr_reader :label_6
    attr_reader :t_bet_score_home
    attr_reader :label_7
    attr_reader :t_bet_score_away
    attr_reader :label_8
    attr_reader :b_write_bet
    attr_reader :b_get_bet_games
    attr_reader :tab_3
    attr_reader :groupBox_5
    attr_reader :t_result_games_by_date
    attr_reader :label_10
    attr_reader :label_9
    attr_reader :t_result_game
    attr_reader :t_result_score_home
    attr_reader :label_12
    attr_reader :label_11
    attr_reader :t_result_score_away
    attr_reader :b_write_result
    attr_reader :b_get_result_games
    attr_reader :t_result_additional_time
    attr_reader :label_13
    attr_reader :tab_4
    attr_reader :groupBox_2
    attr_reader :table_east_conference
    attr_reader :groupBox_3
    attr_reader :list_west_conference
    attr_reader :b_reload_tables_results
    attr_reader :tab
    attr_reader :groupBox_6
    attr_reader :t_played_games
    attr_reader :b_get_my_stat
    attr_reader :label_14
    attr_reader :t_earned_points
    attr_reader :label_15
    attr_reader :label_16
    attr_reader :label_17
    attr_reader :label_18
    attr_reader :t_bet_score_q
    attr_reader :t_one_goal_q
    attr_reader :t_differend_q
    attr_reader :label_19
    attr_reader :label_20
    attr_reader :t_5_team_best
    attr_reader :t_5_team_worst
    attr_reader :calendarWidget
    attr_reader :d_text
    attr_reader :editor_window
    attr_reader :pushButton
    attr_reader :menubar
    attr_reader :menuMenu
    attr_reader :menuBets
    attr_reader :menuResults
    attr_reader :menuTables
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(1028, 692)
    mainWindow.maximumSize = Qt::Size.new(1028, 692)
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new(":/newPrefix/logo_khl.png"), Qt::Icon::Normal, Qt::Icon::Off)
    mainWindow.windowIcon = icon
    mainWindow.locale = Qt::Locale.new(Qt::Locale::Lithuanian, Qt::Locale::Lithuania)
    @a_open = Qt::Action.new(mainWindow)
    @a_open.objectName = "a_open"
    @a_close = Qt::Action.new(mainWindow)
    @a_close.objectName = "a_close"
    @actionShow = Qt::Action.new(mainWindow)
    @actionShow.objectName = "actionShow"
    @actionShow.checkable = false
    @actionWrite = Qt::Action.new(mainWindow)
    @actionWrite.objectName = "actionWrite"
    @actionShow_2 = Qt::Action.new(mainWindow)
    @actionShow_2.objectName = "actionShow_2"
    @actionWrite_2 = Qt::Action.new(mainWindow)
    @actionWrite_2.objectName = "actionWrite_2"
    @actionShow_3 = Qt::Action.new(mainWindow)
    @actionShow_3.objectName = "actionShow_3"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @b_close = Qt::PushButton.new(@centralwidget)
    @b_close.objectName = "b_close"
    @b_close.geometry = Qt::Rect.new(910, 620, 84, 25)
    @tabWidget = Qt::TabWidget.new(@centralwidget)
    @tabWidget.objectName = "tabWidget"
    @tabWidget.geometry = Qt::Rect.new(0, 10, 781, 631)
    @tabWidget.styleSheet = "font: 10pt \"LKLUG\";"
    @tab_1 = Qt::Widget.new()
    @tab_1.objectName = "tab_1"
    @groupBox = Qt::GroupBox.new(@tab_1)
    @groupBox.objectName = "groupBox"
    @groupBox.geometry = Qt::Rect.new(0, 10, 751, 561)
    @textEdit = Qt::TextEdit.new(@groupBox)
    @textEdit.objectName = "textEdit"
    @textEdit.geometry = Qt::Rect.new(20, 80, 331, 221)
    @textEdit_2 = Qt::TextEdit.new(@groupBox)
    @textEdit_2.objectName = "textEdit_2"
    @textEdit_2.geometry = Qt::Rect.new(390, 80, 341, 221)
    @textEdit_4 = Qt::TextEdit.new(@groupBox)
    @textEdit_4.objectName = "textEdit_4"
    @textEdit_4.geometry = Qt::Rect.new(20, 480, 321, 31)
    @textEdit_5 = Qt::TextEdit.new(@groupBox)
    @textEdit_5.objectName = "textEdit_5"
    @textEdit_5.geometry = Qt::Rect.new(390, 480, 331, 31)
    @label = Qt::Label.new(@groupBox)
    @label.objectName = "label"
    @label.geometry = Qt::Rect.new(20, 460, 59, 15)
    @label_2 = Qt::Label.new(@groupBox)
    @label_2.objectName = "label_2"
    @label_2.geometry = Qt::Rect.new(390, 460, 59, 15)
    @label_3 = Qt::Label.new(@groupBox)
    @label_3.objectName = "label_3"
    @label_3.geometry = Qt::Rect.new(20, 50, 181, 16)
    @label_4 = Qt::Label.new(@groupBox)
    @label_4.objectName = "label_4"
    @label_4.geometry = Qt::Rect.new(390, 50, 171, 16)
    @label_21 = Qt::Label.new(@groupBox)
    @label_21.objectName = "label_21"
    @label_21.geometry = Qt::Rect.new(390, 520, 331, 21)
    @label_22 = Qt::Label.new(@groupBox)
    @label_22.objectName = "label_22"
    @label_22.geometry = Qt::Rect.new(20, 520, 331, 21)
    @textEdit_3 = Qt::TextEdit.new(@groupBox)
    @textEdit_3.objectName = "textEdit_3"
    @textEdit_3.geometry = Qt::Rect.new(190, 370, 381, 71)
    @label_23 = Qt::Label.new(@groupBox)
    @label_23.objectName = "label_23"
    @label_23.geometry = Qt::Rect.new(310, 340, 151, 16)
    @tabWidget.addTab(@tab_1, Qt::Application.translate("MainWindow", "Compare and past games", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @groupBox_4 = Qt::GroupBox.new(@tab_2)
    @groupBox_4.objectName = "groupBox_4"
    @groupBox_4.geometry = Qt::Rect.new(10, 10, 701, 561)
    @t_bet_games_by_date = Qt::TextEdit.new(@groupBox_4)
    @t_bet_games_by_date.objectName = "t_bet_games_by_date"
    @t_bet_games_by_date.geometry = Qt::Rect.new(40, 50, 471, 191)
    @label_5 = Qt::Label.new(@groupBox_4)
    @label_5.objectName = "label_5"
    @label_5.geometry = Qt::Rect.new(40, 30, 59, 15)
    @t_bet_game = Qt::TextEdit.new(@groupBox_4)
    @t_bet_game.objectName = "t_bet_game"
    @t_bet_game.geometry = Qt::Rect.new(100, 260, 71, 31)
    @label_6 = Qt::Label.new(@groupBox_4)
    @label_6.objectName = "label_6"
    @label_6.geometry = Qt::Rect.new(60, 270, 31, 16)
    @t_bet_score_home = Qt::TextEdit.new(@groupBox_4)
    @t_bet_score_home.objectName = "t_bet_score_home"
    @t_bet_score_home.geometry = Qt::Rect.new(50, 340, 91, 31)
    @label_7 = Qt::Label.new(@groupBox_4)
    @label_7.objectName = "label_7"
    @label_7.geometry = Qt::Rect.new(50, 320, 59, 15)
    @t_bet_score_away = Qt::TextEdit.new(@groupBox_4)
    @t_bet_score_away.objectName = "t_bet_score_away"
    @t_bet_score_away.geometry = Qt::Rect.new(180, 340, 91, 31)
    @label_8 = Qt::Label.new(@groupBox_4)
    @label_8.objectName = "label_8"
    @label_8.geometry = Qt::Rect.new(190, 320, 59, 15)
    @b_write_bet = Qt::PushButton.new(@groupBox_4)
    @b_write_bet.objectName = "b_write_bet"
    @b_write_bet.geometry = Qt::Rect.new(110, 410, 84, 25)
    @b_get_bet_games = Qt::PushButton.new(@groupBox_4)
    @b_get_bet_games.objectName = "b_get_bet_games"
    @b_get_bet_games.geometry = Qt::Rect.new(540, 50, 101, 25)
    @tabWidget.addTab(@tab_2, Qt::Application.translate("MainWindow", "Write bets", nil, Qt::Application::UnicodeUTF8))
    @tab_3 = Qt::Widget.new()
    @tab_3.objectName = "tab_3"
    @tab_3.enabled = true
    @groupBox_5 = Qt::GroupBox.new(@tab_3)
    @groupBox_5.objectName = "groupBox_5"
    @groupBox_5.geometry = Qt::Rect.new(10, 20, 741, 561)
    @t_result_games_by_date = Qt::TextEdit.new(@groupBox_5)
    @t_result_games_by_date.objectName = "t_result_games_by_date"
    @t_result_games_by_date.geometry = Qt::Rect.new(20, 50, 471, 211)
    @label_10 = Qt::Label.new(@groupBox_5)
    @label_10.objectName = "label_10"
    @label_10.geometry = Qt::Rect.new(20, 30, 59, 15)
    @label_9 = Qt::Label.new(@groupBox_5)
    @label_9.objectName = "label_9"
    @label_9.geometry = Qt::Rect.new(40, 290, 31, 16)
    @t_result_game = Qt::TextEdit.new(@groupBox_5)
    @t_result_game.objectName = "t_result_game"
    @t_result_game.geometry = Qt::Rect.new(70, 290, 61, 31)
    @t_result_score_home = Qt::TextEdit.new(@groupBox_5)
    @t_result_score_home.objectName = "t_result_score_home"
    @t_result_score_home.geometry = Qt::Rect.new(30, 350, 91, 31)
    @label_12 = Qt::Label.new(@groupBox_5)
    @label_12.objectName = "label_12"
    @label_12.geometry = Qt::Rect.new(30, 330, 59, 15)
    @label_11 = Qt::Label.new(@groupBox_5)
    @label_11.objectName = "label_11"
    @label_11.geometry = Qt::Rect.new(210, 330, 59, 15)
    @t_result_score_away = Qt::TextEdit.new(@groupBox_5)
    @t_result_score_away.objectName = "t_result_score_away"
    @t_result_score_away.geometry = Qt::Rect.new(210, 350, 91, 31)
    @b_write_result = Qt::PushButton.new(@groupBox_5)
    @b_write_result.objectName = "b_write_result"
    @b_write_result.geometry = Qt::Rect.new(120, 430, 84, 25)
    @b_get_result_games = Qt::PushButton.new(@groupBox_5)
    @b_get_result_games.objectName = "b_get_result_games"
    @b_get_result_games.geometry = Qt::Rect.new(550, 50, 91, 25)
    @t_result_additional_time = Qt::TextEdit.new(@groupBox_5)
    @t_result_additional_time.objectName = "t_result_additional_time"
    @t_result_additional_time.geometry = Qt::Rect.new(130, 390, 61, 31)
    @label_13 = Qt::Label.new(@groupBox_5)
    @label_13.objectName = "label_13"
    @label_13.geometry = Qt::Rect.new(130, 370, 71, 16)
    @tabWidget.addTab(@tab_3, Qt::Application.translate("MainWindow", "Write results", nil, Qt::Application::UnicodeUTF8))
    @tab_4 = Qt::Widget.new()
    @tab_4.objectName = "tab_4"
    @groupBox_2 = Qt::GroupBox.new(@tab_4)
    @groupBox_2.objectName = "groupBox_2"
    @groupBox_2.geometry = Qt::Rect.new(380, 40, 381, 551)
    @table_east_conference = Qt::TableWidget.new(@groupBox_2)
    @table_east_conference.objectName = "table_east_conference"
    @table_east_conference.geometry = Qt::Rect.new(20, 20, 341, 521)
    @groupBox_3 = Qt::GroupBox.new(@tab_4)
    @groupBox_3.objectName = "groupBox_3"
    @groupBox_3.geometry = Qt::Rect.new(10, 40, 351, 551)
    @list_west_conference = Qt::ListWidget.new(@groupBox_3)
    @list_west_conference.objectName = "list_west_conference"
    @list_west_conference.geometry = Qt::Rect.new(20, 20, 311, 511)
    @b_reload_tables_results = Qt::PushButton.new(@tab_4)
    @b_reload_tables_results.objectName = "b_reload_tables_results"
    @b_reload_tables_results.geometry = Qt::Rect.new(10, 10, 84, 25)
    @tabWidget.addTab(@tab_4, Qt::Application.translate("MainWindow", "Tables", nil, Qt::Application::UnicodeUTF8))
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @groupBox_6 = Qt::GroupBox.new(@tab)
    @groupBox_6.objectName = "groupBox_6"
    @groupBox_6.geometry = Qt::Rect.new(10, 20, 721, 531)
    @t_played_games = Qt::TextEdit.new(@groupBox_6)
    @t_played_games.objectName = "t_played_games"
    @t_played_games.enabled = false
    @t_played_games.geometry = Qt::Rect.new(130, 30, 241, 41)
    @b_get_my_stat = Qt::PushButton.new(@groupBox_6)
    @b_get_my_stat.objectName = "b_get_my_stat"
    @b_get_my_stat.geometry = Qt::Rect.new(510, 30, 84, 25)
    @label_14 = Qt::Label.new(@groupBox_6)
    @label_14.objectName = "label_14"
    @label_14.geometry = Qt::Rect.new(20, 50, 59, 15)
    @t_earned_points = Qt::TextEdit.new(@groupBox_6)
    @t_earned_points.objectName = "t_earned_points"
    @t_earned_points.enabled = false
    @t_earned_points.geometry = Qt::Rect.new(130, 80, 241, 41)
    @label_15 = Qt::Label.new(@groupBox_6)
    @label_15.objectName = "label_15"
    @label_15.geometry = Qt::Rect.new(20, 100, 59, 15)
    @label_16 = Qt::Label.new(@groupBox_6)
    @label_16.objectName = "label_16"
    @label_16.geometry = Qt::Rect.new(20, 170, 111, 16)
    @label_17 = Qt::Label.new(@groupBox_6)
    @label_17.objectName = "label_17"
    @label_17.geometry = Qt::Rect.new(160, 170, 131, 16)
    @label_18 = Qt::Label.new(@groupBox_6)
    @label_18.objectName = "label_18"
    @label_18.geometry = Qt::Rect.new(340, 170, 141, 16)
    @t_bet_score_q = Qt::TextEdit.new(@groupBox_6)
    @t_bet_score_q.objectName = "t_bet_score_q"
    @t_bet_score_q.enabled = false
    @t_bet_score_q.geometry = Qt::Rect.new(20, 190, 91, 31)
    @t_one_goal_q = Qt::TextEdit.new(@groupBox_6)
    @t_one_goal_q.objectName = "t_one_goal_q"
    @t_one_goal_q.enabled = false
    @t_one_goal_q.geometry = Qt::Rect.new(160, 190, 91, 31)
    @t_differend_q = Qt::TextEdit.new(@groupBox_6)
    @t_differend_q.objectName = "t_differend_q"
    @t_differend_q.enabled = false
    @t_differend_q.geometry = Qt::Rect.new(340, 190, 91, 31)
    @label_19 = Qt::Label.new(@groupBox_6)
    @label_19.objectName = "label_19"
    @label_19.geometry = Qt::Rect.new(30, 270, 171, 16)
    @label_20 = Qt::Label.new(@groupBox_6)
    @label_20.objectName = "label_20"
    @label_20.geometry = Qt::Rect.new(280, 270, 171, 16)
    @t_5_team_best = Qt::TextEdit.new(@groupBox_6)
    @t_5_team_best.objectName = "t_5_team_best"
    @t_5_team_best.enabled = false
    @t_5_team_best.geometry = Qt::Rect.new(30, 300, 171, 161)
    @t_5_team_worst = Qt::TextEdit.new(@groupBox_6)
    @t_5_team_worst.objectName = "t_5_team_worst"
    @t_5_team_worst.enabled = false
    @t_5_team_worst.geometry = Qt::Rect.new(280, 300, 171, 161)
    @tabWidget.addTab(@tab, Qt::Application.translate("MainWindow", "Stat by bet", nil, Qt::Application::UnicodeUTF8))
    @calendarWidget = Qt::CalendarWidget.new(@centralwidget)
    @calendarWidget.objectName = "calendarWidget"
    @calendarWidget.geometry = Qt::Rect.new(790, 30, 221, 231)
    @calendarWidget.locale = Qt::Locale.new(Qt::Locale::Russian, Qt::Locale::RussianFederation)
    @calendarWidget.minimumDate = Qt::Date.new(2014, 9, 4)
    @calendarWidget.maximumDate = Qt::Date.new(2015, 2, 27)
    @calendarWidget.firstDayOfWeek = Qt::Monday
    @d_text = Qt::PlainTextEdit.new(@centralwidget)
    @d_text.objectName = "d_text"
    @d_text.geometry = Qt::Rect.new(800, 270, 211, 31)
    @editor_window = Qt::TextEdit.new(@centralwidget)
    @editor_window.objectName = "editor_window"
    @editor_window.geometry = Qt::Rect.new(800, 320, 211, 281)
    @pushButton = Qt::PushButton.new(@centralwidget)
    @pushButton.objectName = "pushButton"
    @pushButton.geometry = Qt::Rect.new(810, 620, 84, 25)
    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 1028, 20)
    @menuMenu = Qt::Menu.new(@menubar)
    @menuMenu.objectName = "menuMenu"
    @menuBets = Qt::Menu.new(@menubar)
    @menuBets.objectName = "menuBets"
    @menuResults = Qt::Menu.new(@menubar)
    @menuResults.objectName = "menuResults"
    @menuTables = Qt::Menu.new(@menubar)
    @menuTables.objectName = "menuTables"
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

    @menubar.addAction(@menuMenu.menuAction())
    @menubar.addAction(@menuBets.menuAction())
    @menubar.addAction(@menuResults.menuAction())
    @menubar.addAction(@menuTables.menuAction())
    @menuMenu.addSeparator()
    @menuMenu.addAction(@a_open)
    @menuMenu.addAction(@a_close)
    @menuBets.addAction(@actionShow)
    @menuBets.addAction(@actionWrite)
    @menuResults.addAction(@actionShow_2)
    @menuResults.addAction(@actionWrite_2)
    @menuTables.addAction(@actionShow_3)

    retranslateUi(mainWindow)
    Qt::Object.connect(@b_close, SIGNAL('clicked()'), mainWindow, SLOT('close()'))
    Qt::Object.connect(@a_close, SIGNAL('activated()'), mainWindow, SLOT('close()'))

    @tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "MainWindow", nil, Qt::Application::UnicodeUTF8)
    @a_open.text = Qt::Application.translate("MainWindow", "open", nil, Qt::Application::UnicodeUTF8)
    @a_close.text = Qt::Application.translate("MainWindow", "close", nil, Qt::Application::UnicodeUTF8)
    @actionShow.text = Qt::Application.translate("MainWindow", "show", nil, Qt::Application::UnicodeUTF8)
    @actionWrite.text = Qt::Application.translate("MainWindow", "write", nil, Qt::Application::UnicodeUTF8)
    @actionShow_2.text = Qt::Application.translate("MainWindow", "show", nil, Qt::Application::UnicodeUTF8)
    @actionWrite_2.text = Qt::Application.translate("MainWindow", "write", nil, Qt::Application::UnicodeUTF8)
    @actionShow_3.text = Qt::Application.translate("MainWindow", "show", nil, Qt::Application::UnicodeUTF8)
    @b_close.text = Qt::Application.translate("MainWindow", "Close", nil, Qt::Application::UnicodeUTF8)
    @groupBox.title = Qt::Application.translate("MainWindow", "List", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("MainWindow", "Team 1", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("MainWindow", "Team 2", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("MainWindow", "Last 5 games HOME", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("MainWindow", "Last 5 games AWAY", nil, Qt::Application::UnicodeUTF8)
    @label_21.text = ''
    @label_22.text = ''
    @label_23.text = Qt::Application.translate("MainWindow", "Games between", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_1), Qt::Application.translate("MainWindow", "Compare and past games", nil, Qt::Application::UnicodeUTF8))
    @groupBox_4.title = Qt::Application.translate("MainWindow", "Bets", nil, Qt::Application::UnicodeUTF8)
    @label_5.text = Qt::Application.translate("MainWindow", "Games", nil, Qt::Application::UnicodeUTF8)
    @label_6.text = Qt::Application.translate("MainWindow", "Nr.", nil, Qt::Application::UnicodeUTF8)
    @label_7.text = Qt::Application.translate("MainWindow", "Home", nil, Qt::Application::UnicodeUTF8)
    @label_8.text = Qt::Application.translate("MainWindow", "Away", nil, Qt::Application::UnicodeUTF8)
    @b_write_bet.text = Qt::Application.translate("MainWindow", "Write", nil, Qt::Application::UnicodeUTF8)
    @b_get_bet_games.text = Qt::Application.translate("MainWindow", "Get games", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_2), Qt::Application.translate("MainWindow", "Write bets", nil, Qt::Application::UnicodeUTF8))
    @groupBox_5.title = Qt::Application.translate("MainWindow", "Results", nil, Qt::Application::UnicodeUTF8)
    @label_10.text = Qt::Application.translate("MainWindow", "Games", nil, Qt::Application::UnicodeUTF8)
    @label_9.text = Qt::Application.translate("MainWindow", "Nr.", nil, Qt::Application::UnicodeUTF8)
    @label_12.text = Qt::Application.translate("MainWindow", "Home", nil, Qt::Application::UnicodeUTF8)
    @label_11.text = Qt::Application.translate("MainWindow", "Away", nil, Qt::Application::UnicodeUTF8)
    @b_write_result.text = Qt::Application.translate("MainWindow", "Write", nil, Qt::Application::UnicodeUTF8)
    @b_get_result_games.text = Qt::Application.translate("MainWindow", "Get games", nil, Qt::Application::UnicodeUTF8)
    @label_13.text = Qt::Application.translate("MainWindow", "add time", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_3), Qt::Application.translate("MainWindow", "Write results", nil, Qt::Application::UnicodeUTF8))
    @groupBox_2.title = Qt::Application.translate("MainWindow", "East", nil, Qt::Application::UnicodeUTF8)
    if @table_east_conference.columnCount < 10
        @table_east_conference.columnCount = 10
    end

    __colItem = Qt::TableWidgetItem.new
    __colItem.setText(Qt::Application.translate("MainWindow", "title", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(0, __colItem)

    __colItem1 = Qt::TableWidgetItem.new
    __colItem1.setText(Qt::Application.translate("MainWindow", "games", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(1, __colItem1)

    __colItem2 = Qt::TableWidgetItem.new
    __colItem2.setText(Qt::Application.translate("MainWindow", "wo", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(2, __colItem2)

    __colItem3 = Qt::TableWidgetItem.new
    __colItem3.setText(Qt::Application.translate("MainWindow", "ws", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(3, __colItem3)

    __colItem4 = Qt::TableWidgetItem.new
    __colItem4.setText(Qt::Application.translate("MainWindow", "lo", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(4, __colItem4)

    __colItem5 = Qt::TableWidgetItem.new
    __colItem5.setText(Qt::Application.translate("MainWindow", "ls", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(5, __colItem5)

    __colItem6 = Qt::TableWidgetItem.new
    __colItem6.setText(Qt::Application.translate("MainWindow", "l", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(6, __colItem6)

    __colItem7 = Qt::TableWidgetItem.new
    __colItem7.setText(Qt::Application.translate("MainWindow", "\320\235\320\276\320\262\321\213\320\271 \321\201\321\202\320\276\320\273\320\261\320\265\321\206", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(7, __colItem7)

    __colItem8 = Qt::TableWidgetItem.new
    __colItem8.setText(Qt::Application.translate("MainWindow", "gs", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(8, __colItem8)

    __colItem9 = Qt::TableWidgetItem.new
    __colItem9.setText(Qt::Application.translate("MainWindow", "pts", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setHorizontalHeaderItem(9, __colItem9)
    if @table_east_conference.rowCount < 2
        @table_east_conference.rowCount = 2
    end

    __rowItem = Qt::TableWidgetItem.new
    __rowItem.setText(Qt::Application.translate("MainWindow", "1", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setVerticalHeaderItem(0, __rowItem)

    __rowItem1 = Qt::TableWidgetItem.new
    __rowItem1.setText(Qt::Application.translate("MainWindow", "2", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setVerticalHeaderItem(1, __rowItem1)

    __item = Qt::TableWidgetItem.new
    __item.setText(Qt::Application.translate("MainWindow", "Metlaurg", nil, Qt::Application::UnicodeUTF8))
    @table_east_conference.setItem(0, 0, __item)
    @groupBox_3.title = Qt::Application.translate("MainWindow", "West", nil, Qt::Application::UnicodeUTF8)
    @b_reload_tables_results.text = Qt::Application.translate("MainWindow", "reload", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_4), Qt::Application.translate("MainWindow", "Tables", nil, Qt::Application::UnicodeUTF8))
    @groupBox_6.title = Qt::Application.translate("MainWindow", "My stat by bet", nil, Qt::Application::UnicodeUTF8)
    @b_get_my_stat.text = Qt::Application.translate("MainWindow", "Get stat", nil, Qt::Application::UnicodeUTF8)
    @label_14.text = Qt::Application.translate("MainWindow", "games", nil, Qt::Application::UnicodeUTF8)
    @label_15.text = Qt::Application.translate("MainWindow", "points", nil, Qt::Application::UnicodeUTF8)
    @label_16.text = Qt::Application.translate("MainWindow", "Bet to scrore", nil, Qt::Application::UnicodeUTF8)
    @label_17.text = Qt::Application.translate("MainWindow", "Bet to one goal", nil, Qt::Application::UnicodeUTF8)
    @label_18.text = Qt::Application.translate("MainWindow", "Bet to different", nil, Qt::Application::UnicodeUTF8)
    @label_19.text = Qt::Application.translate("MainWindow", "Best 5 teams quesed", nil, Qt::Application::UnicodeUTF8)
    @label_20.text = Qt::Application.translate("MainWindow", "Worst 5 teams quesed", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab), Qt::Application.translate("MainWindow", "Stat by bet", nil, Qt::Application::UnicodeUTF8))
    @d_text.plainText = Qt::Application.translate("MainWindow", "2014.09.13", nil, Qt::Application::UnicodeUTF8)
    @pushButton.text = Qt::Application.translate("MainWindow", "Update", nil, Qt::Application::UnicodeUTF8)
    @menuMenu.title = Qt::Application.translate("MainWindow", "menu", nil, Qt::Application::UnicodeUTF8)
    @menuBets.title = Qt::Application.translate("MainWindow", "bets", nil, Qt::Application::UnicodeUTF8)
    @menuResults.title = Qt::Application.translate("MainWindow", "results", nil, Qt::Application::UnicodeUTF8)
    @menuTables.title = Qt::Application.translate("MainWindow", "tables", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    u = Ui_MainWindow.new
    w = Qt::MainWindow.new
    u.setupUi(w)
    w.show
    a.exec
end
