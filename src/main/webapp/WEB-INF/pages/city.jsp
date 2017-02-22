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
            var i = document.getElementsByClassName('hotel').length;
            var k = 0;
            $('#btnAddHotel').click(function () {
                $('#hotelDiv').append('<br><input type="text" class="form-control" name="hotelList[' + i + '].hotelName">');
                if (k == 0)
                    $('#btnSaveHotel').append('<br><button type="submit" class="btn">Сохранить изменения</button>');
                k++;
                i++;
            });
            $('#btnEdit').click(function () {

                document.getElementById("textBlock").style.display = "none";
                document.getElementById("inputBlock").style.display = "block";
                document.getElementById("btnEdit").style.display = "none";
                document.getElementById("btnSave").style.display = "block";


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
                <form:form action="/admin/country/city/delete/${city.idCity}" method="post">
                    <button type="submit" class="btn btn-default btn-lg btn-block btn-danger"> Удалить</button>
                </form:form>
            </div>
        </div>
    </div>
</security:authorize>

<div class="container">
    <div class="row">
        <div class="col-lg-2">
        </div>
        <div class="col-lg-6">
            <form:form action="/admin/country/city/edit/${city.idCity}" method="post">
                <h2><strong>Страна - ${city.country.nameCode}</strong></h2>
                <h4 style="display:block;" id="textBlock"><strong>Город - ${city.cityName}</strong></h4>
                <h4 style="display:none;" id="inputBlock"><strong>Город </strong><input type="text" name="cityName"
                                                                                        class="form-control"
                                                                                        value="${city.cityName}"/>
                </h4>
                <button type="button" class="btn btn-default btn-lg btn-block btn-info" id="btnEdit"
                        style="display: block;">Редактироваь
                </button>
                <button type="submit" class="btn btn-default btn-lg btn-block btn-info" id="btnSave"
                        style="display: none;">Сохранить изменения
                </button>
            </form:form>
        </div>
        <form:form modelAttribute="city" method="post" action="/admin/country/city/save">
        <form:hidden path="idCity"/>
        <div class="col-lg-4">
            <div class="row">
                <div class="col-lg-6">
                    <h4>Отели
                        <button type="button" class="btn" id="btnAddHotel">+</button>
                    </h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6" id="hotelDiv">
                    <c:forEach items="${city.hotelList}" var="hotel" varStatus="status">
                        <input type="hidden" name="hotelList[${status.index}].idHotel" value="${hotel.idHotel}">
                        <p name="hotelList[${status.index}].hotelName">${hotel.hotelName}</p>
                        <input type="text" class="form-control" name="hotelName" value="${hotel.hotelName}"
                               style="display: none"/>
                        <%--<button type="button" class="btn" id="btnEditHotel">*</button>--%>
                        <a href="/admin/country/city/hotel/edit/${hotel.idHotel}/"
                            class="hotel"></a>
                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6" id="btnSaveHotel">
                </div>
            </div>

        </div>

    </div>
</div>
</form:form>

</body>
</html>
