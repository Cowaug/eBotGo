<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Created by IntelliJ IDEA.
  User: Exos
  Date: 03-Mar-20
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">

<spring:url value="resources/icon.png" var="icon" />
<%--<spring:url value="/resources/css/" var="icon" />--%>

<link rel="icon"
      href="${icon}">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-orange.min.css">
<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<script defer="" src="https://code.getmdl.io/1.3.0/material.min.js"></script>