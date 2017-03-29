
-- Oralce 学习 
-- Time: 2017-03-27
-------------------------------
-------------------------------
-------------------------------

-- 1、用户与表空间
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

-- 2、认识表
    -- 数据类型
        字符型  CHAR(2000), NCHAR(1000);  VARCHAR2(4000), NVARCHAR2(2000);
        数值型  NUMBER(p,s), FLOAT(n)
        日期限  DATE, TIMESTAMP,
        其他    BLOB, CLOB, 

-- 3、管理表
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



