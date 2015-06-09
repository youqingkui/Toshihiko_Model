# Toshihiko-Model
[Toshihiko](https://github.com/XadillaX/Toshihiko) 简单数据库模型生成器

### 安装

`npm install toshihiko-model -g`

### 使用参数
`-h 数据库主机地址，默认localhost`
`-u 数据库用户名，默认root`
`-p 数据库密码，默认为空`
`-d 要使用的数据库名， 必填参数`
`-t 要生成模型的数据库表，必填`
### 使用 

使用默认数据库选择
`toshihiko-model -d dbName -t tableName`

使用指定数据库配置
`toshihiko-model -h hostName -u username -p pwd -d dbName -t tableName`


```coffee

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

通常使用
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

    
    
    
    
    
    


    