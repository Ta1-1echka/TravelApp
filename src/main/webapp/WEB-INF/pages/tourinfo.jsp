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
    <link href="<c:url value="/resources/css/stars.css"/>" type="text/css" rel="stylesheet"/>

    <script>
        $(document).ready(function () {
            <c:if test="${success}">
            $("#modalSuccess").modal('show');
            </c:if>
            $("#modalBtn").on('click', function () {
                $("#myModalBox").modal('show');
            });

            /* 1. Visualizing things on Hover - See next part for action on click */
            $('#stars li').on('mouseover', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on

                // Now highlight all the stars that's not after the current hovered star
                $(this).parent().children('li.star').each(function (e) {
                    if (e < onStar) {
                        $(this).addClass('hover');
                    }
                    else {
                        $(this).removeClass('hover');
                    }
                });

            }).on('mouseout', function () {
                $(this).parent().children('li.star').each(function (e) {
                    $(this).removeClass('hover');
                });
            });


            /* 2. Action to perform on click */
            $('#stars li').on('click', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently selected
                var stars = $(this).parent().children('li.star');

                for (i = 0; i < stars.length; i++) {
                    $(stars[i]).removeClass('selected');
                }

                for (i = 0; i < onStar; i++) {
                    $(stars[i]).addClass('selected');
                }
                var request = "value=" + $(this).data('value');
                $.ajax({
                    type: "GET",
                    url: "/tour_info/${tour.idTour}/star",
                    data: request,
                    success: function (data) {
                        document.getElementById("rating").innerHTML = data;
                    }
                });
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
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <div class="row">
                <form:form action="/admin/tour/delete/${tour.idTour}" method="post">
                    <button type="submit" class="btn btn-default btn-lg btn-block btn-danger"> Удалить</button>
                </form:form>
            </div>
        </security:authorize>
        <div class="row">
            <h3 class="text-center">
                ${tour.tourName}
            </h3>
        </div>
        <div class="row">
            <div class="col-md-4" class="img-responsive " src="<c:url value="/resources/img/1.jpg"/>">
                <section class='rating-widget'>
                    <div class='rating-stars text-center'>
                        <ul id='stars'>
                            <li class='star' title='Poor' data-value='1'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='Fair' data-value='2'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='Good' data-value='3'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='Excellent' data-value='4'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='WOW!!!' data-value='5'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                        </ul>
                        <p id="rating">${rating}</p>
                    </div>
                </section>
                <br>
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
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4 text-center">
            <h3>Отзывы</h3>
            <br>
        </div>
        <div class="col-lg-4"></div>
    </div>
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <c:forEach items="${tour.commentList}" var="comment">
                <h3>${comment.userName} - ${comment.userEmail}</h3><br>
                <p>${comment.text}</p>
                <hr>
                <br>
            </c:forEach>
        </div>
        <div class="col-lg-3"></div>
    </div>
</div>
<form:form action="/tour/${tour.idTour}/comment" modelAttribute="comment" method="post">
    <div class="container-fluid" style="margin-top: 20px">
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4 text-center">
                <h4>Добавить отзыв</h4>
                <br>
            </div>
            <div class="col-lg-4"></div>
        </div>
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="name" class="col-md-4 control-label "><p class="text-justify">Имя *</p>
                    </label>
                    <div class="col-md-8" id="name">
                        <form:input path="userName" class="form-control"/>
                    </div>
                </div>
                <br><br>
                <div class="form-group">
                    <label for="email" class="col-md-4 control-label "><p class="text-justify">email *</p>
                    </label>
                    <div class="col-md-8" id="email">
                        <form:input type="email" path="userEmail" class="form-control"/>
                    </div>
                </div>
                <br><br>
                <div class="form-group">
                    <label for="text" class="col-md-4 control-label "><p class="text-justify">Отзыв * </p>
                    </label>
                    <div class="col-md-8" id="text">
                        <form:textarea path="text" class="form-control" rows="10"/>
                        <br>
                    </div>
                </div>
                <br><br>
                <div class="form-group">
                    <button type="submit" class="btn btn-default btn-lg btn-block btn-success">
                        Добавить отзыв
                    </button>
                </div>
            </div>
            <div class="col-lg-6"></div>

        </div>
    </div>
</form:form>

</div>
</body>
</html>
