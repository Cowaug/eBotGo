<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon"
          href="https://cdn.discordapp.com/icons/602896661643001856/ea6f59bfa350778dba954afb02a536af.webp?size=128">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/citation.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-orange.min.css"/>
    <link rel="stylesheet" href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css">

    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/citation.js" charset="utf-8"></script>
</head>

<style>
    .iframeClass {
        height: inherit;
        opacity: 0;
        position: fixed;
    }

</style>
<body style="height: 100%">
<div id="main-box" style="  --mdc-theme-primary: #323234;
  height: inherit">

    <header class="mdc-top-app-bar" style="z-index: 999">
        <div class="mdc-top-app-bar__row">
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                <button class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons"
                        style="outline: none">menu
                </button>
                <a class="mdc-top-app-bar__title" style="color: inherit;" id="header">APA Book</a>

            </section>
        </div>
    </header>

    <aside class="mdc-drawer mdc-drawer--modal mdc-top-app-bar--fixed-adjust mdc-drawer--open">
        <div class="mdc-drawer__content" style="padding-top: 6px">
            <a class="mdc-list-item" id="language"> </a>
            <nav class="mdc-list" style="padding-top: 0;">
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">APA</h6>
                <section style="padding-top: 6px" id="apa">
                </section>

                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">IEEE</h6>
                <section style="padding-top: 6px" id="ieee">
                </section>
                <hr class="mdc-list-divider">
                <a class="mdc-list-item mdc-list-item--activated" style="visibility: hidden" aria-selected="true"
                   onclick=show("ieee-book",this)>
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true"></i>
                    <span class="mdc-list-item__text">Book</span>
                </a>
            </nav>
        </div>
    </aside>
    <div class="mdc-drawer-scrim"></div>
    <script>

    </script>
    <!-- Content -->
    <section class="mdc-top-app-bar--fixed-adjust" id="content" style="height: 100%">
    </section>

</div>

<script>
    var drawer = mdc.drawer.MDCDrawer.attachTo(document.querySelector('.mdc-drawer'));
    var button = document.querySelector('button');
    button.addEventListener('click', function () {
        drawer.open = !drawer.open
    });
    var list = document.getElementsByClassName('iframeClass');
    var curSelection = "";
    loadDrawer("en");

    function loadDrawer(language) {
        $.getJSON("./res/CitationUI_" + language + ".json", function (json) {
            var tmp = json.drawer;
            document.getElementById("apa").innerHTML = "";
            document.getElementById("ieee").innerHTML = "";
            document.getElementById("content").innerHTML = "";
            for (var i = 0; i < tmp.length; i++) {
                if (curSelection === "") {
                    curSelection = tmp[i].type + "-" + tmp[i].category;
                }
                document.getElementById(tmp[i].type).innerHTML += createDrawerItems(tmp[i].type + "-" + tmp[i].category, tmp[i].display, tmp[i].icon, curSelection);
                document.getElementById("content").innerHTML += createIFrame(tmp[i].type + "-" + tmp[i].category);
            }
            toggleLanguage(language);
        });
    }

    function toggleLanguage(language) {
        document.getElementById("language").innerHTML = (language === "vi" ? "Switch to English" : "Chuyển sang Tiếng Việt");
        document.getElementById("language").onclick = function () {
            (language === "vi" ? loadDrawer("en") : loadDrawer("vi"))
        };
        for (i = 0; i < list.length; i++) {
            list[i].src = "Citation?type=" + list[i].id + "&language=" + language;
        }
        var textList = curSelection.split("-");
        document.getElementById("header").innerHTML = textList[0].toUpperCase() + " " + document.getElementById(curSelection + "-btn").getElementsByClassName("mdc-list-item__text")[0].innerHTML;
    }

    function show(ele) {
        var textList = ele.split("-");
        document.getElementById("header").innerHTML = textList[0].toUpperCase() + " " + document.getElementById(ele + "-btn").getElementsByClassName("mdc-list-item__text")[0].innerHTML;

        for (var i = 0; i < list.length; i++) {
            if (list[i].id !== ele) list[i].style.display = "none";
            else {
                list[i].style.display = "unset";
            }
        }
        window.scrollTo(0, 0);

        drawer.open = (curSelection === ele);
        curSelection = ele;
    }

    function resizeIframe(iframe) {
        window.scrollTo(0, 0);
        // var body = iframe.contentWindow.document.body,
        //     html = iframe.contentWindow.document.documentElement;
        // var height = Math.max(body.scrollHeight, body.offsetHeight,
        //     html.clientHeight, html.scrollHeight, html.offsetHeight);
        // console.log(iframe.height)
        // console.log(height)
        // iframe.height = height+ "px";
        if (iframe.id !== document.getElementsByClassName("mdc-list-item--activated").item(0).onclick.toString().replace("function onclick(event) {\n" + "show(\"", "").replace("\")\n" + "}", ""))
            iframe.style.display = "none";
        else
            document.getElementById(curSelection + "-btn").click();
        iframe.style.opacity = "100";
        iframe.style.position = "unset"
    }
</script>
</body>
</html>