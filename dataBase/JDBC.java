/**
 * @Author GPJ
 * Aim: JDBC 学习笔记
 * Time : 2017-04-27
 */


一、JDBC 简介
    JDBC是 sun 公司为了统一和简化数据库的一套接口规范。

    常用数据库 URL 地址写法
    URL 主协议:子协议:[]:主机:端口:数据库
    Oralce:    "jdbc:oralce:thin:@localhost:1521:sid"
    SqlServer: "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=sid"
    Mysql:     "jdbc:mysql://localhost:3306/sid"

二、通过 DriverManager 连接数据库
    * 注册驱动
    * 获取连接

三、Connection 接口
    * Statement createStatement()   创建 sql 语句的执行环境
        Statement 常用方法
            int executeQuery( sql );         -- 执行select 语句
            ResultSet executeUpdate( sql );  -- 执行 DML、DDL 语句 

四、如何编写JDBC程序
    1: 注册驱动
        推荐使用 Class.forName("");
    2: 获取连接Connection
        Connection conn = DriverManager.getConnection();
    3: 使用连接 获取sql 语句执行环境
        Statement st = conn.createStatement();
    4: 执行 sql 语句
    5: 清理资源

五、事务的隔离级别
    1: 脏读
        * 含义: '一个事务 读取到了另外一个事务中没有提交的数据'
    2: 不可重复读
        * 含义: '一个事务在开始时读取了一个数据，在这个事务读取的过程中，有别的事务修改了这个数据；
                则在这个事务中再次读取数据时，发现数据发生了改变；'
    3: 幻读
        * 含义: '一个事务对一份数据进行统计影响了相关数据，但是数据表中发生了数据的增删，影响了之前统计结果；'


    为了处理上面3个问题，数据库中引入了相应事务级别
    Connection.TRANSACTION_NONE;
    Connection.TRANSACTION_READ_COMMITTED;
    Connection.TRANSACTION_READ_UNCOMMITTED;
    Connection.TRANSACTION_REPEATABLE_READ;
    Connection.TRANSACTION_SERIALIZABLE;

    如：conn.setTransactionIsolation(conn.TRANSACTION_SERIALIZABLE);


