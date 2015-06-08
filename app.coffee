mysql  = require("mysql")
js2coffee = require('js2coffee')
argv = require('optimist').argv



class Model
  constructor:(@h='localhost', @u='root', @p='', @d='', @tableName) ->


  connect:(cb) ->
    self = @

    connection = mysql.createConnection
      host:self.h
      user:self.u
      password:self.p
      database:self.d

    connection.connect (err) ->
      if err
        console.log "连接MySQL错误"
        return console.log 'error connecting: ' + err.stack


      cb(connection)




  descSql:(db) ->
    self = @
    sql = "DESC #{self.tableName}"
    db.query sql, (err, row) ->
      console.log "SQL =>",sql
      if err
        db.end()
        return console.log err

      code = []
      for i in row
        tmp = {}
        tmp["name"] = i.Field
        tmp["type"] = self.checkType(i.Type)
        tmp["defaultValue"] = i.Default
        if i.Key is 'PRI'
          tmp["primaryKey"] = true
          delete tmp["defaultValue"]

        code.push(tmp)

      js = (JSON.stringify(code))
      # 格式化代码
      content = js2coffee.build(js, {show_src_lineno: false, indent: "  "})
      end = self.filterType(content)
      console.log(end)
      db.end()


  # 得到字段类型
  checkType:(test) ->
    if test.indexOf("int") > -1
      return 'T.Type.Integer'

    if test.indexOf("char") > -1
      return 'T.Type.String'

    if test.indexOf("decimal") > -1
      return 'T.Type.Float'

    if test.indexOf("text") > -1
      return 'T.Type.Json'

    return 'T.Type.String'


  # 去除输出'T.Type.Integer' ''
  filterType:(test) ->
    one = test.replace(/"T.Type.Integer"/g,"T.Type.Integer")
    tow = one.replace(/"T.Type.String"/g,"T.Type.String")
    three = tow.replace(/"T.Type.Float"/g, "T.Type.Float")
    four = three.replace(/"T.Type.Json"/g, "T.Type.Json")

    return four

h = argv.h
u = argv.u
p = argv.p
d = argv.d
t = argv.t
if not t or not d
  return console.log "请输入要选择的数据库和要选择的表"

m = new Model(h, u, p, d, t)
m.connect (db) ->
  m.descSql(db)





