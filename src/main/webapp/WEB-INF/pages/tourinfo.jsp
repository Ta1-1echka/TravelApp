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
    <script>
        $(document).ready(function () {
            <c:if test="${success}">
            $("#modalSuccess").modal('show');
            </c:if>
            $("#modalBtn").on('click', function () {
                $("#myModalBox").modal('show');
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
    <form:form action="/tour/request/${tour.idTour}" method="post" modelAttribute="request">
        <div id="myModalBox" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Заголовок модального окна -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Оставить заявку на тур ${tour.tourName}</h4>
                    </div>
                    <div class="modal-body">
                        *<form:input type="text" class="form-control" placeholder="Ваше имя" path="nameUser"/>
                        <br>
                        *<form:input type="text" class="form-control" placeholder="Телефон" path="phone"/>
                        <br>
                        *<form:input type="email" class="form-control" placeholder="email" path="email"/>
                        <br>
                        <form:textarea rows="10" type="text" class="form-control" placeholder="Комментарий"
                                       path="comment"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-primary">Отправить</button>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
    <div id="modalSuccess" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Заголовок модального окна -->
                <div class="modal-body">
                    <p>Заявку на тур ${tour.tourName} Успешно добавлена</p>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <form:form action="/admin/tour/delete/${tour.idTour}" method="post">
                <button type="submit" class="btn btn-default btn-lg btn-block btn-danger"> Удалить</button>
            </form:form>
        </div>
        <div class="row">
            <h3 class="text-center">
                ${tour.tourName}
            </h3>
        </div>
        <div class="row">
            <div class="col-md-4" class="img-responsive " src="<c:url value="/resources/img/1.jpg"/>">
                <img class="img-responsive " src="data:image/jpeg;base64,${tour.photo}"/>
                <br>

                <button type="button" id="modalBtn" class="btn btn-default btn-lg btn-block btn-success"> Оставить
                    заявку
                </button>

            </div>
            <div class="col-md-8 form-horizontal">
                <div class="form-group">
                    <label for="date" class="col-md-4 control-label "><p class="text-justify">Период:</p></label>
                    <div class="col-md-8" id="date">
                        <p class="control-label">${tour.dateFrom} - ${tour.dateTo}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="countryCityHotel" class="col-md-4 control-label "><p class="text-justify">Страны,
                        города, отели:</p></label>
                    <div class="col-md-8" id="countryCityHotel">
                        <p class="control-label">${countryCityHotel}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="allPlaces" class="col-md-4 control-label "><p class="text-justify">Количество свободных
                        мест:</p></label>
                    <div class="col-md-8" id="allPlaces">
                        <p class="control-label text-left">${tour.countAllPlaces}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="adultPrice" class="col-md-4 control-label "><p class="text-justify">Цена для
                        взрослого:</p></label>
                    <div class="col-md-8" id="adultPrice">
                        <p class="control-label text-left">${tour.adultPrice}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="childPrice" class="col-md-4 control-label "><p class="text-justify">Цена для
                        ребенка:</p></label>
                    <div class="col-md-8" id="childPrice">
                        <p class="control-label text-left">${tour.childPrice}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="feedType" class="col-md-4 control-label "><p class="text-justify">Питание:</p></label>
                    <div class="col-md-8" id="feedType">
                        <p class="control-label text-left">${tour.feedType}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="transport" class="col-md-4 control-label "><p class="text-justify">Транспорт:</p>
                    </label>
                    <div class="col-md-8" id="transport">
                        <p class="control-label text-left"> ${tour.transport}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateOutBack" class="col-md-4 control-label "><p class="text-justify">Дата выезда и
                        приезда:</p>
                    </label>
                    <div class="col-md-8" id="dateOutBack">
                        <p class="control-label text-left"> ${tour.dateOut} - ${tour.dateBack}</p>
                    </div>
                </div>


            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h4><strong>О туре:</strong></h4>
                <p class="control-label text-justify lead"> ${tour.aboutTour}</p>
            </div>

        </div>
    </div>
</div>

<div class="container-fluid" style="margin-top: 20px">
    <div class="row no-gutter">


    </div>
</div>

</div> <!-- /container -->
</body>
</html>
