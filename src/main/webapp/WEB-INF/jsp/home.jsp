<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>eBotGo - Home</title>
    <jsp:include page="header.jsp"/>
</head>
<body>
<h1>Welcome SpingMVC4 Home Page!</h1>
<h3>${textBox1}</h3>

<!-- abc -->
<%
    if (request.getSession().getAttribute("username") == null) {
%>
<h4><a href="${pageContext.request.contextPath}/login">Login</a></h4>
<%
} else {
%>
<h4>Already login as <%=session.getAttribute("username") %>. <a
        href="${pageContext.request.contextPath}/logout">Logout</a></h4>
<%
    }
%>
<!---->

<h4><a href="${pageContext.request.contextPath}/config">Setting</a></h4>

</body>
</html>