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


    <script src="<c:url value="/resources/bootstrap-select.js"/>"></script>
    <link href="<c:url value="/resources/bootstrap-select.css"/>" type="text/css" rel="stylesheet">


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

            var i = 0,
                j = 0,
                k = 0;
            var countryList = [], cityList = [], hotelList = [], str = '', fistStr = '', secondStr = '', sss;

            <c:forEach items="${countryList}" var="country">
            <c:set var="name" value="${country.nameCode}"/>
            countryList.push("${country.nameCode}")
            </c:forEach>

            var countryId = 'list' + i + '.nameCode', countryName = 'list[' + i + '].nameCode';
            var cityId = 'list' + i + '.cityList' + j + '.cityName', cityName = 'list[' + i + '].cityList[' + j + '].cityName';
            var hotelId = 'list' + i + '.cityList' + j + '.hotelList' + k + '.hotelName',
                hotelName = 'list[' + i + '].cityList[' + j + '].hotelList[' + k + '].hotelName';
            createStr(countryList, countryName);
            $('#countryDiv').append(fistStr);
            createStr(getCityList(countryList[0]), cityName);
            $('#cityDiv').append(fistStr);
            createStr(getHotelList(countryList[0], cityList[0]), hotelName);
            $('#hotelDiv').append(fistStr);

            function add(e) {

                var value = e.value,
                    name = e.name;
                var countryIndex, cityIndex;
                if (name.indexOf("cityName") != -1 && name.indexOf("hotelName") == -1) {
                    cityIndex = e.selectedIndex;
                    var nameCountry = name.substring(0, name.indexOf("]") + 2);
                    nameCountry += "nameCode";
                    countryIndex = document.getElementsByName(nameCountry)[0].selectedIndex;
                    var nameHotel = name.substring(0, name.indexOf("cityName"));
                    nameHotel += "hotelList["
                    for (var t = 0; ; t++) {
                        var search = nameHotel + t + "].hotelName";
                        var resultSelect = document.getElementsByName(search);
                        if (resultSelect.length == 0)
                            return;
                        hotelList = getHotelList(countryList[countryIndex], cityList[cityIndex]);
                        while (resultSelect[0].options.length) {
                            resultSelect[0].remove(0);
                        }
                        for (var opt = 0; opt < hotelList.length; opt++) {
                            var hotel = new Option(hotelList[opt], hotelList[opt]);
                            resultSelect[0].options.add(hotel);
                        }
                    }

                }
                else if (name.indexOf("nameCode") != -1 && name.indexOf("cityName") == -1 && name.indexOf("hotelName") == -1) {
                    countryIndex = e.selectedIndex;
                    var nameCity = name.substring(0, name.indexOf("nameCode"));
                    cityList = getCityList(countryList[countryIndex]);
                    hotelList = getHotelList(countryList[countryIndex], cityList[0]);
                    nameCity += "cityList[";
                    for (var t = 0; ; t++) {
                        var search = nameCity + t + "].cityName";
                        var resultSelect = document.getElementsByName(search);
                        if (resultSelect.length == 0)
                            break;
                        while (resultSelect[0].options.length) {
                            resultSelect[0].remove(0);
                        }
                        for (var opt = 0; opt < cityList.length; opt++) {
                            var city = new Option(cityList[opt], cityList[opt]);
                            resultSelect[0].options.add(city);
                        }
                        for (var hindex = 0; ; hindex++) {
                            var searchHotel = nameCity + t + "].hotelList[" + hindex + "].hotelName";
                            var resultSelectHotel = document.getElementsByName(searchHotel);
                            if (resultSelectHotel.length == 0)
                                break;
                            while (resultSelectHotel[0].options.length) {
                                resultSelectHotel[0].remove(0);
                            }
                            for (var optH = 0; optH < hotelList.length; optH++) {
                                var hotel = new Option(hotelList[optH], hotelList[optH]);
                                resultSelectHotel[0].options.add(hotel);
                            }
                        }
                    }


                }

            };

            function getCityList(name) {
                <c:forEach items="${countryList}" var="country">
                sss = "${country.nameCode}";
                if (name.localeCompare(sss) == 0) {
                    cityList = [];
                    <c:forEach items="${country.cityList}" var="city">
                    cityList.push("${city.cityName}");
                    </c:forEach>
                    return cityList;
                }
                </c:forEach>
            }

            function getHotelList(countryName, cityName) {
                <c:forEach items="${countryList}" var="country">
                if (countryName.localeCompare("${country.nameCode}") == 0) {
                    <c:forEach items="${country.cityList}" var="city">
                    if (cityName.localeCompare("${city.cityName}") == 0) {
                        hotelList = [];
                        <c:forEach items="${city.hotelList}" var="hotel">
                        hotelList.push("${hotel.hotelName}");
                        </c:forEach>
                        return hotelList;
                    }
                    </c:forEach>
                }
                </c:forEach>
            }

            function createStr(list, name) {
                fistStr = '<select name="' + name + '" class="form-control ">';

                for (var a = 0; a < list.length; a++)
                    fistStr += ('<option value="' + list[a] + '">' + list[a] + '</option>');


                fistStr += '</select><br>';
                return fistStr;
            }

            document.body.addEventListener("change", function (e) {
                add(e.target);
            });

            $('#btnAddCountry').click(function () {
                i++;
                j = 0;
                k = 0;
                var countryId = 'list' + i + '.nameCode', countryName = 'list[' + i + '].nameCode';
                var cityId = 'list' + i + '.cityList' + j + '.cityName', cityName = 'list[' + i + '].cityList[' + j + '].cityName';
                var hotelId = 'list' + i + '.cityList' + j + '.hotelList' + k + '.hotelName',
                    hotelName = 'list[' + i + '].cityList[' + j + '].hotelList[' + k + '].hotelName';
                cityList = getCityList(countryList[0]);
                hotelList = getHotelList(countryList[0], cityList[0])
                $('#countryDiv').append(createStr(countryList, countryName));
                $('#cityDiv').append(createStr(cityList, cityName));
                $('#hotelDiv').append(createStr(hotelList, hotelName));

            });
            $('#btnAddCity').click(function () {
                k = 0;
                j++;
                var cityId = 'list' + i + '.cityList' + j + '.cityName', cityName = 'list[' + i + '].cityList[' + j + '].cityName';
                var hotelId = 'list' + i + '.cityList' + j + '.hotelList' + k + '.hotelName',
                    hotelName = 'list[' + i + '].cityList[' + j + '].hotelList[' + k + '].hotelName';
                cityList = getCityList(countryList[0]);
                hotelList = getHotelList(countryList[0], cityList[0])
                $('#countryDiv').append('<br><p style="height: 25px"/>');
                $('#cityDiv').append(createStr(cityList, cityName));
                $('#hotelDiv').append(createStr(hotelList, hotelName));
            });
            $('#btnAddHotel').click(function () {
                k++;
                var hotelId = 'list' + i + '.cityList' + j + '.hotelList' + k + '.hotelName',
                    hotelName = 'list[' + i + '].cityList[' + j + '].hotelList[' + k + '].hotelName';
                hotelList = getHotelList(countryList[0], cityList[0])
                $('#countryDiv').append('<br><p style="height: 25px"/>');
                $('#cityDiv').append('<br><p style="height: 25px"/>');
                $('#hotelDiv').append(createStr(hotelList, hotelName));
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
<!-- /container -->
<div class="container">
    <form:form class="form-horizontal " method="post" action="/admin/tour/add" modelAttribute="tour"
               enctype="multipart/form-data">
    <div class="row">
        <h2>Добавить тур</h2>
    </div>
    <div class="row">

        <div class="col-md-5">
            <div class="fileinput fileinput-new" data-provides="fileinput" name="file">
                <spring:bind path="tourName">
                <c:if test="${empty status.errorMessages}">
                <div class="fileinput-new thumbnail" style="width: 400px; height:300px;">
                    </c:if>
                    <c:if test="${not empty status.errorMessages}">
                    <div class="fileinput-new thumbnail" style="width: 400px; height:300px; border-color: #a94442">
                        </c:if>
                        </spring:bind>
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail"
                         style="max-width: 400px; max-height:300px">

                    </div>
                    <div>
        <span class="btn btn-default btn-file center-block-btn" style="width: 150px">
            <span class="fileinput-new">Выбрать</span>
            <span class="fileinput-exists">Изменить</span>
            <input type="file" name="file"></input>
        </span>
                        <a href="#" class="btn btn-default fileinput-exists center-block-btn"
                           data-dismiss="fileinput" style="width: 150px">Убрать</a>
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
                                                                Код страны</p>
                                                            </label>

                                                            <div class="col-md-7" id="countryDiv">

                                                            </div>
                                                            <div class="col-md-2 text-left">
                                                                <button type="button" class="btn" id="btnAddCountry">+
                                                                </button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label "><p
                                                                    class="text-justify">Город</p>
                                                            </label>
                                                            <div class="col-md-7" id="cityDiv">

                                                            </div>
                                                            <div class="col-md-2 text-left">
                                                                <button type="button" class="btn" id="btnAddCity">+
                                                                </button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label "><p
                                                                    class="text-justify">Отель</p>
                                                            </label>
                                                            <div class="col-md-7 " id="hotelDiv">

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

