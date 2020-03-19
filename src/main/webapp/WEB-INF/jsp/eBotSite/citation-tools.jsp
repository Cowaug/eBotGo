<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %><!DOCTYPE html>
<html lang="en">

<head>
  <title>Citation Tools</title>
  <jsp:include page="header.jsp"/>

</head>

<body>

  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index">eBot Team</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="${pageContext.request.contextPath}/index" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="${pageContext.request.contextPath}/about" class="nav-link">About</a></li>
          <li class="nav-item dropdown active">
            <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/projects" id="dropdown04" aria-haspopup="true"
               aria-expanded="false">Projects</a>
            <div class="dropdown-menu" aria-labelledby="dropdown04">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/miko-bot">MikoBot</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/mcsl">Minecraft Server Launcher</a>
              <a class="dropdown-item active" href="${pageContext.request.contextPath}/citation-tools">Citation Tools</a>
            </div>
          </li>
          <li class="nav-item cta"><a href="${pageContext.request.contextPath}/home" target="_blank"
                                            class="nav-link"><span>Login into eBotGo</span></a></li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- END nav -->

  <div class="hero-wrap js-fullheight">
    <div class="overlay"></div>
    <div id="particles-js"></div>
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
        <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a
                href="${pageContext.request.contextPath}/index">Home</a></span> <span class="mr-2"><a href="${pageContext.request.contextPath}/projects">All Projects</a></span>
            <span>Citation Tools</span></p>
          <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Citation Tools</h1>
        </div>
      </div>
    </div>
  </div>

  <!-- <section class="ftco-section"> -->
  <div class="container">
    <div class="row justify-content-center mb-5 pb-5">
      <div class="col-md-8 ftco-animate">
        <br>
        <p>
          <spring:url value="images/citing.png" var="citing"/>
          <img src="${citing}" alt="" class="img-fluid">
        </p>
        <h2 class="mb-3">About Citation Tools</h2>
        <p>Help you citation websites, books, papers, etc. with following format:</p>
        <ul>
          <li>APA</li>
          <li>IEEE</li>
        </ul>
        <br><br>
        <p>
<!--          <a href="citation-tools-live.jsp?#" target="_blank" class="btn btn-primary btn-outline-primary py-3 px-5">Open</a>-->
          <a class="btn btn-primary btn-outline-primary py-3 px-5">Not Available Yet!</a>
<!--          <a class="btn btn-primary btn-outline-primary py-3 px-5">Source Code</a></p>-->
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp"/>

</body>

</html>