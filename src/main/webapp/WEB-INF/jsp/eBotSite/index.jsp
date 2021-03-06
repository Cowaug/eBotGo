<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %><!DOCTYPE html>
<html lang="en">

<head>
  <title>eBot Team</title>
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
          <li class="nav-item active"><a href="${pageContext.request.contextPath}/index" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="${pageContext.request.contextPath}/about" class="nav-link">About</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/projects" id="dropdown04" aria-haspopup="true"
               aria-expanded="false">Projects</a>
            <div class="dropdown-menu" aria-labelledby="dropdown04">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/miko-bot">MikoBot</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/mcsl">Minecraft Server Launcher</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/citation-tools">Citation Tools</a>
            </div>
          </li>
          <li class="nav-item cta"><a href="${pageContext.request.contextPath}/home" target="_blank"
                                            class="nav-link"><span>Login into eBotGo</span></a></li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- END nav -->

  <!-- <div class="js-fullheight"> -->
  <div class="hero-wrap js-fullheight">
    <div class="overlay"></div>
    <div id="particles-js"></div>
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
        <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Play <strong>games</strong>
            or
            <strong>developing apps</strong> with our team.</h1>
          <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><a
              href="https://discordapp.com/invite/Kuhpery" target="_blank"
              class="btn btn-primary btn-outline-white px-5 py-3">Join us
              on Discord</a></p>
        </div>
      </div>
    </div>
  </div>

  <section class="ftco-section">
    <div class="container">
      <div class="row no-gutters justify-content-center mb-5 pb-5">
        <div class="col-md-7 text-center heading-section ftco-animate">
          <span class="subheading">Works</span>
          <h2 class="mb-4">View our works below to see our design and way of development.</h2>
        </div>
      </div>
      <div class="row">
        <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
          <a href="${pageContext.request.contextPath}/miko-bot" class="image"
             style="background-image: url('https://cdn.discordapp.com/avatars/643766161443520523/5e6e5ca3ed19830076156df24e5f00bc.png?size=128'); "
             data-scrollax=" properties: { translateY: '-20%'}">
          </a>
          <div class="text">
            <h4 class="subheading">Discord Bot</h4>
            <h2 class="heading"><a href="${pageContext.request.contextPath}/miko-bot">MikoBot</a></h2>
            <p>Made exclusive for eBotTeam, MikoBot helps you to talk with everyone easier with text-to-speech feature
              when your microphone is not available (or broken :&lt;). It also features music playback for Youtube,
              SoundCloud.</p>
            <p><a href="${pageContext.request.contextPath}/miko-bot" class="btn btn-primary px-4">View Project</a></p>
          </div>
        </div>

        <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
          <spring:url value="images/mcsl.png" var="mcsl"/>
          <a href="${pageContext.request.contextPath}/mcsl" class="image image-2 order-2" style="background-image: url(${mcsl}); "
             data-scrollax=" properties: { translateY: '-20%'}">
          </a>
          <div class="text">
            <h4 class="subheading">Application</h4>
            <h2 class="heading"><a href="${pageContext.request.contextPath}/mcsl">Minecraft Server Launcher</a></h2>
            <p>Manage all of your minecraft server with this application. Hosting your own minecraft server has never
              been that easy.</p>
            <p><a href="${pageContext.request.contextPath}/mcsl" class="btn btn-primary px-4">View Project</a></p>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12 text-center">
          <span><a href="${pageContext.request.contextPath}/projects" class="btn btn-primary py-3 px-5">View All Projects</a></span>
        </div>
      </div>
    </div>
  </section>

  <section class="ftco-section ftco-counter" id="section-counter">
    <div class="container">
      <div class="row justify-content-center mb-5 pb-5">
        <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
          <h2>Our achievements</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-6 d-flex justify-content-center counter-wrap ftco-animate">
          <div class="block-18 text-center">
            <div class="text">
              <strong class="number" data-number="57">0</strong>
              <span>Members</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-6 d-flex justify-content-center counter-wrap ftco-animate">
          <div class="block-18 text-center">
            <div class="text">
              <strong class="number" data-number="3">0</strong>
              <span>Projects</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
<!--footer-->
  <jsp:include page="footer.jsp"/>

</body>

</html>