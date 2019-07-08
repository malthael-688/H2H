H2H-Doc-DBDD-v1.3

**数据库设计说明**

**版本： 1.3**

>   编写： *孟奇一*

>   校对： *孟奇一*

>   审核： *李宁生*

>   批准： *卢延悦*

**2019年7月**

**修订记录**

| **版本号** | **修订时间** | **修订内容**                                            | **提出人** | **审核人** | **是否通过** |
|------------|--------------|---------------------------------------------------------|------------|------------|--------------|
| **1.1**    | **7.2**      | **添加数据表，任务类别**                                | **宋昌**   | **卢延悦** | **是**       |
| **1.1**    | **7.2**      | **user列表中添加最后登录时间**                          | **宋昌**   | **卢延悦** | **是**       |
| **1.1**    | **7.2**      | **删除task中非必须属性**                                | **宋昌**   | **卢延悦** |              |
| **1.2**    | **7.3**      | **修改一些文档错误**                                    | **李宁生** | **李宁生** | **是**       |
| **1.2**    | **7.3**      | **在task中添加了新的属性 heatValue**                    | **宋昌**   | **李宁生** | **是**       |
| **1.3**    | **7.3**      | **数据表applicant改名为apply**                          | **陆韬韬** | **李宁生** | **是**       |
| **1.4**    | **7.5**      | **admin表项添加属性adminNum如果不添加无法进行数据交互** | **李宁生** | **李宁生** | **是**       |

**审核记录**

| **审核版本号** | **审核时间** | **审核内容**       | **审核问题** | **审核人** | **是否通过** |
|----------------|--------------|--------------------|--------------|------------|--------------|
| **1.1**        | **7.2**      | **数据项是否完善** | **无**       | **李宁生** | **是**       |
|                |              |                    |              |            |              |
|                |              |                    |              |            |              |
|                |              |                    |              |            |              |
|                |              |                    |              |            |              |
|                |              |                    |              |            |              |

1.  **用户类**

Java：User

Mysql：User

数据库表格：

| 属性         | 命名            | Java类型 | Sql类型 | 状态信息描述                   | 键值 |
|--------------|-----------------|----------|---------|--------------------------------|------|
| 学号         | num             | long     | long    |                                | 主键 |
| 密码         | password        | String   | varchar |                                |      |
| 联系方式     | phone           | String   | varchar |                                |      |
| 邮箱         | email           | String   | varchar |                                |      |
| 信誉值       | creditScore     | int      | int     | Max:100 min:0,为0封号          |      |
| 姓名         | name            | String   | varchar |                                |      |
| 积分         | points          | int      | int     |                                |      |
| 账号状态     | userState       | int      | int     | 0：未封号，1：已封号 2：已删除 |      |
| 发布任务数   | releasedTaskNum | int      | int     |                                |      |
| 完成任务数   | finishedTaskNum | Int      | int     |                                |      |
| 放弃任务书   | giveUpTaskNum   | int      | int     |                                |      |
| 最后登录时间 | lastLoginDate   | String   | varchar |                                |      |

1.  **任务类**

**Java：Task**

**Mysql：Task**

**数据库表格：**

| 属性       | 命名         | Java类型 | Sql类型 | 状态信息描述                                                                              | 键值       |
|------------|--------------|----------|---------|-------------------------------------------------------------------------------------------|------------|
| 任务ID     | taskID       | int      | int     |                                                                                           | 主键，自增 |
| 任务标题   | title        | String   | varchar |                                                                                           |            |
| 任务描述   | description  | String   | varchar |                                                                                           |            |
| 类型       | type         | String   | varchar |                                                                                           |            |
| 悬赏分     | rewardPoints | int      | Int     |                                                                                           |            |
| 开始时间   | startTime    | String   | varchar |                                                                                           |            |
| 截止时间   | deadLine     | String   | carchar |                                                                                           |            |
| 发布人学号 | publisherNum | long     | long    |                                                                                           | 外键       |
| 领取人学号 | receiverNum  | long     | long    |                                                                                           | 外键       |
| 状态       | taskState    | int      | int     | 0:未审核，1：审核未通过，2：审核通过，3：执行中，4：已提交，5：已验收 6：已失效 7：已删除 |            |
| 热度       | heatValue    | Int      | int     |                                                                                           |            |

1.  **评论**

**Java:Comment**

**Mysql:Comment**

| 属性     | 命名           | Java类型 | Sql类型 | 状态信息描述 | 键值       |
|----------|----------------|----------|---------|--------------|------------|
| 评论ID   | commentID      | int      | int     |              | 主键，自增 |
| 评论人   | commentatorNum | long     | long    |              | 外键       |
| 内容     | content        | String   | varchar |              |            |
| 任务ID   | taskID         | Int      | int     |              | 外键       |
| 发表时间 | time           | String   | varchar |              |            |

1.  **预约人**

**java:Applicant**

**Mysql:Applicant**

| 属性     | 命名         | Java类型 | Sql类型 | 状态信息描述 | 键值       |
|----------|--------------|----------|---------|--------------|------------|
| ID       | id           | int      | int     |              | 主键，自增 |
| 任务编号 | taskID       | int      | Int     |              | 外键       |
| 预约人   | applicantNum | long     | long    |              | 外键       |

1.  **管理员**

**Java:Admin**

**Mysql:Admin**

| 属性 | 命名     | Java类型 | Sql类型 | 状态信息描述 | 键值 |
|------|----------|----------|---------|--------------|------|
| 账号 | adminNum | long     | long    |              | 主键 |
| 名字 | name     | String   | Varchar |              | 主键 |
| 密码 | password | String   | varchar |              |      |
| 邮箱 | email    | String   | varchar |              |      |

1.  **消息**

**Java： Message**

**Mysql：Message**

| 属性     | 命名         | Java类型 | Sql类型 | 状态信息描述    | 键值       |
|----------|--------------|----------|---------|-----------------|------------|
| 消息ID   | messageID    | int      | int     |                 | 主键，自增 |
| 发送人   | senderNum    | long     | long    |                 | 外键       |
| 接收人   | receiverNum  | Long     | long    |                 | 外键       |
| 内容     | content      | String   | varchar |                 |            |
| 发送时间 | time         | String   | Varchar |                 |            |
| 消息状态 | messageState | int      | int     | 0:未读，1：已读 |            |

1.  **公告**

**Java：Notice**

**Mysql：Notice**

| 属性     | 命名     | Java类型 | Sql类型 | 状态信息描述 | 键值       |
|----------|----------|----------|---------|--------------|------------|
| 公告ID   | noticeID | Int      | int     |              | 主键，自增 |
| 标题     | title    | String   | varchar |              |            |
| 内容     | content  | String   | varchar |              |            |
| 发布时间 | time     | String   | varchar |              |            |

1.  **任务类型**

**Java：TaskType**

**Mysql：TaskType**

| 属性     | 命名 | Java类型 | Sql类型 | 状态信息描述 | 键值 |
|----------|------|----------|---------|--------------|------|
| 任务类型 | type | String   | varchar |              |      |

1.  **参数类型**

**Java:Param**

**Mysql:param**

| 属性   | 命名  | Java类型 | Sql类型 | 状态信息描述 | 键值 |
|--------|-------|----------|---------|--------------|------|
| 参数ID | id    | int      | int     |              | 主键 |
| 数值   | point | int      | int     |              |      |
