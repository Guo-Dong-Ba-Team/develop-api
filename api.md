#1. 数据库表格
注：PK表示Primary Key，即主键

##商家信息business_info
1. 用户名 name: string(手机号或者邮箱) PK
2. 登录方式 login_type: bool 用手机登陆还是用邮箱登陆（0为手机）
3. 手机号 phone_num string 
4. 邮箱 email string 
5. 密码 password string

##场地信息gym_info
1. 场地拥有者 owner 以business_user表格的user_name为外键
2. 名称 name string  PK
3. 场馆类型： type int (0: 羽毛球馆，1：乒乓球馆，2：篮球馆，3：健身馆，4：桌球馆，5:游泳馆)
4. 地址 address string
5. 图片 image string,保存图片在服务器上的地址
6. 开放时间 open_time string 
7. 单价 single_price float 
8. 会员(包月)价格 vip_price float
9. 打折信息 discount float, 如0.58表示58折优惠
10. 运动设施描述 hardware string
11. 服务设施描述 service string

##app端用户信息customer_info
1. 用户名 user_name string 
2. 密码 password string 
3. 手机号 phone_num string PK
4. 是否登录 login_flag bool

##订单信息order_info
1. 下单的客户 user customer_info 表格user_name的外键
2. 预订的场馆名称  gym_name gym_info 表格的name的外键
3. 下单时间 order_time date
4. 订单状态： order_status int (3种，未消费，已消费，已取消) 
5. 订单支付金额 order_money float


#2. app后台和app前端数据接口-JSON格式

##后台向前端发送场馆信息的格式：
1.gym_info_brief 简要信息，在主页和场馆列表中展示
{
'name': 'string',
'address','string'
'image':'string',
'single_price':'float',
'vip_price':'float',
'discount': 'float'
}

2.gym_info_detail: 详细信息，在场馆详情页面中展示
{
'owner': 'string'
'name': 'string',
'address','string'
'image':'string',
'open_time', 'string',
'single_price':'float',
'vip_price':'float',
'discount': 'float',
'hardware' 'string',
'service': 'string'
}

## 前台向后台请求加载场馆信息的格式：
1. 请求简要信息： 'gym_info_brief'
2. 请求详细信息： 'gym_info_detail'
3. 请求某一类场馆： 'gym_info_brief'+JSON{'type': 'int'}

## 前台向后台发送用户登录或注册信息的格式：
{
'user_name':'string',
'phone_num': 'string'
}

用户登录与否的login_flag保存在本地

## 每次登录时服务器返回给前端的信息：
{'login_result':'int'},0:登录成功，1：用户名不存在，2：密码不正确

## 前端向服务器发送订单的格式：
同订单表格信息

## 后端向前端发送用户的所有订单
{
'order_num': 'int',
{第一条订单},
{第二条订单},
{第三条订单},
...
}


#3. web前端和后端数据格式
## 商家注册页面数据格式
### 手机注册
1. 用户名 p_username
2. 手机号 p_username
3. 密码 p_password
4. 再次输入的密码 p_re_password(只用于前端验证，不发送)

### 邮箱注册
1. 用户名 m_username
2. 邮箱地址 m_username
3. 密码 m_password
4. 再次输入的密码 m_re_password(只用于前端验证，不发送)

##商家登录页面数据格式
1. 用户名 username(手机号或者邮箱)
2. 密码 password
