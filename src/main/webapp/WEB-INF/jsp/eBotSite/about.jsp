<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %><!DOCTYPE html>
<html lang="en">

<head>
    <title>About</title>
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
                <li class="nav-item active"><a href="${pageContext.request.contextPath}/about" class="nav-link">About</a></li>
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
                <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span
                        class="mr-2"><a
                        href="${pageContext.request.contextPath}/index">Home</a></span> <span>About</span></p>
                <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">About Us</h1>
            </div>
        </div>
    </div>
</div>

<div class="bg-light">
    <section class="ftco-section-featured ftco-section-featured-2 ftco-animate">
        <div class="container-fluid" data-scrollax-parent="true">
            <div class="row mt-5 d-flex justify-content-center">
                <div class="col-md-8 text-center heading-section ftco-animate">
                    <h2 class="h1">Gaming, developing team.</h2>
                    <p><a href="https://discordapp.com/invite/Kuhpery" target="_blank"
                          class="btn btn-primary mt-3 py-3 px-5">Join us on
                        Discord</a></p>
                </div>
            </div>
        </div>
    </section>
</div>

<div class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-5">
            <div class="col-md-7 text-center heading-section ftco-animate">
                <span class="subheading">Team</span>
                <h2 class="mb-4">Our Team</h2>
                <p></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-5 ftco-animate">
                <div class="block-10">
                    <div class="person-info mb-2">
                        <span class="name">Cowaug</span>
                        <span class="position">Co-founder</span>
                    </div>
                    <img
                            src="https://cdn.discordapp.com/avatars/402414887264845825/437621ad01900b3c79d04f51cc21dbea.png?size=512"
                            alt="" class="img-fluid mb-3">
                    <p></p>
                </div>
            </div>
            <div class="col-md-4 mb-5 ftco-animate">
                <div class="block-10">
                    <div class="person-info mb-2">
                        <span class="name">soiluahung</span>
                        <span class="position">Co-founder</span>
                    </div>
                    <img
                            src="https://cdn.discordapp.com/avatars/322714676075167744/5635d331db29aa1f7f7e5915e23d319f.png?size=128"
                            alt="" class="img-fluid mb-3">
                    <p></p>
                </div>
            </div>
            <div class="col-md-4 mb-5 ftco-animate">
                <div class="block-10">
                    <div class="person-info mb-2">
                        <span class="name">kn112</span>
                        <span class="position">Moderator</span>
                    </div>
                    <img
                            src="https://cdn.discordapp.com/avatars/393034938028392449/2f2e7911b90b2014bc86773de2786534.webp?size=128"
                            alt="" class="img-fluid mb-3">
                    <p></p>
                </div>
            </div>
            <div class="col-md-4 mb-5 ftco-animate">
                <div class="block-10">
                    <div class="person-info mb-2">
                        <span class="name">Nguyệt Minh</span>
                        <span class="position">Moderator</span>
                    </div>
                    <img
                            src="https://cdn.discordapp.com/avatars/389234214253494272/c01fbc0cce9c51cad427bebe06218b81.png?size=128"
                            alt="" class="img-fluid mb-3">
                    <p></p>
                </div>
            </div>
            <div class="col-md-4 mb-5 ftco-animate">
                <div class="block-10">
                    <div class="person-info mb-2">
                        <span class="name">Huh?</span>
                        <span class="position">Moderator</span>
                    </div>
                    <img
                            src="https://cdn.discordapp.com/avatars/376340129507311616/fb28c304fb68907de7c02e1d6d141984.png?size=128"
                            alt="" class="img-fluid mb-3">
                    <p></p>
                </div>
            </div>
            <div class="col-md-4 mb-5 ftco-animate">
                <div class="block-10">
                    <div class="person-info mb-2">
                        <span class="name">Mimi Luna</span>
                        <span class="position">Moderator</span>
                    </div>
                    <img
                            src="https://cdn.discordapp.com/avatars/441163996591030294/ca73ba729c5cb2af40b252b8826f0779.png?size=128"
                            alt="" class="img-fluid mb-3">
                    <p></p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>

</html>