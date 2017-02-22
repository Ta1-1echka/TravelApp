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
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css"/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/i18n/defaults-*.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            $('#inputDateTo').datepicker({
                format: 'yyyy-mm-dd'
            });
            $('#inputDateFrom').datepicker({
                format: 'yyyy-mm-dd'
            });
        });
    </script>
</head>
<body>
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
    <form:form modelAttribute="search" method="post" action="/search">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="input-group">

                    <input type="text" class="form-control" name="search">
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        Поиск
                     </button>
                </span>

                </div>
            </div>
        </div>
    </form:form>
    <security:authorize access="hasRole('ROLE_ADMIN')">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 center-block">
                    <br>
                    <form:form action="/admin/tour" method="post">
                        <button type="submit" class="btn btn-default btn-lg btn-block btn-success"> Добавить</button>
                    </form:form>
                </div>
            </div>
        </div>
    </security:authorize>
    <div class="container-fluid" style="margin-top: 20px">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 text-center">
                <h3>Форма фильтрации</h3>
            </div>
            <div class="col-lg-3"></div>
        </div>
        <form:form modelAttribute="search" method="post" action="/filter">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="inputTo" class="col-md-2 control-label "><p class="text-justify">Куда</p>
                        </label>
                        <div class="col-md-8">
                            <select class="selectpicker" multiple name="countryNameList" id="inputTo">
                                <c:forEach items="${countries}" var="country">
                                    <option>${country}</option>
                                </c:forEach>
                            </select>

                                <%--<input type="text" class="form-control" id="inputTo" placeholder="Выберите страну"/>--%>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">

                        <label for="inputFeedType" class="col-md-3 control-label "><p class="text-justify">Тип
                            питания</p></label>

                        <div class="col-md-3">
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

                        <div class="col-md-3">
                            <form:select path="transport" class="form-control"
                                         id="inputTransport">
                                <form:option value=""/>
                                <form:options items="${transportList}"/>
                            </form:select>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label for="dateFrom" class="col-md-2 control-label "><p class="text-justify">Дата с</p>
                        </label>
                        <div class="col-md-4">
                            <div class="input-group input-append date" id="inputDateFrom">
                                <form:input type="text" class="form-control" name="date" path="dateFrom"/>
                                <span class="input-group-addon add-on"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                        <label for="dateTo" class="col-md-2 control-label "><p class="text-justify">Дата по</p>
                        </label>
                        <div class="col-md-4">
                            <div class="input-group input-append date" id="inputDateTo">
                                <form:input type="text" class="form-control" name="date" path="dateTo"/>
                                <span class="input-group-addon add-on"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>

                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label class="col-md-2 control-label "><p class="text-justify">Стоимость</p>
                        </label>
                        <div class="col-md-3">
                            <form:input type="text" class="form-control" path="priceFrom"/>
                        </div>
                        <div class="col-md-1"><p> до </p></div>
                        <div class="col-md-3">
                            <form:input type="text" class="form-control" path="priceTo"/>
                        </div>

                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <button type="submit" class="btn col-lg-12">Найти</button>
                    </div>
                </div>


            </div>

        </form:form>
    </div>

    <div class="container-fluid" style="margin-top: 20px">
        <div class="row">
            ${tourEmpty}
            <c:forEach items="${tours}" var="tour">
                <div class="col-lg-4 text-center">
                    <div class="embed-responsive embed-responsive-4by3">
                        <div class="hovereffect embed-responsive-item">
                            <img class="img-responsive " src="data:image/jpeg;base64,${tour.photo}"/>
                            <div class="overlay">
                                <h2><c:out value="${tour.tourName}"/></h2>
                                <a class="info" href="/tour_info/${tour.idTour}">
                                    Подробнее
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div> <!-- /container -->
</body>
</html>
