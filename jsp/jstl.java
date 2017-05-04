/**
 * @Author GPJ
 * Aim: Jstl 学习笔记
 * Time : 2017-05-02
 */

一、 Jstl 导入
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
附、EL 表达式
    '1: 含义'
        EL (Expressin Language)
        
        普通写法 <%=session.getValue("name") %>
        EL  写法 <c:out value="${sessionScope.name}"></c:out>
    '2: EL 变量'
          JSP 内置对象                 EL 名称
        * Page                         pageScope
        * Request                      requestScope
        * Session                      sessionScope
        * Application                  applicationScope

二、 核心标签
    1: <c:out value="" default="" escapeXml="true|false"></c:out>

三、格式化标签

四、SQL 标签

五、XML 标签

六、JSTL 函数


