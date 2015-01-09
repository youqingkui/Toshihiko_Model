# Toshihiko_Model
[Toshihiko](https://github.com/XadillaX/Toshihiko) 简单数据库模型生成器

### 第一步 修改config.js 配置数据库

```coffee
MYSQL =
  host:'localhost',
  userName:'root',
  password:''
  databases:'test'
```
### 第二步 修改app.js
```coffee
# you_table 替换成需要的表名
db.query "DESC you_table"
```

### 第三步 node app.js
```coffee
node app.js

# 输出
[
  {
    name: "region_id"
    type: T.Type.Integer
    defaultValue: null
    primaryKey: true
  }
  {
    name: "parent_id"
    type: T.Type.Integer
    defaultValue: "0"
    primaryKey: true
  }
  {
    name: "region_name"
    type: T.Type.String
    defaultValue: ""
  }
  {
    name: "region_type"
    type: T.Type.Integer
    defaultValue: "2"
    primaryKey: true
  }
  {
    name: "agency_id"
    type: T.Type.Integer
    defaultValue: "0"
    primaryKey: true
  }
  {
    name: "pinyin_name"
    type: T.Type.String
    defaultValue: ""
  }
  {
    name: "first_letter"
    type: T.Type.String
    defaultValue: ""
  }
]
```

我得通常使用
```coffee
T = require("toshihiko")
# 数据库连接配置
toshihiko = require("./toshihiko.js")

Region = toshihiko.define 'region',
  [
    {
      name: "region_id"
      type: T.Type.Integer
      primaryKey: true
    }
    {
      name: "parent_id"
      type: T.Type.Integer
      defaultValue: "0"
      primaryKey: true
    }
    {
      name: "region_name"
      type: T.Type.String
      defaultValue: ""
    }
    {
      name: "region_type"
      type: T.Type.Integer
      defaultValue: "2"
      primaryKey: true
    }
    {
      name: "agency_id"
      type: T.Type.Integer
      defaultValue: "0"
      primaryKey: true
    }
    {
      name: "pinyin_name"
      type: T.Type.String
      defaultValue: ""
    }
    {
      name: "first_letter"
      type: T.Type.String
      defaultValue: ""
    }
  ]

module.exports = Region
```

    
    
    
    
    
    


    