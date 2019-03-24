<%--
  Created by IntelliJ IDEA.
  User: w
  Date: 3/18/2019
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>成绩查询系统</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                                    alert(data.message + '');
                                }
                            },
                            error: function (data) {
                                alert("请输入正确的学号");
                            }

                        })


                    }
                );
            });

        function download() {
            window.location.href = "${pageContext.request.contextPath}/grade/getExcel";

        }


    </script>
</head>
<body>
<form id="formObj" role="form">
    <div class="form-group">
        <label>请输入学号：
            <input id="number" name="number" type="text" class="form-control" placeholder="输入学号"></label>
        <button id="submit" type="button" class="btn btn-default btn-sm">提交</button>

    </div>
    <div>
        <button onclick="download()" type="button" class="btn btn-default btn-sm">下载测试数据</button></div>
</form>
<table class="table table-hover">
    <caption>查询结果</caption>
    <thead>
    <tr>
        <th>考生编号</th>
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
        <td id="code"></td>
        <td id="politics"></td>
        <td id="English"></td>
        <td id="math"></td>
        <td id="econemy"></td>
        <td id="total"></td>
        <td id="rank"></td>
    </tr>

    </tbody>
</table>

</body>
</html>