<%--
  Created by IntelliJ IDEA.
  User: w
  Date: 3/23/2019
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>grade page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />

    <%--<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>--%>
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    <script>

        $(document).ready(
            function () {
                $("#submit").click(function () {
                        $.ajax({
                            type: 'POST',
                            contentType: 'application/json',
                            url: '${pageContext.request.contextPath}/grade/getGrades',
                            data: JSON.stringify({
                                    "number": $("#number").val()
                                }
                            ),
                            dataType: 'json',
                            success: function (data) {
                                if (data.success == 'true') {
                                    $("#code").text('' + data.code);
                                    $("#math").text('' + data.math);
                                    $("#English").text('' + data.english);
                                    $("#politics").text('' + data.politics);
                                    $("#econemy").text('' + data.econemy);
                                    $("#rank").text('' + data.rank);
                                    $("#total").text('' + data.total);
                                } else if (data.success == 'false') {
                                    $("#myModalLabel").text("提示");
                                    $("#message").text("请检查学号是否输入正确");
                                    $('#myModal').modal();
                                }
                            },
                            error: function (data) {
                                $("#myModalLabel").text("提示");
                                $("#message").text("请检查学号是否输入正确");
                                $('#myModal').modal();
                                // alert("请输入正确的学号");
                            }

                        })


                    }
                );
            });
        //下载测试excel数据
        function download() {
            window.location.href = "${pageContext.request.contextPath}/grade/getExcel";
        }

        //导出表格数据
        function table2Excel(){
            var code = $("#code").text();
            if ("" == code) {
                $("#myModalLabel").text("提示");
                $("#message").text("请先查询成绩再导出");
                $('#myModal').modal();
            } else {
                window.location.href = "${pageContext.request.contextPath}/grade/exportToExcel?code="+code;
            }
        }
    </script>
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
            <li><a href="${pageContext.request.contextPath}/selfIntro">self intro </a></li>
            <li  class="active"><a href="${pageContext.request.contextPath}/grade">Demo page</a></li>
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
            <!-- Blockquote -->
            <h2>成绩查询系统</h2>
            <blockquote>这是一个用于展示的小demo，针对学生输入的学号，检索成绩Excel文件进行分数和排名查询，保护学生隐私。项目采用SpringBoot构建，涉及技术包括SpringMVC，JavaPOI
                ，JQuery，Bootstrap。为了便于展示，提供了测试数据用于下载，并支持将个人成绩导出到Excel表格.<br>（也可以直接使用测试数据：100019000171906，100019000171920，100019000171939 ）</blockquote>
            <form id="formObj" role="form" class="alt">
                <div class="row uniform">
                    <div class="6u 12u$(xsmall)">
                        <input id="number" name="number" type="text" class="form-control" placeholder="输入学号">
                        <%--<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />--%>
                    </div>
                    <div class="6u$ 12u$(xsmall)">
                        <button id="submit" type="button" class="btn btn-default btn-sm">提交</button>
                        <button onclick="table2Excel()" type="button" class="btn btn-default btn-sm">导出我的成绩</button>
                        <button onclick="download()" type="button" class="btn btn-default btn-sm">下载测试数据</button>
                        <%--<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />--%>
                    </div>
                </div>
            </form>

            <h3>查询结果</h3>
            <div class="table-wrapper">
                <table id="myGradesTable" class="table table-hover">
                    <thead>
                    <tr>
                        <th class="noExl">考生编号</th>
                        <th>政治</th>
                        <th>外语</th>
                        <th>数学</th>
                        <th>经济</th>
                        <th>总分</th>
                        <th>排名</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td id="code" class="noExl"></td>
                        <td id="politics"></td>
                        <td id="English"></td>
                        <td id="math"></td>
                        <td id="econemy"></td>
                        <td id="total"></td>
                        <td id="rank"></td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <hr />
            <ul class="actions">
                <li><a href="#" class="button big">Go top</a></li>
                <li><a href="${pageContext.request.contextPath}/" class="button big">Go Home page</a></li>
                <li><a href="${pageContext.request.contextPath}/selfIntro" class="button big">Go self-Intro</a></li>
            </ul>
        </section>

    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">出错了！</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label id="message">没有找到此人！</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
            </div>
        </div>
    </div>
</div>



</body>
</html>
