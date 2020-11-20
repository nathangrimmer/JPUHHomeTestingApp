function createModal() {  
        //$('#listModal').hide();
        $('.createModal').attr('data-target', '#createModal');
        $('.createModal').attr('data-toggle', 'modal');
}

$('#createModal').on('hidden.bs.modal', function () {
    $('#createModal').removeData('bs.modal');
    $('.modal-dialog').removeData('bs.modal');
    $('#editContainer').empty();
    //$('#form1')[0].reset();

});

function editModal() {
    $('#listModal').hide();
    $('.editModal').attr('data-target', '#editModal');
    $('.editModal').attr('data-toggle', 'modal');
}

$('#editModal').on('hidden.bs.modal', function () {
    $('#editModal').removeData('bs.modal');
    $('.modal-dialog').removeData('bs.modal');
    $('#editContainer1').empty();
    //$('#form1')[0].reset();

});

$("#datepicker").datepicker({
    dateFormat: 'dd-mm-yyyy',
    autoclose: true

});

$(document).on("mouseenter", ".modal-dialog", function () {
    $("#datepicker,#datepicker2,#datepicker3,#datepicker4").datepicker({
        dateFormat: 'dd-mm-yyyy',
        autoclose: true
    });
    $('#form1 input').on('keypress', function (e) {
        return e.which !== 13;
    });

});