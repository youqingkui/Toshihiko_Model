mysql  = require("mysql")
config = require("./config")
connection = mysql.createConnection
  host:config.host
  user:config.userName
  password:config.password
  database:config.databases

connection.connect (err) ->
  if err
    return console.log 'error connecting: ' + err.stack

#  console.log('connected as id ' + connection.threadId);



module.exports = connection
