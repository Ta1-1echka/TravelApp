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
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bars"></i> Страны
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/country">Добавить</a></li>
                            <li><a href="#">Удалить</a></li>
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


    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="input-group">
                <input type="text" class="form-control">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        Поиск
                     </button>
                </span>

            </div>
        </div>
    </div>


    <div class="container-fluid" style="margin-top: 20px">
        <div class="row no-gutter">
            <div class="col-lg-4 text-center">
                <div class="embed-responsive embed-responsive-4by3">
                    <div class="hovereffect embed-responsive-item">
                        <img class="img-responsive " src="<c:url value="/resources/img/1.jpg"/>">
                        <div class="overlay">
                            <h2>Hover effect 1 мрмрпм мр мпр мпрм мрп мрп мрпм мрмрпмрпмр </h2>
                            <p class="info">
                                Тур выходного дня<br>
                                Cnjbvjcnm
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 text-center">
                <div class="embed-responsive embed-responsive-4by3">
                    <div class="hovereffect embed-responsive-item">
                        <img class="img-responsive " src="<c:url value="/resources/img/1.jpg"/>">
                        <div class="overlay">
                            <h2>Hover effect 1</h2>
                            <a class="info" href="#">Подробнее</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 text-center">
                <div class="embed-responsive embed-responsive-4by3">
                    <div class="hovereffect embed-responsive-item">
                        <img class="img-responsive " src="<c:url value="/resources/img/1.jpg"/>">
                        <div class="overlay">
                            <h2>Hover effect 1</h2>
                            <a class="info" href="#">link here</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div> <!-- /container -->
</body>
</html>
