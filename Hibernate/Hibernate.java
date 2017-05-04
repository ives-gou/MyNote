/**
 *  @Author: GPJ
 *  Desc: Hibernate 框架笔记
 *  Time: 2017-04-22
 */
ORM => 对象关系映射

一、Hibernate 常用配置
    hibernate.cfg.xml 常用配置

    hibernate.show_sql       => 是否把 Hibernate 运行时的 SQL语句 输出到控制台，编码阶段便于测试;
    hibernate.format_sql     => 输出到控制台的 SQL语句 是否进行排版，便于阅读。建议设置为 true;
    hbm2ddl.auto             => 可以帮助由 JAVA代码 生成数据库脚本，进而生成具体的表结构。CREATE|UPDATE|CREATE_DROP|VALIDATE;
    hibernate.default_schema => 默认数据库前缀
    hibernate.dialect        => 配置 Hibernate 数据库方言，Hibernate 可针对特殊的数据库进行优化


二、Session 使用
    * 获取 session 对象
        1: openSession
        2: getCurrentSession

        注：如果使用 getCurrentSession 需要在hibernate.cfg.xml文件中进行配置
            如果是本地事务(jdbc 事务)
                <property name="hibernate.current_session_context_class">thread</property>
            如果是全局事务(jta 事务)
                <proerty name="hibernate.current_session_context_class">jta</proerty>

    * openSession 与 getCurrentSession 的区别
        1: getCurrentSession 在事务提交或回滚之后会自动关闭，openSession 需要手动关闭。
           如果使用 openSession 而没有手动关闭，多次之后对导致连接池溢出。
        2: openSession 每次创建新的session 对象，getCurrentSession使用现有的session对象。 

三、单表 CRUD 操作  
    * save
    * update
    * delete
    * get/load (查询单个记录)
        注：get 与 load区别
            1: 在不考虑缓存的情况下，
                get 方法会在调用之后立即向数据库发型 sql 语句，返回持久化对象。
                load 方法会在调用后返回一个代理对象。 该代理对象只保存了实体对象的id, 直到使用
                    该对象的非主键属性时才会发出sql语句。
            2: 查询数据库中不存在的数据时，
                get 方法返回null,
                load 方法抛出异常org.hibernate.ObjectNotFoundException;

四、Hibernate 开发基本步骤
    1: 编写配置文档 hibernate.cfg.xml
    2: 编写实体类
    3: 生成对应实体类的映射文件并添加到配置文档中
    4: 调用 Hibernate API 进行测试
