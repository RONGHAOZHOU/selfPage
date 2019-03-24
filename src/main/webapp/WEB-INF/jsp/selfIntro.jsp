<%--
  Created by IntelliJ IDEA.
  User: w
  Date: 3/24/2019
  Time: 1:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>

<html>
<head>
    <title>self introduction</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" /></noscript>
</head>
<body class="is-loading">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <a href="${pageContext.request.contextPath}/" class="logo">HOME PAGE</a>
    </header>

    <!-- Nav -->
    <nav id="nav">
        <ul class="links">
            <li><a href="${pageContext.request.contextPath}/">Home Page</a></li>
            <li  class="active"><a href="${pageContext.request.contextPath}/selfIntro">self intro </a></li>
            <li><a href="${pageContext.request.contextPath}/grade">Demo page</a></li>
        </ul>
        <ul class="icons">
            <li><a href="https://github.com/ZRHDS" class="icon fa-github" target="_blank"><span class="label">https://github
                .com/ZRHDS</span></a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">

        <!-- Post -->
        <section class="post">
            <header class="major">
                <span id="mydate" class="date"></span>
                <h1>个人简历<br />
                    self introduction</h1>
            </header>
            <hr/>
            <!-- Lists -->
            <h2>基本信息</h2>
            <div class="row">
                <div class="6u 12u$(small)">
                    <ul>
                        <li>姓名：周荣好</li>
                        <li>专业：软件工程（软件技术）</li>
                        <li>邮箱：ronghaozhou@foxmail.com</li>
                    </ul>
                </div>
                <div class="6u$ 12u$(small)">
                    <ul>
                        <li>院校：电子科技大学</li>
                        <li>英语：CET6</li>
                    </ul>

                </div>
            </div>
            <hr/>
            <h2>专业技能</h2>
            <dl>
                <dt>Java</dt>
                <dd>
                    <p>熟悉Java编程，了解Spring，设计模式，JVM。了解NoSQL（Elasticsearch）</p>
                </dd>
                <dt>Python</dt>
                <dd>
                    <p>了解自动化测试，爬虫，Tensorflow</p>
                </dd>
                <dt>web</dt>
                <dd>
                    <p>了解JQuery，bootstrap，AJAX</p>
                </dd>
                <dt>OS</dt>
                <dd>
                    <p>了解Linux，shell编程.</p>
                </dd>
            </dl>

            <hr />

            <!-- Table -->
            <h2>项目</h2>
            <h3>包括一些实战项目和练手demo</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                    <tr>
                        <th>项目名称</th>
                        <th>描述</th>
                        <th><span class="icon alt fa-github">Github</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Zstack-Woodpecker</td>
                        <td>一款针对Zstack云计算平台的开源自动化测试框架</td>
                        <td><a href="https://github.com/ZRHDS/zstack-woodpecker" class="icon alt fa-github" target="_blank"><span
                                class="label">https://github.com/ZRHDS/zstack-woodpecker</span></a></td>
                    </tr>
                    <tr>
                        <td>Springboot</td>
                        <td>基于Springboot2.X版本构建的一些简单Demo实战</td>
                        <td><a href="https://github.com/ZRHDS/SpringBoot" class="icon alt fa-github" target="_blank"><span
                                class="label">https://github.com/ZRHDS/SpringBoot</span></a></td>
                    </tr>
                    <tr>
                        <td>tensorflow</td>
                        <td>基于google开源深度学习框架进行的一些小实践</td>
                        <td><a href="https://github.com/ZRHDS/tensorflow_learning
" class="icon alt fa-github" target="_blank"><span
                                class="label">https://github.com/ZRHDS/tensorflow_learning
</span></a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <hr/>
            <!-- Box -->
            <h2>个人评价</h2>
            <div class="box">
                <ul>
                    <li>阳光向上、性格内向。</li>
                    <li>喜欢学习、钻研。</li>
                    <li>拥有持续学习能力。</li>
                    <li>希望拓宽知识的深度和广度。</li>
                    <li>能够承受压力。</li>
                </ul>
            </div>
            <hr />
            <ul class="actions">
                <li><a href="#" class="button big">Go top</a></li>
                <li><a href="${pageContext.request.contextPath}/" class="button big">Go Home page</a></li>
                <li><a href="${pageContext.request.contextPath}/grade" class="button big">Go Demo</a></li>
            </ul>
        </section>

    </div>


</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script>

    $(function () {
        setInterval(clock,1000);
    });

    function clock() {
        var time=new Date();
        attime= time.toLocaleString() ;
        $(".date").text(attime) ;
    }
</script>

</body>
</html>