/**
 * @Author: GPJ
 */

一、 简介 
        数据库访问相关的技术
        * JDBC        java中访问数据库技术
        * proc/c++    c和c++访问数据库的技术
        * odbc        微软提供的访问数据库的技术
        * PL/SQL       oralce 中的数据库内部访问的技术 （其他数据库中叫做存储过程）

二、特点
        * 结构化(SQL STRUCT QUERY LANGUANGE)
        * ORACLE 中不同版本之间可以互相移植 9i-10g-11g
        * 良好的可维护性 (对sql的逻辑进行了封装)
        * 提升了体统性能 (大部分的工作在数据库内部完成)

        不能像异构数据库移植

三、PL/SQL扩展了sql
        * 变量、类型
        * 控制语句 if for
        * 过程 和 函数
        * 对象 和 方法

四、PL/SQL 程序结构
        declare 
            声明区
              用来定义变量 和 类型的
        begin
            执行区
              执行 sql语句 和 plsql语句
        exception
            异常处理区
              出了异常 就好自动进入这个区域
        end;
    
五、PL/SQL的开发环境
        SQLPLUS 命令行下的开发工具
        sqldeveloper 图形化开发工具

六、PLSQL开发程序
    * 设置服务端的输出为打开状态
        set serveroutput on
    * 变量类型
        sql 中的基本类型
            number varchar2 varchar date
        plsql 增加了一些基本类型
            boolean true false null binary_integer
        plsql 的复合类型
            record table cursor(游标类型)
        plsql 的引用类型
            ref
        plsql 中的大类型
            blob(存储大二进制) clob(存储字符类型)

        例：
            set serveroutput on;
            declare 
              id s_emp.id%type;
              first_name s_emp.first_name%type;
              salary s_emp.salary%type;
            begin
              select id,first_name,salary into id,first_name,salary from s_emp where id = 3;
                 dbms_output.put_line(id||','||first_name||','||salary);    
            end;

    * record 类型
        type 类型名 is record (
            字段名 类型，
            字段名 类型，
            字段名 类型
            ...
        );

        例：
            set serveroutput on;
            declare 
                var_emp s_emp%rowtype; -- 行定义
            begin
                select * into var_emp from s_emp where id = 2;
                dbms_output.put_line(var_emp.id||','||var_emp.first_name);    
            end;

七、函数与过程的区别
    * 关键字不同 function 与 proceduce
    * 函数有返回值类型 和返回值，过程没有
    * 调用方式不同，过程可以看作 PLSQL 语句，函数必须组成表达式

    '1: 声明格式'
        create or replace function 函数名(参数列表) return 返回值类型 is

        begin

        end;
        /

八、包 package
    '1: 概念'
        * 用来组织 过程、函数、变量、类型、等对象的一个逻辑结构
    '2: 体统提供的包'
        使用包名的内容 需要使用 包名.过程、包名.函数
        * dbms_output
            put_line
            desc 包名
        * dbms_random
            如：select trunc(dbms_random.value(1, 100)) from dual;
        * dbms_job 定时任务包
            定时调用存储过程
            dbms_job.submit(job, what, nextdate, interval);
                submit 这个过程，可以把定时任务 提交给数据库管理系统，数据库管理系统 会把任务编号分配给 job
                what     => 要定时调用的存储过程
                nextdate => date 第一次调用的时间
                interval => varchar2 间隔周期

            dbms_job.run(job);   运行对应的任务
            dbms_job.remove(job) 移除定时任务

九、触发器 trigger
    '1: 概念'
        * DML(insert delete update) 级别的触发器
            当我们进行 DML 操作时， 这些操作可以被数据库管理系统 捕获到，从而可以针对
            相应的 dml， 进行相应的操作。
    
    '2: 语法'
        create or replace trigger 触发器的名字 before|after 
        dml(insert|delete|update)  on 表名 [for each row]

    '3: 语句级触发器 与 行级触发器'
        * 语句级触发器 => 无论 sql 语句影响多少行都只触发一次
        * 行级触发器   => sql 语句影响多少行， 就触发多少次 (for each row)



