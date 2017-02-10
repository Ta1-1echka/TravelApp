<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            margin-left: 20%;
            padding: 10px;
        }

        h2 {
            margin-left: 17%;
        }
    </style>
    <script>
        $(document).ready(function () {
            var i = 1, n = 5;
            $('#btnAdd').click(function () {
                if (i < 5) {
                    $('#lang').append('<br><input name="languageList[' + i + '].languageName" class="form-control" />');
                    i++;
                }
            });
        });
    </script>
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
                            <li><a href="#">Добавить</a></li>
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
<div class="container">
    <div class="row">
        <div class="center-block">

            <form:form class="form-signin form-horizontal " role="form" method="post" action="/admin/country/add"
                       modelAttribute="country">
                <h2 class="form-signin-heading ">Добавить страну</h2>
                <div class="form-group">
                    <label for="inputNameCode" class="col-md-2 control-label "><p class="text-justify">Код страны</p>
                    </label>
                    <div class="col-md-5">
                        <form:input type="text" class="form-control" id="inputNameCode" placeholder="Введите код страны"
                                    path="nameCode"/>
                    </div>
                    <div class="col-md-4">
                        <spring:bind path="nameCode">
                            <c:if test="${not empty status.errorMessages}">
                                <div class="alert alert-danger alert-dismissable">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                    <strong><form:errors path="capital"></form:errors></strong>
                                </div>
                            </c:if>
                        </spring:bind>
                    </div>

                </div>

                <div class="form-group">
                    <label for="inputСapital" class="col-md-2 control-label text-left"><p class="text-justify">
                        Столица </p></label>
                    <div class="col-md-5">
                        <form:input type="text" class="form-control" id="inputСapital"
                                    placeholder="Введите столицу страны"
                                    path="capital"/>
                    </div>
                    <div class="col-md-4">
                        <spring:bind path="nameCode">
                            <c:if test="${not empty status.errorMessages}">
                                <div class="alert alert-danger alert-dismissable">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                    <strong><form:errors path="capital"></form:errors></strong>
                                </div>
                            </c:if>
                        </spring:bind>
                    </div>

                </div>
                <div class="form-group">
                    <label for="inputСurrency" class="col-md-2 control-label text-left"><p class="text-justify">
                        Валюта страны </p></label>
                    <div class="col-md-5">
                        <form:input type="text" class="form-control" id="inputСurrency"
                                    placeholder="Введите валюту страны"
                                    path="currency"/>
                    </div>
                    <div class="col-md-4">
                        <spring:bind path="nameCode">
                            <c:if test="${not empty status.errorMessages}">
                                <div class="alert alert-danger alert-dismissable">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                    <strong><form:errors path="currency"></form:errors></strong>
                                </div>
                            </c:if>
                        </spring:bind>
                    </div>

                </div>
                <div class="form-group">
                    <label for="inputLanguage" class="col-md-2 control-label text-left"><p class="text-justify">
                        Язык(и) страны </p></label>
                    <div class="col-md-5" id="lang">
                        <input name="languageList[0].languageName" id="inputLanguage" class="form-control"/>
                    </div>
                    <button type="button" class="btn" id="btnAdd">+</button>
                </div>
                <div class="form-group">
                    <label for="inputAbout" class="col-md-2 control-label text-left"><p class="text-justify">
                        О стране </p></label>
                    <div class="col-md-8">
                        <form:textarea type="text" class="form-control" id="inputAbout" placeholder="Введите о страны"
                                       path="about" cols="100" rows="10"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputСlimate" class="col-md-2 control-label text-left"><p class="text-justify">
                        О климате </p></label>
                    <div class="col-md-8">
                        <form:textarea type="text" class="form-control" id="inputСlimate"
                                       placeholder="Введите о климате страны"
                                       path="climate" cols="100" rows="10"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-7">
                        <button type="submit" class="btn btn-default btn-lg btn-block">Добавить</button>
                    </div>
                </div>
                <c:if test="${param.error==1}">
                    <div class="col-md-6">
                        <p class="bg-danger" style="height: 5%">Something is wrong</p>
                    </div>
                </c:if>
            </form:form>

        </div>
    </div>
</div>
</body>
</html>
