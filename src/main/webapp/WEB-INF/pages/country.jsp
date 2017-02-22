<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
            margin-left: 40%;
            padding: 10px;
        }

        h2 {
            margin-left: 17%;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var i = document.getElementsByClassName('city').length;
            var k = 0;
            $('#btnAddCity').click(function () {
                $('#cityDiv').append('<br><input type="text" class="form-control" name="cityList[' + i + '].cityName">');
                if (k == 0)
                    $('#btnSave').append('<br><button type="submit" class="btn">Сохранить изменения</button>');
                k++;
                i++;
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
                        <a class="navbar-brand" href="/"><i class="fa fa-home fa-1x"></i> Главная</a>
                    </li>
                    <li><a href="#"><i class="fa fa-search fa-1x"></i> Подбор тура</a></li>
                    <li><a href="/country"><i class="fa fa-bars"></i> Страны</a></li>
                    <li><a href="#"><i class="fa fa-comment"></i> Отзывы</a></li>
                    <security:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="#"><i class="fa fa-users"></i> Заявки</a></li>
                    </security:authorize>
                    <li><a href="#"><i class="fa fa-thumb-tack fa-rotate-270"></i> О компании</a></li>


                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <security:authorize access="isAnonymous()">
                        <li class="nav navbar-nav navbar-right"><a href="/login"><i class="fa fa-sign-in"></i> Войти</a>
                        </li>
                    </security:authorize>
                    <security:authorize access="hasRole('ROLE_ADMIN')">
                        <form:form action="/j_spring_security_logout" method="post" id="form_submit"> </form:form>
                        <li class="nav navbar-nav navbar-right">
                            <a href="#" id="logout" onclick="document.getElementById('form_submit').submit();">
                                <i class="fa fa-sign-out"></i>Выйти</a>
                        </li>
                    </security:authorize>
                </ul>


            </div>
        </div>
    </div>
</div>
<security:authorize access="hasRole('ROLE_ADMIN')">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-2">
                <form:form action="/admin/country/edit/${country.idCountry}" method="post">
                    <button type="submit" class="btn btn-default btn-lg btn-block btn-info"> Редактироваь</button>
                </form:form>
            </div>
            <div class="col-lg-2">
                <form:form action="/admin/country/delete/${country.idCountry}" method="post">
                    <button type="submit" class="btn btn-default btn-lg btn-block btn-danger"> Удалить</button>
                </form:form>
            </div>
        </div>
    </div>
</security:authorize>
<form:form modelAttribute="country" method="post" action="/admin/country/cities/save">
    <form:hidden path="idCountry"/>
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-6">
                <h2><strong>${country.nameCode}</strong></h2>
                <h4><strong>Столица - </strong>
                    <p name="nameCode">${country.capital}</p></h4>
                <h4><strong>Валюта - </strong>
                    <p name="nameCode">${country.currency}</p></h4>
                <h4><strong>Язык(и)</strong>
                    <c:forEach items="${country.languageList}" var="lang" varStatus="i">
                        <input type="hidden" name="languageList[${i.index}].idLanguage" value="${lang.idLanguage}">
                        <p name="languageList[${i.index}].languageName">${lang.languageName}</p>
                    </c:forEach>
                </h4>
                <h4><strong>О стране</strong></h4>
                <h4><p name="about">${country.about}</p></h4>
                <h4><strong>О климате</strong></h4>
                <h4><p name="climate">${country.climate}</p></h4>

            </div>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-lg-6">
                            <h4>Города

                                <button type="button" class="btn" id="btnAddCity">+</button>

                            </h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6" id="cityDiv">
                            <c:forEach items="${country.cityList}" var="city" varStatus="status">
                                <input type="hidden" name="cityList[${status.index}].idCity" value="${city.idCity}">
                                <p><a href="/country/city/${city.idCity}" name="cityList[${status.index}].cityName"
                                      class="city">${city.cityName}</a>
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6" id="btnSave">
                        </div>
                    </div>

                </div>
            </security:authorize>

        </div>
    </div>
</form:form>

</body>
</html>
