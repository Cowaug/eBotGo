<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Exos
  Date: 15-Mar-20
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-5">
                    <h2 class="ftco-heading-2">eBot Team</h2>
                    <p>Gaming, developing team.</p>
                    <br>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-5">
                    <h2 class="ftco-heading-2">Quick Links</h2>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/index" class="py-2 d-block">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/projects" class="py-2 d-block">Projects</a></li>
                        <li><a href="${pageContext.request.contextPath}/about" class="py-2 d-block">About</a></li>
                    </ul>
                    <br>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-5">
                    <h2 class="ftco-heading-2">Contact Information</h2>
                    <p><a href="https://mail.google.com/mail/u/0/?view=cm&fs=1&to=esoft288@gmail.com&tf=1" target="_blank"
                          class="py-2 d-block">esoft288@gmail.com</a></p>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <p><a href="#" target="_blank" id="go-to-top" class="btn" style="font-size: xx-large">&uarr;</a></p>
                    <br><br>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">

                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with
                    <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </div>
</footer>



<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
    <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"></circle>
    <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
            stroke="#F96D00"></circle></svg></div>

<spring:url value="js/jquery.min.js" var="var1" />
<script src="${var1}"></script>

<spring:url value="js/jquery-migrate-3.0.1.min.js" var="var2" />
<script src="${var2}"></script>

<spring:url value="js/popper.min.js" var="var3" />
<script src="${var3}"></script>

<spring:url value="js/bootstrap.min.js" var="var4" />
<script src="${var4}"></script>

<spring:url value="js/jquery.easing.1.3.js" var="var5" />
<script src="${var5}"></script>

<spring:url value="js/jquery.waypoints.min.js" var="var6" />
<script src="${var6}"></script>

<spring:url value="js/jquery.stellar.min.js" var="var7" />
<script src="${var7}"></script>

<spring:url value="js/owl.carousel.min.js" var="var8" />
<script src="${var8}"></script>

<spring:url value="js/jquery.magnific-popup.min.js" var="var9" />
<script src="${var9}"></script>

<spring:url value="js/aos.js" var="var10" />
<script src="${var10}"></script>

<spring:url value="js/jquery.animateNumber.min.js" var="var11" />
<script src="${var11}"></script>

<spring:url value="js/bootstrap-datepicker.js" var="var12" />
<script src="${var12}"></script>

<spring:url value="js/jquery.timepicker.min.js" var="var13" />
<script src="${var13}"></script>

<spring:url value="js/particles.min.js" var="var14" />
<script src="${var14}"></script>

<spring:url value="js/particle.js" var="var15" />
<script src="${var15}"></script>

<spring:url value="js/scrollax.min.js" var="var16" />
<script src="${var16}"></script>

<spring:url value="js/main.js" var="var17" />
<script src="${var17}"></script>