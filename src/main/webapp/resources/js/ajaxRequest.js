$(document).ready(function () {
    $('#but').click(function () {
        var searchText = $('#searchText').val();
        if (searchText.length > 0) {
            ajaxRequest(searchText);
        }
        else {
            alert("Enter city");
        }
    });
});

function ajaxRequest(term) {
    $.ajax({
        type: 'GET',
        url: '/login/weather',
        data: {'city': term},
        success: function (data) {

         }
    });
}