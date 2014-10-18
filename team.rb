class Team
    def initialize(inp, conference, division)
      @title=inp
      @conference = conference
      @division = division
      @games = 0
      @wins = 0
      @winss = 0
      @winso = 0
      @lost = 0
      @losto = 0
      @losts = 0
      @goalss = 0
      @goalso = 0
      @points = 0
    end
    
    def title
      @title
    end
    
    def title=(title)
      @title=title
    end
    
    def games
      @games
    end
    
    def games=(games)
      @games=games
    end
    
    def wins
      @wins
    end
    
    def wins=(wins)
      @wins=wins
    end
    
    def winso
      @winso
    end
    
    def winso=(winso)
      @winso=winso
    end
    
    def winss
      @winss
    end
    
    def winss=(winss)
      @wins=winss
    end
    
    def lost
      @lost
    end
    
    def lost=(lost)
      @lost=lost
    end
    
    def losts
      @losts
    end
    
    def losts=(losts)
      @losts=losts
    end
    
    def losto
      @losto
    end
    
    def losto=(losto)
      @losto=lostso
    end
    
    def goalss
      @goalss
    end
    
    def goalss=(goalss)
      @goalss=goalss
    end
    
    def goalso
      @goalso
    end
    
    def goalso=(goalso)
      @goalso=goalso
    end
    
    def points
      @points
    end
    
    def points=(points)
      @points=points
    end
    
    def conference
      @conference
    end
    
    def conference=(conference)
      @conference=conference
    end
    
    def division
      @division
    end
    
    def division=(division)
      @division=division
    end

    def report()
      return " #{@title}"
    end
    
    def SetStat(games,wins,wins_o,wins_s,losts_o,losts_s,losts,goals_scored,goals_offered,points)
      if games != nil
        @games=games
      end
      if wins != nil
        @wins=wins
      end
      if wins_o != nil
        @winso=wins_o
      end
      if wins_s != nil
        @winss=wins_s
      end
      if losts_o != nil
        @lostso=losts_o
      end
      if losts_s != nil
        @lostss=losts_s
      end
      if losts != nil
        @losts=losts
      end
      if goals_scored != nil
        @goalss=goals_scored
      end
      if goals_offered != nil
        @goalso=goals_offered
      end
      if points != nil
        @points=points
      end
    end
    
    def getValue(check)
      result = ''
      if check == "title"
        result = @title
      end
      return result
    end
end

def createTeams()
  teams = {}
  teams["АВГ"]=Team.new("Авангард", "Восток", "Дивизион Чернышева")
  teams["АВТ"]=Team.new("Автомобилист", "Восток", "Дивизион Харламова")
  teams["АДМ"]=Team.new("Адмирал", "Восток", "Дивизион Чернышева")
  teams["АКБ"]=Team.new("Ак Барс", "Восток", "Дивизион Харламова")
  teams["АМР"]=Team.new("Амур", "Восток", "Дивизион Чернышева")
  teams["АТЛ"]=Team.new("Атлант", "Запад", "Дивизион Боброва")
  teams["БРС"]=Team.new("Барыс", "Восток", "Дивизион Чернышева")
  teams["ВТЗ"]=Team.new("Витязь", "Запад", "Дивизион Тарасова")
  teams["ДМН"]=Team.new("Динамо Мн", "Запад", "Дивизион Боброва")
  teams["ДМС"]=Team.new("Динамо Мск", "Запад", "Дивизион Тарасова")
  teams["ДРИ"]=Team.new("Динамо Р", "Запад", "Дивизион Боброва")
  teams["ЙКХ"]=Team.new("Йокерит", "Запад", "Дивизион Боброва")
  teams["ЛДТ"]=Team.new("Лада", "Восток", "Дивизион Харламова")
  teams["ЛКЯ"]=Team.new("Локомотив", "Запад", "Дивизион Тарасова")
  teams["МДЗ"]=Team.new("Медвешчак", "Запад", "Дивизион Боброва")
  teams["ММГ"]=Team.new("Металлург Мг", "Восток", "Дивизион Харламова")
  teams["МНК"]=Team.new("Металлург Нк", "Восток", "Дивизион Чернышева")
  teams["НФН"]=Team.new("Нефтехимик", "Восток", "Дивизион Харламова")
  teams["СКА"]=Team.new("СКА", "Запад", "Дивизион Боброва")
  teams["СЛВ"]=Team.new("Салават Юлаев", "Восток", "Дивизион Чернышева")
  teams["СВЧ"]=Team.new("Северсталь", "Запад", "Дивизион Тарасова")
  teams["СБН"]=Team.new("Сибирь", "Восток", "Дивизион Чернышева")
  teams["СЛБ"]=Team.new("Слован", "Запад", "Дивизион Боброва")
  teams["ТРП"]=Team.new("Торпедо", "Запад", "Дивизион Тарасова")
  teams["ТРК"]=Team.new("Трактор", "Восток", "Дивизион Харламова")
  teams["ХСЧ"]=Team.new("Сочи", "Запад", "Дивизион Тарасова")
  teams["ЦСК"]=Team.new("ЦСКА", "Запад", "Дивизион Тарасова")
  teams["ЮГР"]=Team.new("Югра", "Восток", "Дивизион Харламова")
  
  return teams
end

