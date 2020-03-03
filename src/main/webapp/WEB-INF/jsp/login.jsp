<%--
  Created by IntelliJ IDEA.
  User: Exos
  Date: 02-Mar-20
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>eBotGo - Login</title>
    <jsp:include page="header.jsp"/>
</head>
<body >
<img src="https://raw.githubusercontent.com/Cowaug/ebot-site/master/src/main/webapp/images/Black_Man_Working_at_his_Laptop_on_the_Couch_Cartoon_Vector.svg"  style="
    height:inherit;
    width:inherit;"
     alt="">
<div style="text-align: center">
    <%
        if (request.getSession().getAttribute("username") != null) {
    %>
    <h1>Already login as <%=session.getAttribute("username") %>. <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </h1>
    <%
    } else {
    %>
    <form style="max-width: 256px;padding: 16px;margin: 48px auto;background:white" class="mdc-elevation--z4" action="${pageContext.request.contextPath}/login" method="post">
        <div style="color: dimgray">Login to eBotGo</div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="text" id="user-id" name="user-id">
            <label class="mdl-textfield__label" for="user-id">User ID</label>
        </div>
        <br>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
             >
            <input class="mdl-textfield__input" type="password" id="password" name="password">
            <label class="mdl-textfield__label" for="password">Password</label>
        </div>
<br>
    <div style="color: darkred">
        ${message}
    </div>

        <button id="button" class="mdc-button mdc-button--outlined" style="color: dimgray;--mdc-theme-primary: dimgray" type="submit"><span
                class="mdc-button__ripple"></span> Login
        </button>
    </form>
    <%
        }
    %>
</div>
</body>
</html>
