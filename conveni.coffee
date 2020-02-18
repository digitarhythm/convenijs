#=============================================================================
#
# JavaScript convenience library
#
# 2020.02.06 coded by Hajime Oh-yake
#
#=============================================================================

#=============================================================================
# GLOBAL METHOD
#
# remove element from Array
#=============================================================================
Array.prototype.remove = (xs, n = 1) ->
  @splice(xs, n)

class conveni
  #===========================================================================
  # constructor
  #===========================================================================
  constructor:(node_env='develop')->
    @node_env = node_env

  #===========================================================================
  # debug write
  #===========================================================================
  echo: (a, b...) ->
    if (@node_env == "develop")
      for data in b
        if (typeof(data) == 'object')
          data = JSON.stringify(data)
        a = a.replace('%@', data)
      console.log(a)

  #=========================================================================
  # format strings
  #=========================================================================
  sprintf: (a, b...) ->
    for data in b
      if (typeof(data) == 'object')
        data = JSON.stringify(data)
      match = a.match(/%0\d*@/)
      if (match?)
        repstr = match[0]
        num = parseInt(repstr.match(/\d+/))
        zero =""
        zero += "0" while (zero.length < num)
        data2 = (zero+data).substr(-num)
        a = a.replace(repstr, data2)
      else
        a = a.replace('%@', data)
    return a

  #=========================================================================
  # real copy for object
  #=========================================================================
  cpObj: (a)->
    return Object.assign({}, a)

  #=========================================================================
  # real copy for array
  #=========================================================================
  cpArr: (a)->
    return a.concat()

  #=========================================================================
  # return toggle
  #=========================================================================
  toggle: (value) ->
    return !value

  #=========================================================================
  # execute a number of times
  #=========================================================================
  exeFunc: (func, num = 1) ->
    for i in [0...num]
      func()

  #=========================================================================
  # time format to regular
  #=========================================================================
  regulartime:(str)->
    spl = str.split(" ")
    if (spl.length < 2)
      return undefined

    date = spl[0].split("/")
    if (date.length < 3)
      return undefined

    time = spl[1].split(":")
    if (time.length < 3)
      return undefined

    # 年月日の取得
    year   = parseInt(date[0])
    month  = parseInt(date[1])
    day    = parseInt(date[2])
    hour   = parseInt(time[0])
    minute = parseInt(time[1])
    second = parseInt(time[2])

    # 秒の正規化
    key = 60
    addminute = 0
    if (second >= key)
      addminute = Math.floor(second / key)
      second %= key
    else if (second < 0)
      second = key + second
      addminute--

    minute += addminute

    # 分の正規化
    key = 60
    addhour = 0
    if (minute >= key)
      addhour = Math.floor(minute / key)
      minute %= key
    else if (minute < 0)
      ninute = key + minute
      addhour--

    hour += addhour

    # 時の正規化
    key = 24
    addday = 0
    if (hour >= key)
      addday = Math.floor(hour / key)
      hour %= key
    else if (hour < 0)
      hour = key + hour
      addday--

    day += addday

    # 日の正規化
    addmonth = 0
    addyear = 0
    lastday = parseInt((new Date(year, month, 0)).toString().split(' ')[2])
    if (day > lastday)
      while (day > lastday)
        if (day > lastday)
          day -= lastday
          addmonth++
          if ((month + addmonth) > 12)
            addyear++
            addmonth -= 12
        lastday = parseInt((new Date(year+addyear, month+addmonth, 0)).toString().split(' ')[2])
    else if (day <= 0)
      checkmonth = month - 1
      checkyear = year
      if (checkmonth < 1)
        checkmonth = 12
        checkyear--
      lastday = parseInt((new Date(checkyear, checkmonth, 0)).toString().split(' ')[2])
      day = lastday + day
      addmonth--

    year += parseInt(addyear)
    month += parseInt(addmonth)

    # 月の正規化
    key = 12
    addyear = 0
    if (month > key)
      addyear = Math.floor(month / key)
      month %= key
    else if (month <= 0)
      month = key + month
      addyear--

    year += addyear

    ret =
      year:year
      month:("00"+parseInt(month)).slice(-2)
      day:("00"+parseInt(day)).slice(-2)
      hour:("00"+parseInt(hour)).slice(-2)
      minute:("00"+parseInt(minute)).slice(-2)
      second:("00"+parseInt(second)).slice(-2)

    return ret

module.exports = new conveni()

