<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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

    <!-- Include Bootstrap Datepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css"/>

    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
    <%--<script src="http://code.jquery.com/jquery-2.2.0.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/js/dropdown.js"/>"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            $('#inputDateBack').datepicker({
                format: 'yyyy-mm-dd'
            });
            $('#inputDateTo').datepicker({
                format: 'yyyy-mm-dd'
            });
            $('#inputDateOut').datepicker({
                format: 'yyyy-mm-dd'
            });
            $('#inputDateFrom').datepicker({
                format: 'yyyy-mm-dd'
            });

            var i = document.getElementsByClassName('tourCountry').length;
            $('#btnAddCountry').click(function () {
                $('#countryDiv').append('<br><input name="tourHotelCityList[' + i + '].country.nameCode" class="form-control"/>');
                $('#cityDiv').append('<br> <input name="tourHotelCityList[' + i + '].city.cityName" class="form-control"/>');
                $('#hotelDiv').append('<br> <input name="tourHotelCityList[' + i + '].hotel.hotelName" class="form-control"/>');
                i++;
            });
            $('#btnAddCity').click(function () {
                var country = document.getElementsByName("tourHotelCityList[" + (i - 1) + "].country.nameCode")[0].value;
                $('#countryDiv').append('<br><p style="height: 25px"/><input type="hidden" name="tourHotelCityList[' + i + '].country.nameCode"  ' +
                    'class="form-control" value="' +
                    country + '"/>');
                $('#cityDiv').append('<br> <input name="tourHotelCityList[' + i + '].city.cityName" class="form-control"/>');
                $('#hotelDiv').append('<br> <input name="tourHotelCityList[' + i + '].hotel.hotelName" class="form-control"/>');

                i++;
            });

            $('#btnAddHotel').click(function () {
                var country = document.getElementsByName("tourHotelCityList[" + (i - 1) + "].country.nameCode")[0].value;
                var city = document.getElementsByName("tourHotelCityList[" + (i - 1) + "].city.cityName")[0].value;

                $('#countryDiv').append('<br><p style="height: 25px"/><input type="hidden" name="tourHotelCityList[' + i + '].country.nameCode"  ' +
                    'class="form-control" value="' +
                    country + '"/>');
                $('#cityDiv').append('<br><p style="height: 25px"/><input type="hidden" name="tourHotelCityList[' + i + '].city.cityName"  ' +
                    'class="form-control" value="' +
                    city + '"/>');
                $('#hotelDiv').append('<br> <input name="tourHotelCityList[' + i + '].hotel.hotelName" class="form-control"/>');
                i++;
            });


        });
    </script>

    <style type="text/css">
        .center-block {
            margin-left: 25%;
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
<div class="container">
    <form:form class="form-horizontal " method="post" action="/admin/tour/edit" modelAttribute="tour"
               enctype="multipart/form-data">
    <div class="row">
        <h2>Редактировать тур</h2>
    </div>
    <div class="row">

        <div class="col-md-5">
            <div class="fileinput fileinput-new" data-provides="fileinput" name="file">

                <div class="fileinput-new thumbnail" style="width: 400px; height:300px;">
                    <img class="img-responsive " src="data:image/jpeg;base64,${tour.photo}"/>
                </div>
                <div class="fileinput-preview fileinput-exists thumbnail"
                     style="max-width: 400px; max-height:300px">

                </div>
                <div>

                </div>

            </div>
        </div>
        <div class="col-md-7">

            <div class="form-group">
                <label for="inputTourName" class="col-md-4 control-label "><p class="text-justify">Название
                    тура</p>
                </label>
                <spring:bind path="tourName">
                <c:if test="${empty status.errorMessages}">
                <div class="col-md-8"></c:if>

                    <c:if test="${not empty status.errorMessages}">
                    <div class="col-md-8 has-error"></c:if>
                        </spring:bind>
                        <form:input type="text" class="form-control" id="inputTourName"
                                    placeholder="Введите название тура"
                                    path="tourName"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputDateFrom" class="col-md-2 control-label "><p class="text-justify">Дата с</p>
                    </label>
                    <spring:bind path="dateFrom">
                    <c:if test="${empty status.errorMessages}">
                    <div class="col-md-4"></c:if>

                        <c:if test="${not empty status.errorMessages}">
                        <div class="col-md-4 has-error"></c:if>
                            </spring:bind>
                            <div class="input-group input-append date" id="inputDateFrom">
                                <form:input type="text" class="form-control" name="date" path="dateFrom"/>
                                <span class="input-group-addon add-on"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>


                        <label for="inputDateTo" class="col-md-2 control-label "><p class="text-justify">Дата по</p>
                        </label>
                        <spring:bind path="dateTo">
                        <c:if test="${empty status.errorMessages}">
                        <div class="col-md-4"></c:if>

                            <c:if test="${not empty status.errorMessages}">
                            <div class="col-md-4 has-error"></c:if>
                                </spring:bind>
                                <div class="input-group input-append date" id="inputDateTo">
                                    <form:input type="text" class="form-control" name="date" path="dateTo"/>
                                    <span class="input-group-addon add-on"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="inputPlaceCount" class="col-md-4 control-label "><p class="text-justify">
                                Количество мест</p>
                            </label>
                            <spring:bind path="countAllPlaces">
                            <c:if test="${empty status.errorMessages}">
                            <div class="col-md-8"></c:if>

                                <c:if test="${not empty status.errorMessages}">
                                <div class="col-md-8 has-error"></c:if>
                                    </spring:bind>
                                    <form:input type="text" class="form-control" id="inputPlaceCount"
                                                placeholder="Введите количество мест"
                                                path="countAllPlaces"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputAdultPrice" class="col-md-4 control-label "><p
                                        class="text-justify">
                                    Цена для
                                    взрослого</p>
                                </label>
                                <spring:bind path="adultPrice">
                                <c:if test="${empty status.errorMessages}">
                                <div class="col-md-2"></c:if>

                                    <c:if test="${not empty status.errorMessages}">
                                    <div class="col-md-2 has-error"></c:if>
                                        </spring:bind>
                                        <form:input type="text" class="form-control" id="inputAdultPrice"
                                                    placeholder="Введите цену тура для взрослого"
                                                    path="adultPrice"/>
                                    </div>
                                    <label for="inputChildPrice" class="col-md-4 control-label "><p
                                            class="text-justify">Цена для
                                        ребенка</p>
                                    </label>
                                    <spring:bind path="childPrice">
                                    <c:if test="${empty status.errorMessages}">
                                    <div class="col-md-2"></c:if>

                                        <c:if test="${not empty status.errorMessages}">
                                        <div class="col-md-2 has-error"></c:if>
                                            </spring:bind>
                                            <form:input type="text" class="form-control" id="inputChildPrice"
                                                        placeholder="Введите цену тура для ребенка"
                                                        path="childPrice"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputFeedType" class="col-md-3 control-label "><p
                                                class="text-justify">Тип
                                            питания</p>
                                        </label>
                                        <spring:bind path="feedType">
                                        <c:if test="${empty status.errorMessages}">
                                        <div class="col-md-3"></c:if>

                                            <c:if test="${not empty status.errorMessages}">
                                            <div class="col-md-3 has-error"></c:if>
                                                </spring:bind>
                                                <form:select path="feedType" class="form-control"
                                                             id="inputFeedType">
                                                    <form:option value=""/>
                                                    <form:options items="${feedTypeList}"/>
                                                </form:select>
                                            </div>

                                            <label for="inputTransport" class="col-md-3 control-label "><p
                                                    class="text-justify">
                                                Транспорт</p>
                                            </label>
                                            <spring:bind path="transport">
                                            <c:if test="${empty status.errorMessages}">
                                            <div class="col-md-3"></c:if>

                                                <c:if test="${not empty status.errorMessages}">
                                                <div class="col-md-3 has-error"></c:if>
                                                    </spring:bind>
                                                    <form:select path="transport" class="form-control"
                                                                 id="inputTransport">
                                                        <form:option value=""/>
                                                        <form:options items="${TransportList}"/>
                                                    </form:select>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label for="inputDateOut" class="col-md-3 control-label "><p
                                                        class="text-justify">Дата
                                                    выезда</p>
                                                </label>
                                                <spring:bind path="dateOut">
                                                <c:if test="${empty status.errorMessages}">
                                                <div class="col-md-3 date"></c:if>

                                                    <c:if test="${not empty status.errorMessages}">
                                                    <div class="col-md-3 date has-error"></c:if>
                                                        </spring:bind>
                                                        <div class="input-group input-append date"
                                                             id="inputDateOut">
                                                            <form:input type="text" class="form-control" name="date"
                                                                        path="dateOut"/>
                                                            <span class="input-group-addon add-on"><span
                                                                    class="glyphicon glyphicon-calendar"></span></span>
                                                        </div>
                                                    </div>


                                                    <label for="inputDateBack" class="col-md-3 control-label "><p
                                                            class="text-justify">Дата
                                                        приезда</p>
                                                    </label>
                                                    <spring:bind path="dateBack">
                                                    <c:if test="${empty status.errorMessages}">
                                                    <div class="col-md-3 date"></c:if>

                                                        <c:if test="${not empty status.errorMessages}">
                                                        <div class="col-md-3 date has-error"></c:if>
                                                            </spring:bind>
                                                            <div class="input-group input-append date"
                                                                 id="inputDateBack">
                                                                <form:input type="text" class="form-control"
                                                                            name="date"
                                                                            path="dateBack"/>
                                                                <span class="input-group-addon add-on"><span
                                                                        class="glyphicon glyphicon-calendar"></span></span>
                                                            </div>

                                                        </div>

                                                    </div>


                                                </div>

                                            </div>


                                            <div class="row">
                                                <br>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label "><p
                                                                class="text-justify">
                                                            Код страны </p>
                                                        </label>

                                                        <div class="col-md-7" id="countryDiv">
                                                            <c:forEach items="${tour.tourHotelCityList}"
                                                                       var="tourHotelCityList" varStatus="status">

                                                                <c:choose>
                                                                    <c:when test="${status.index==0}">
                                                                        <br><input
                                                                            name="tourHotelCityList[${status.index}].country.nameCode"
                                                                            value="${tourHotelCityList.country.nameCode}"
                                                                            class="form-control tourCountry"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:choose>
                                                                            <c:when test="${nameCode eq tourHotelCityList.country.nameCode}">
                                                                                <br><p style="height: 25px"/>
                                                                                <input type="hidden"
                                                                                       name="tourHotelCityList[${status.index}].country.nameCode"
                                                                                       value="${tourHotelCityList.country.nameCode}"
                                                                                       class="form-control tourCountry"/>
                                                                            </c:when>
                                                                            <c:when test="${city eq tourHotelCityList.city.cityName}">
                                                                                <br><p style="height: 25px"/>
                                                                                <input type="hidden"
                                                                                       name="tourHotelCityList[${status.index}].country.nameCode"
                                                                                       value="${tourHotelCityList.country.nameCode}"
                                                                                       class="form-control tourCountry"/>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input name="tourHotelCityList[${status.index}].country.nameCode"
                                                                                       value="${tourHotelCityList.country.nameCode}"
                                                                                       class="form-control tourCountry"/>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:set value="${tourHotelCityList.country.nameCode}"
                                                                       var="nameCode"/>
                                                                <c:set value="${tourHotelCityList.city.cityName}"
                                                                       var="city"/>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="col-md-2 text-left">
                                                            <button type="button" class="btn" id="btnAddCountry">+
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="inputCity" class="col-md-3 control-label "><p
                                                                class="text-justify">Город</p>
                                                        </label>
                                                        <div class="col-md-7" id="cityDiv">
                                                            <c:forEach items="${tour.tourHotelCityList}"
                                                                       var="tourHotelCityList" varStatus="status">

                                                                <c:choose>
                                                                    <c:when test="${status.index==0}">
                                                                        <br><input
                                                                            name="tourHotelCityList[${status.index}].city.cityName"
                                                                            value="${tourHotelCityList.city.cityName}"
                                                                            id="inputCity" class="form-control"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:choose>
                                                                            <c:when test="${city eq tourHotelCityList.city.cityName}">
                                                                                <br><p style="height: 25px"/>
                                                                                <input type="hidden"
                                                                                    name="tourHotelCityList[${status.index}].city.cityName"
                                                                                    value="${tourHotelCityList.city.cityName}"
                                                                                    id="inputCity" class="form-control"/>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <br><input
                                                                                    name="tourHotelCityList[${status.index}].city.cityName"
                                                                                    value="${tourHotelCityList.city.cityName}"
                                                                                    id="inputCity" class="form-control"/>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:set value="${tourHotelCityList.city.cityName}"
                                                                       var="city"/>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="col-md-2 text-left">
                                                            <button type="button" class="btn" id="btnAddCity">+
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="inputHotel" class="col-md-3 control-label "><p
                                                                class="text-justify">Отель</p>
                                                        </label>
                                                        <div class="col-md-7 " id="hotelDiv">
                                                            <c:forEach items="${tour.tourHotelCityList}"
                                                                       var="tourHotelCityList" varStatus="status">
                                                                <br>
                                                                <input name="tourHotelCityList[${status.index}].hotel.hotelName"
                                                                       value="${tourHotelCityList.hotel.hotelName}"
                                                                       id="inputHotel" class="form-control"/>

                                                            </c:forEach>
                                                        </div>
                                                        <div class="col-md-2 text-left">
                                                            <button type="button" class="btn" id="btnAddHotel">+
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label for="inputAbout" class="col-md-2 control-label "><p
                                                        class="text-justify">Описание тура</p>
                                                </label>
                                                <spring:bind path="aboutTour">
                                                <c:if test="${empty status.errorMessages}">
                                                <div class="col-md-10"></c:if>

                                                    <c:if test="${not empty status.errorMessages}">
                                                    <div class="col-md-10 has-error"></c:if>
                                                        </spring:bind>
                                                        <form:textarea path="aboutTour" type="text" id="inputAbout"
                                                                       class="form-control"
                                                                       placeholder="Введите информацию о туре"
                                                                       rows="20"/>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">

                                                    <button type="submit" class="btn btn-default btn-lg btn-block">
                                                        Добавить
                                                    </button>

                                                </div>
                                                </form:form>
                                            </div>

                                        </div>

</body>
</html>

