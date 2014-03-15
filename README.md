Backlog Tool
============

Commands
--------

```
export BACKLOG_PATH=PATH_TO_BACKLOG || $HOME/.backlog

# call next tuesday
backlog next tuesday 

# add something to today's todo list
backlog -t "Start element" 

# check for a match of this task in the todo
backlog -c "Today" 
  
# work on todays backlog - open with edtior
backlog 

# archive everything previous to today
backlog a
backlog archive


```

Temporary Development Notes
---------------------------

* use aruba/cucumber for easy testing of cli tools
* use haml for template
* markdown parsing?




