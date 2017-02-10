<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.js"/>"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/resources/css/imghover.css"/>" type="text/css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet/less" type="text/css" href="<c:url value="/resources/bootstrap-3.3.7/less/bootstrap.less"/>"/>
    <style type="text/css">
        .center-block {
            margin-left: 30%;
            padding: 10px;
        }

        h2 {
            margin-left: 20%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class=" container-fluid" style="vertical-align: middle">
                <ul class="nav navbar-nav text-center">
                    <li style="font-size: 15px">
                        <a class="navbar-brand" href="#"><i class="fa fa-home fa-1x"></i> Главная</a>
                    </li>
                    <li><a href="#"><i class="fa fa-search fa-1x"></i> Подбор тура</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bars"></i> Страны
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-comment"></i> Отзывы</a></li>
                    <li><a href="#"><i class="fa fa-thumb-tack fa-rotate-270"></i> О компании</a></li>


                </ul>

            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="center-block">

            <form:form class="form-signin form-horizontal " role="form" method="post" action="/j_spring_security_check">
                <h2 class="form-signin-heading ">Вход</h2><br>
                <div class="form-group">
                    <div class="col-md-6">
                        <c:if test="${param.error==1}">
                            <div class="alert alert-danger alert-dismissable">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                <strong>Неверно введены данные</strong>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-lg-1 control-label"><i class="fa fa-envelope fa-2x"
                                                                              aria-hidden="true"></i></label>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="inputEmail" placeholder="Введите логин"
                               name="j_username">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputPassword" class="col-lg-1 control-label"><i class="fa fa-user-secret fa-2x"
                                                                                 aria-hidden="true"></i></label>
                    <div class="col-md-5">
                        <input type="password" class="form-control" id="inputPassword" placeholder="Пароль"
                               name="j_password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-5">
                        <div class="checkbox">
                            <label><input type="checkbox"> Запомнить</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-default btn-lg btn-block">Войти</button>
                    </div>
                </div>

            </form:form>

        </div>
    </div>
</div>


</body>
</html>
