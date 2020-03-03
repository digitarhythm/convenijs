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
    # 日付と時刻を分ける
    spl = str.split(" ")
    if (spl.length < 2)
      return undefined

    # 日付を年月日に分割
    date = spl[0].split("/")
    if (date.length < 3)
      return undefined

    # 時刻を時分秒に分割
    time = spl[1].split(":")
    if (time.length < 3)
      return undefined

    # 年月日自分秒の取得
    year   = parseInt(date[0])
    month  = parseInt(date[1])-1
    today  = parseInt(date[2])
    hour   = parseInt(time[0])
    minute = parseInt(time[1])
    second = parseInt(time[2])

    result = new Date(year, month, today, hour, minute, second)
    year   = result.getFullYear()
    month  = result.getMonth()+1
    today  = result.getDate()
    hour   = result.getHours()
    minute = result.getMinutes()
    second = result.getSeconds()

    ret =
      year:year
      month:("00"+parseInt(month)).slice(-2)
      day:("00"+parseInt(today)).slice(-2)
      hour:("00"+parseInt(hour)).slice(-2)
      minute:("00"+parseInt(minute)).slice(-2)
      second:("00"+parseInt(second)).slice(-2)

    return ret

  #=========================================================================
  # document.getElementById
  #=========================================================================
  getElm:(elm)->
    return document.getElementById(elm)

module.exports = new conveni()

