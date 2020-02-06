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
  constructor:->

  #===========================================================================
  # debug write
  #===========================================================================
  echo: (a, b...) ->
    if (node_env == "develop")
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

