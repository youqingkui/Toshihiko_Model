db = require("./mysql")
js2coffee = require('js2coffee')
argv = require('optimist').argv



class Model
  constructor:(@tableName) ->


  descSql:() ->
    self = @

    db.query "DESC #{self.tableName}", (err, row) ->
      return console.log err if err

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




m = new Model('note')
m.descSql()

#db.query "DESC note",
#  (err, row) ->
#    if err
#      return console.log err
#
#    code = []
#    console.log row
#    for i in row
#      tmp = {}
#      tmp["name"] = i.Field
#      tmp["type"] = checkType(i.Type)
#      tmp["defaultValue"] = i.Default
#      if i.Key is 'PRI'
#        tmp["primaryKey"] = true
#        delete tmp["defaultValue"]
#
#      code.push tmp
#
#
#    js = (JSON.stringify(code))
#    # 格式化代码
#    content = js2coffee.build(js, {show_src_lineno: false, indent: "  "})
#    end = filterType(content)
#    console.log(end)
#
#
#
#
#
## 得到字段类型
#checkType = (test) ->
#  if test.indexOf("int") > -1
#    return 'T.Type.Integer'
#
#  if test.indexOf("char") > -1
#    return 'T.Type.String'
#
#  if test.indexOf("decimal") > -1
#    return 'T.Type.Float'
#
#  if test.indexOf("text") > -1
#    return 'T.Type.Json'
#
#  return 'T.Type.String'
#
## 去除输出'T.Type.Integer' ''
#filterType = (test) ->
#  one = test.replace(/"T.Type.Integer"/g,"T.Type.Integer")
#  tow = one.replace(/"T.Type.String"/g,"T.Type.String")
#  three = tow.replace(/"T.Type.Float"/g, "T.Type.Float")
#
#  return three



