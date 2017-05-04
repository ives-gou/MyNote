
-- Oralce 学习 
-- Time: 2017-03-27
-------------------------------
-------------------------------
-------------------------------

一、用户与表空间
    -- 启用/关闭用户的语句
        alter user username account unlock/lock;
    -- 表空间分类
       -- 永久表空间、临时表空间、UNDO表空间
    -- 查看用户的表空间
       -- dba_tablespaces、user_tablespaces  数据字典
    -- 设置用户的默认或临时表空间
        ALTER USER username DEFAULT|TEMPORARY TABLESPACE tablespace_name
    -- 创建表空间
        CREATE [TEMPORARY] TABLESPACE tablespace_name TEMPFILE|DATAFILE 'xx.dbf' SIZE xx
        -- 查询.dbf存放目录
            SELECT file_name FROM dba_data_files WHERE tablespace_name='TEST_TABLESPACE';
    -- 修改表空间的状态
        ALTER TABLESPACE tablespace_name ONLINE|OFFLINE;
        ALTER TABLESPACE tablespace_name READ ONLY|READ WRITE
    -- 删除表空间
        DROP TABLESPACE tablespace_name [INCLUDING CONTENTS]

二、认识表
    -- 数据类型
        字符型  CHAR(2000), NCHAR(1000);  VARCHAR2(4000), NVARCHAR2(2000);
        数值型  NUMBER(p,s), FLOAT(n)
        日期限  DATE, TIMESTAMP,
        其他    BLOB, CLOB, 

三、管理表
    -- 创建表
        CREATE TABLE table_name (
            column_name datatype, ....
        )
    -- 修改表（结构）
        -- 添加字段
            ALTER TABLE table_name ADD column_name datatype;
        -- 更改字段数据类型
            ALTER TABLE table_name MODIFY column_name datatype;
        -- 修改字段名
            ALTER TABLE table_name RENAME COLUNMN column_name TO new_column_name;
        -- 删除字段
            ALTER TABLE table_name DROP COLUNMN column_name;
        -- 修改表名
            RENAME table_name TO new_table_name;
    -- 删除表
        -- 删除表数据
            TRUNCATE TABLE table_name;
        -- 删除表
            DROP TABLE table_name;
    -- 操作表
        -- 添加数据
            INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2,...);
        -- 复制表数据
            -- 创建时复制
                CREATE TALBE table_new AS SELECT column1,...|* FROM talbe_old;
            -- 添加时复制
                INSERT INTO table_new [(column1,...)] SELECT column1,...|* FROM talbe_old;
        -- 修改数据
            UPDATE table_name SET column1=value1,... [WHERE conditions];
        -- 删除数据
            DELETE FROM table_name [WHERE conditions];
    -- Oracle 约束
        -- 非空约束
            column_name datatype NOT NULL,...
        -- 主键约束
            -- 添加主键约束
                column_name datatype PRIMARY KEY,...
                CONSTRAINT constraint_name PRIMARY KEY(column1,...);
                ALTER TALBE table_name ADD CONSTRAINT constraint_name PRIMARY KEY (column1,...);
            -- 修改主键约束名称
                ALTER TALBE table_name RENAME CONSTRAINT old_name TO new_name;
            -- 禁用、启用主键约束
                ALTER TABLE talbe_name DISABLE|ENABLE CONSTRAINT constraint_name;
            -- 删除主键约束
                ALTER TABLE talbe_name DRPO CONSTRAINT constraint_name; 
                ALTER TABLE table_name DROP PRIMARY KEY [CASCADE];
        

        -- 外键约束
            -- 添加外键主键 (设置外键约束时，主表的字段必须为主键)
                -- 创建表时添加
                    CREATE TABlE table_name (
                        column_name datatype REFERENCES (table2 (column1,...))
                    );

                    CONSTRAINT constraint_name FOREIGN KEY(column_name) REFERENCES table_name(column_name) [ON DELETE CASCADE]
                -- 修改表时添加
                    ALTER TABLE talbe_name ADD CONSTRAINT constraint_name FOREIGN KEY(column_name) REFERENCES table_name(column_name) [ON DELETE CASCADE]
            -- 启用、禁用主键约束
                ALTER TABLE talbe_name DISABLE|ENABLE CONSTRAINT constraint_name;
            -- 删除主键约束
                ALTER TABLE table_name DROP CONSTRAINT constraint_name;
        -- 唯一约束
            -- 创建唯一约束
                -- 创建表时添加
                    column_name datatype UNIQUE,...
                    CONSTRAINT constraint_name UNIQUE (column_name);
                -- 修改表时添加
                    ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE(column_name);
            -- 启用、禁用唯一约束
                ALTER TABLE table_name DISABEL|ENABLE CONSTRAINT constraint_name;
            -- 删除唯一约束
                ALTER TABLE table_name DROP CONSTRAINT constraint_name;
        -- 检查约束
            -- 创建检查约束
                -- 创建表时添加
                    column_name datatype CHECK(expressions)
                    CONSTRAINT constraint_name CHECK (expressions)
                -- 修改表时添加
                    ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (expressions)
            -- 启用、禁用检查约束
                ALTER TABLE table_name DISABEL|ENABLE CONSTRAINT constraint_name;
            -- 删除检查约束
                ALTER TABLE table_name DROP CONSTRAINT constraint_name;

    
        -- 在 SQL* PLUS 中设置格式
            COLUMN column_name HEADING new_name
            COLUMN column_name FORMAT dataformat -- 字符串 a+len; 浮点数 999.9
            COLUMN column_name CLEAR  -- 清除格式
        

        -- 查询语句
            -- 基本查询语句
                SELECT [DISTINCT] column_name1,...|* FROM table_name [WHERE conditions]
                DECODE(column_name, ...);

四、数据库中其他对象
    '1: 序列 sequence'
        作用：用来产生不重复数组的一个对象， 一般来说是用来控制主键值的
        语法：
            create sequence 序列名
        使用：序列名.nextval 获取序列的下一个值
              序列名.currval 获取序列的当前值
        删除：drop sequence 序列名

    '2: 索引 index'
        作用：用来加速查询
        原理：通过消耗大量的空间和时间来达到加速查询目的
        语法：
            create index 索引名 on 表名(字段名)

        附：添加时间统计 => set timing on
            不要在 主键 与 唯一索引 上面加索引，系统已经自动建立索引

    '3: 视图 view'
        本质：是一条 select 语句。相对于 select 语句的对应的数据， view 空间可以忽略不计
        作用：可以对同一份物理数据，做出不同表现
        语法：
            create or replace view 视图名 as select 语句;

五、oracle 的分页技术
    关键字：'rownum'

            