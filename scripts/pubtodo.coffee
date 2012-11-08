console.log 'pub todo'


addItem = ->
    listItem = document.createElement 'li'
    todoList = document.getElementById 'todo-list'
    todoText = document.createTextNode document.getElementById('new-todo').value 
    todoList.appendChild(listItem).appendChild todoText

pubberInit = ->
    app.pubber 'newItem', addItem()
    
bindKeypress = ->
    
    
pubberInit()

keyDetected = (event) ->
    addItem() if event.keyCode == 13

todo = document.getElementById 'new-todo'

todo.addEventListener 'keypress', keyDetected

