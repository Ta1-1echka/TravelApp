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
            $('.okBtn').on('click', function () {
                var element = this.parentNode.parentNode;
                var nodes = element.children;
                nodes[0].children[0].value = "OK";
                element.setAttribute("class", "bg-success");
            });
            $('.badBtn').on('click', function () {
                var element = this.parentNode.parentNode;
                var nodes = element.children;
                nodes[0].children[0].value = "BAD";
                element.setAttribute("class", "bg-danger");
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

    <div class="container-fluid" style="margin-top: 20px">
        <div class="row">
            <c:if test="${success}">
                <div class="alert alert-success alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                    <strong> Данные успешно сохранены </strong>
                </div>
            </c:if>
        </div>
        <div class="row">
            <table class="table">
                <thead>
                <tr>
                    <th>№ п/п</th>
                    <th>Тур</th>
                    <th>Имя</th>
                    <th>Телефон</th>
                    <th>E-mail</th>
                    <th>Комментарий</th>
                    <th>Статус</th>
                </tr>
                </thead>
                <tbody>
                <form:form action="/admin/requests/change" method="post" modelAttribute="request">
                    <c:forEach items="${request.list}" var="req" varStatus="status">
                        <input type="hidden" name="list[${status.index}].idRequest" value="${req.idRequest}"/>
                        <c:if test="${req.requestStatus eq 'OK'}">
                            <tr class="bg-success">
                        </c:if>
                        <c:if test="${req.requestStatus eq 'WAIT'}">
                            <tr class="bg-warning">
                        </c:if>
                        <c:if test="${req.requestStatus eq 'BAD'}">
                            <tr class="bg-danger">
                        </c:if>
                        <td style="display: none">
                            <input type="hidden" name="list[${status.index}].requestStatus" value="${req.requestStatus}"/>
                        </td>
                        <td>${req.idRequest}</td>
                        <td><a href="/tour_info/${req.tour.idTour}">${req.tour.tourName}</a></td>
                        <td>${req.nameUser}</td>
                        <td>${req.phone}</td>
                        <td>${req.email}</td>
                        <td>${req.comment}</td>
                        <td>
                            <button type="button" class="okBtn">
                                <i class="fa fa-check-circle-o" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="badBtn">
                                <i class="fa fa-times" aria-hidden="true"></i>
                            </button>
                        </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6">
                            <button type="submit" class="btn "> Сохранить изменения </button>
                        </td>
                    </tr>
                </form:form>
                </tbody>
            </table>
        </div>
    </div>

</div> <!-- /container -->
</body>
</html>
