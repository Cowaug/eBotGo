<%@ page import="com.ebot.ebotgo.User" %>
<%@ page import="static com.ebot.ebotgo.WebController.USER_INFO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>eBotGo - Home</title>
    <jsp:include page="header.jsp"/>
</head>
<body>
<h6 style="color: darkred">
    This page is under development!</h6>
<h3>
    Welcome <strong>${username}</strong>
    to eBotGo Home Page!</h3>

<!-- MENU LIST -->
<ul>
    <%
        if (request.getSession().getAttribute(USER_INFO) == null) {
    %>
    <li>
        <h5><a href="${pageContext.request.contextPath}/login">Login Mybatis One Line</a></h5>
        <h5><a href="${pageContext.request.contextPath}/login2">Login Mybatis Multiline</a></h5>
        <h5><a href="${pageContext.request.contextPath}/login3">Login Safe</a></h5>
        <h5><a href="${pageContext.request.contextPath}/login4">Login Pure SQL</a></h5>
    </li>
    <%
    } else {
    %>
    <li><h5><a href="${pageContext.request.contextPath}/logout">Logout</a></h5></li>
    <li><h5><a href="${pageContext.request.contextPath}/changePassword">Change password</a></h5></li>
    <li><h5><a href="${pageContext.request.contextPath}/config">Setting</a></h5></li>
    <%if (((User) request.getSession().getAttribute(USER_INFO)).getPermission() > 5) {%>
    <li><h5><a href="${pageContext.request.contextPath}/startAllMikoBot">StartAllBot</a></h5></li>
    <%
            }
        }
    %>
</ul>
<!---->

</body>
</html>