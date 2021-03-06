<%-- Created by IntelliJ IDEA. User: Exos Date: 02-Mar-20 Time: 4:45 PM To change this template use File | Settings | File Templates. --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head><title>eBotGo - Login</title>
    <jsp:include page="header.jsp"/>
    <spring:url value="/resources/background.jpg" var="background"/></head>
<body id="body" style="background-image: url('${background}');display: flex;--mdc-theme-primary: dimgray">
<div style="margin: auto auto">
    <form style="max-width: 256px;padding: 24px;background:white;transition:height 1s ease-in-out;" class="mdc-elevation--z4"
          action="${pageContext.request.contextPath}/changePassword" method="post" onsubmit="loadingAnimation()">
        <div style="color: dimgray;font-size: large;margin-bottom: 8px;text-align: center">Change password</div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"><input class="mdl-textfield__input"
                                                                                         type="password" id="oldPassword"
                                                                                         name="oldPassword"><label
                class="mdl-textfield__label" for="oldPassword">Old password</label></div>
        <br>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"><input class="mdl-textfield__input"
                                                                                         type="password" id="newPassword"
                                                                                         name="newPassword" onkeyup="checkingNewPassword()"><label
                class="mdl-textfield__label" for="newPassword">New password</label></div>
        <br>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"><input class="mdl-textfield__input"
                                                                                         type="password" id="newPassword2"
                                                                                         name="newPassword2" onkeyup="checkingNewPassword()"><label
                class="mdl-textfield__label" for="newPassword2">Retype new password</label></div>
        <br>
        <div style="padding: 0 0 8px;text-align: center">
            <a id="message" style="text-decoration: none">${message}</a>
        </div>

        <div id="btnLogin" style="text-align: center">
            <button id="button" class="mdc-button mdc-button--outlined" style="color: dimgray;"
                    type="submit" onclick="changePassword()" ><span class="mdc-button__ripple"></span> Login
            </button>
        </div>
    </form>
</div>
<script>
    mdc.autoInit();
    document.getElementById("message").style.color = "${color}";
    function changePassword() {
        [].forEach.call(document.getElementsByClassName("mdl-textfield__input"),function (input) {
            input.required = true;
        });
    }

    function loadingAnimation() {
        document.getElementById("btnLogin").innerHTML = "<jsp:include page="LoadingBar.jsp"/>";
        document.getElementById("btnLogin").style.textAlign = "left";
        document.getElementById("message").attributes.removeNamedItem("href");
        document.getElementById("message").style.color = "darkgreen";
        document.getElementById("message").innerHTML="Changing identify of <strong>" + ${username} +"</strong>...";
        [].forEach.call(document.getElementsByClassName("mdl-textfield__input"),function (input) {
            input.readOnly = true;
        });
    }

    function checkingNewPassword() {
        const newPass = document.getElementById("newPassword");
        const newPass2 = document.getElementById("newPassword2");

        if(newPass.value!==newPass2.value){
            newPass2.parentNode.classList.add("is-invalid");
            document.getElementById("button").disabled =true;
        }else {
            newPass2.parentNode.classList.remove("is-invalid");
            document.getElementById("button").disabled =false;
        }
    }
</script>
</body>
</html>