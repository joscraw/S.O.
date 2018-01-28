$(document).on('turbolinks:load', function () {
    // make sure you show the deadline by default
    // if the selected type is goal
    var $type = $('.js-type');
    if ($type && $type.val() === '2') {
        $('.js-deadline').removeClass('hide');
    }

    // toggle between showing and hiding the deadline
    $('.js-type').on('change', function () {
        debugger;
        $('.js-deadline').toggleClass('hide')
    })
});
