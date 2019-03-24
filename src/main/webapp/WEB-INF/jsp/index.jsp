<%--
  Created by IntelliJ IDEA.
  User: w
  Date: 3/23/2019
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>RonghaoZhou Home Page</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    <noscript>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css"/>
    </noscript>
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script>

        $(function () {
            setInterval(clock, 1000);
        });

        function clock() {
            var time = new Date();
            attime = time.toLocaleString();
            $(".date").text(attime);
        }
    </script>
</head>
<body class="is-loading">

<!-- Wrapper -->
<div id="wrapper" class="fade-in">

    <!-- Intro -->
    <div id="intro">
        <h1>Hello!<br/>
            Teachers and schoolmates!</h1>
        <p>This is my page,simple,but just for fun!<br>
            I am very glad at that you come here!<br/>
            Have a good time!</p>
        <ul class="actions">
            <li><a href="#header" class="button icon solo fa-arrow-down scrolly">Continue</a></li>
        </ul>
    </div>



    <!-- Header -->
    <header id="header">
        <a href="${pageContext.request.contextPath}/" class="logo">HOME PAGE</a>
    </header>

    <!-- Nav -->
    <nav id="nav">
        <ul class="links">
            <li class="active"><a href="${pageContext.request.contextPath}/">Home Page</a></li>
            <li><a href="${pageContext.request.contextPath}/selfIntro">self intro </a></li>
            <li><a href="${pageContext.request.contextPath}/grade">Demo page</a></li>
        </ul>
        <ul class="icons">
            <li><a href="https://github.com/ZRHDS" class="icon fa-github" target="_blank"><span
                    class="label">https://github.com/ZRHDS</span></a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">

        <!-- Featured Post -->
        <article class="post featured">
            <header class="major">
                <span id="mydate" class="date"></span>
                <h2>I am a student <br/>
                    from UESTC !</h2>
                <p>Love reading, love travel,love food and love programming！<br>
                    Once I dreamed of becoming a doctor, now I am being a software engineer!<br>
                    I like to watch American and English dramas.<br>
                    To learn more about me,just go to the self-intro page!
                </p>
            </header>
            <a href="${pageContext.request.contextPath}/images/pic01.jpg" class="image main" target="_blank"><img
                    src="${pageContext.request.contextPath}/images/pic01.jpg" alt=""/></a>
            <ul class="actions">
                <li><a href="#" class="button big">Go top</a></li>
                <li><a href="${pageContext.request.contextPath}/selfIntro" class="button big">Go self-Intro</a></li>
                <li><a href="${pageContext.request.contextPath}/grade" class="button big">Go Demo</a></li>
            </ul>
        </article>
    </div>
</div>
</body>
</html>
