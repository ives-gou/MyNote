/**
 *  @Author: GPJ
 *  Desc: HQL 语句学习
 *  Time: 2017-04-23
 */

一、HQL定义
    1: Hibernate Query Language, Hibernate 查询语言
    2: HQL 是"面向对象"的查询语言
    3: HQL 提供了丰富灵活的查询特性， Hibernate 官方推荐查询方式

二、HQL语句形式
    1: from 子句
        * HQL 语句最简形式
        * from 指定了HQL语句查询主体-持久化类及其属性
            如: from Saller;

    2: select 子句
        * 返回结果为 Object[] 数组
            如: select id, name from Saller;
        * 返回结果为 List 集合
            如: select new List(id, name) from Saller;
        * 返回结果为 Map 集合
            如: select new Map(id, name)  from Saller;
                select new Map(id as id, name as name) from Saller;
        * 返回结果为 自定义类型 
            如: select new Saller(id, name) from Saller;

    3: where 子句
        * 与 sql 语句形式类似
