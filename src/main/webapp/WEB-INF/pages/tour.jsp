<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.js"/>"></script>
    <script src="<c:url value="/resources/jasny-bootstrap/js/jasny-bootstrap.js"/>"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/resources/css/imghover.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/resources/jasny-bootstrap/css/jasny-bootstrap.css"/>" type="text/css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet/less" type="text/css" href="<c:url value="/resources/bootstrap-3.3.7/less/bootstrap.less"/>"/>

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet"
          type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="http://wisdomweb.ru/editor/localization.js"></script>

    <style type="text/css">
        .center-block {
            margin-left: 5%;
            padding: 10px;
        }

        .center-block-btn {
            margin: 0 auto;
        }

        h2 {
            margin-left: 40%;
        }
    </style>

</head>
<body>
<form:form action="/j_spring_security_logout" method="post" id="form_submit"> </form:form>
<div class="container">
    <div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class=" container-fluid" style="vertical-align: middle">
                <ul class="nav navbar-nav text-center">
                    <li style="font-size: 15px">
                        <a class="navbar-brand" href="/admin"><i class="fa fa-home fa-1x"></i> Главная</a>
                    </li>
                    <li><a href="#"><i class="fa fa-search fa-1x"></i> Подбор тура</a></li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bars"></i> Страны
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/country">Добавить</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-comment"></i> Отзывы</a></li>
                    <li><a href="#"><i class="fa fa-users"></i> Заявки</a></li>
                    <li><a href="#"><i class="fa fa-thumb-tack fa-rotate-270"></i> О компании</a></li>

                </ul>

                <ul class="nav navbar-nav navbar-right">

                    <li class="nav navbar-nav navbar-right">
                        <a href="#" id="logout" onclick="document.getElementById('form_submit').submit();">
                            <i class="fa fa-sign-out"></i>Выйти</a>
                    </li>


                </ul>


            </div>
        </div>
    </div>
</div>
<!-- /container -->
<div class="container">
    <div class="row">
        <h2>Добавить тур</h2>
    </div>
    <div class="row">
        <div class="center-block">
            <div class="col-md-5">
                <div class="fileinput fileinput-new" data-provides="fileinput">
                    <div class="fileinput-new thumbnail" style="width: 400px; height:300px">
                        <img>
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail center-block"
                         style="max-width: 400px; max-height:300px">

                    </div>
                    <div>
        <span class="btn btn-default btn-file center-block-btn" style="width: 150px">
            <span class="fileinput-new">Выбрать</span>
            <span class="fileinput-exists">Изменить</span>
            <input type="file">
        </span>
                        <a href="#" class="btn btn-default fileinput-exists center-block-btn"
                           data-dismiss="fileinput" style="width: 150px">Убрать</a>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <form:form class="form-horizontal " method="post" action="/admin/tour/add"
                           modelAttribute="tour">
                    <div class="form-group">
                        <label for="inputTourName" class="col-md-3 control-label "><p class="text-justify">Название
                            тура</p>
                        </label>
                        <div class="col-md-8">
                            <form:input type="text" class="form-control" id="inputTourName"
                                        placeholder="Введите название тура"
                                        path="tourName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker10'>
                            <form:input type='text' class="form-control" path="dateFrom"/>
                            <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>

                    </div>
                    <script type="text/javascript">
                        $(function () {
                            $('#datetimepicker10').datetimepicker({
                                viewMode: 'years',
                                format: 'MM/YYYY'
                            });
                        });
                    </script>
                    <div class="form-group">
                        <label for="inputTimeTo" class="col-md-3 control-label "><p class="text-justify">Дата по</p>
                        </label>
                        <div class="col-md-8">
                            <form:input type="text" class="form-control" id="inputTimeTo"
                                        placeholder="Введите название тура"
                                        path="dateTo"/>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>

<%--http://eonasdan.github.io/bootstrap-datetimepicker/Installing/--%>

<%--http://www.w3schools.com/bootstrap/default.asp--%>

<%--https://itchief.ru/lessons/bootstrap-3/22-the-grid-system-twitter-bootstrap-3--%>