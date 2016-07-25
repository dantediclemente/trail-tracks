$( function() {
  $( "#true, #false" ).sortable({
    connectWith: ".connectedSortable",
    tolerance:"pointer",
    cursor: "move",
    dropOnEmpty: true,
    update: function () {
        var data = $('.trail').data('hiked');
        $.ajax({
            data: data,
            type: 'POST',
            url: '/trails'
        });
        alert($('.trail').data('hiked'))
        debugger;
    }
  });
});
