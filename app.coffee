$ ->
  simonArray = []
  userArray = []
  clickCounter = 0
  levelCounter = 1


  addToSimonArray = ->
    min = 0
    max = 3
    x = Math.floor(Math.random() * (max - min + 1)) + min
    simonArray.push x
    # simonArray = [1,2,3,0]

  resetGame = ->
    simonArray = []
    userArray = []
    clickCounter = 0
    levelCounter = 1
    addToSimonArray()




  endGame = ->
    console.log "Game Over"
    resetGame()

  checkChoice = (userArray, simonArray)->
    console.log "User Array: " + userArray
    console.log "Simon Array: " + simonArray
    console.log "click counter: " + clickCounter
    console.log "Level: " + levelCounter

    if userArray[clickCounter] == simonArray[clickCounter] && userArray.length == simonArray.length
      newLevel()

    else if userArray[clickCounter] == simonArray[clickCounter]
      console.log "Correct Click"
      clickCounter++

    else
      endGame()

  flashButton = (i) ->

    if i == 0
        $("#button-0").removeClass('green').delay(50).queue (next) ->
          $(@).addClass('green')
          next()
        $("#button-0").addClass('greenFlash').delay(50).queue (next) ->
          $(@).removeClass('greenFlash')
          next()

      else if i == 1
        $("#button-1").removeClass('yellow').delay(50).queue (next) ->
          $(@).addClass('yellow')
          next()
        $("#button-1").addClass('yellowFlash').delay(50).queue (next) ->
          $(@).removeClass('yellowFlash')
          next()

      else if i == 2
        $("#button-2").removeClass('red').delay(50).queue (next) ->
          $(@).addClass('red')
          next()
        $("#button-2").addClass('redFlash').delay(50).queue (next) ->
          $(@).removeClass('redFlash')
          next()

      else
        $("#button-3").removeClass('blue').delay(50).queue (next) ->
          $(@).addClass('blue')
          next()
        $("#button-3").addClass('blueFlash').delay(50).queue (next) ->
          $(@).removeClass('blueFlash')
          next()


  flashSimon = (simonArray)->

    i = 0
    max = simonArray.length - 1
    delay = 1000

    run = ->
      if simonArray[i] == 0
        $("#button-0").removeClass('green').delay(500).queue (next) ->
          $(@).addClass('green')
          next()
        $("#button-0").addClass('greenFlash').delay(500).queue (next) ->
          $(@).removeClass('greenFlash')
          next()

      else if simonArray[i] == 1
        $("#button-1").removeClass('yellow').delay(500).queue (next) ->
          $(@).addClass('yellow')
          next()
        $("#button-1").addClass('yellowFlash').delay(500).queue (next) ->
          $(@).removeClass('yellowFlash')
          next()

      else if simonArray[i] == 2
        $("#button-2").removeClass('red').delay(500).queue (next) ->
          $(@).addClass('red')
          next()
        $("#button-2").addClass('redFlash').delay(500).queue (next) ->
          $(@).removeClass('redFlash')
          next()

      else
        $("#button-3").removeClass('blue').delay(500).queue (next) ->
          $(@).addClass('blue')
          next()
        $("#button-3").addClass('blueFlash').delay(500).queue (next) ->
          $(@).removeClass('blueFlash')
          next()

      if i++ < max
        setTimeout(run, delay)

    run()
    false

  newLevel = ->
    levelCounter++
    $(".level-counter").text(levelCounter)
    userArray = []
    clickCounter = 0
    addToSimonArray()
    flashSimon(simonArray)
    console.log "Won Level!"
    console.log "User Array: " + userArray
    console.log "Simon Array: " + simonArray
    console.log "click counter: " + clickCounter
    console.log "Level: " + levelCounter

  runLevel = ->

    # setTimeout flashSimon(simonArray)  1000
    console.log "Waiting for click"
    flashSimon(simonArray)

    $(".game-button").on "click" , (e) ->

      choice = parseInt ($(@).data('index'))
      flashButton(choice)
      userArray.push choice
      checkChoice(userArray, simonArray)


  $('#start-game').on 'click', (e) ->
    resetGame()
    $(".level-counter").text(levelCounter)
    $(@).hide()
    runLevel()












  # clearUserArray: ->

  # #display pattern with lights
  # runLevel: ->
  #   addToSimonArray()
  #   #flash buttons in simonArray
  #   #tell user it's their turn
  #   clickCounter = 0

  #   if win
  #     clearUserArray()
  #   addToSimonArray()
  #   #set userArray to null
  #   userArray = []

  #   checkChoice: (choice) ->
  #     if userArray([clickCounter]) == simonArray[(clickCounter)]
  #       true
  #     else
  #       endGame()




  #   #1.add data-index of button clicked to userArray
  #   #2 check the value of that index with the same index in simonArray
  #   # if true
  #   # else endGame

  #   #once userArray.length = simonArray.length, level complete, add new number to simonArray

  # endGame: ->

  # clearGame: ->




  # #Add to User Array - when user clicks a game-button, add the data-index of that button to the array userArray
  # #value in index(x) of UserArray == value in index(x) of simonArray