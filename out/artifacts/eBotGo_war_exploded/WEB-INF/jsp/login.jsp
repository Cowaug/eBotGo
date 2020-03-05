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
<body id="body"
      style="background-image: url('https://raw.githubusercontent.com/Cowaug/eBotGo/master/src/main/webapp/resources/background.jpg')">
<div style="text-align: center;z-index: 100;padding-top: 48px">
    <form style="max-width: 256px;padding: 16px;margin: 0 auto;background:white" class="mdc-elevation--z4"
          action="${pageContext.request.contextPath}/login" method="post">
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
        <button id="button" class="mdc-button mdc-button--outlined" style="color: dimgray;--mdc-theme-primary: dimgray"
                type="submit" onclick="login(this)"><span
                class="mdc-button__ripple"></span> Login
        </button>
    </form>
</div>
<script>
    function login(btn) {
        btn.innerHTML = btn.innerHTML.replace("Login", "Login...")
    }
</script>
</body>
</html>
