  $( function() {
      $( "#dante" ).draggable({
      });

      $( ".all-trails" ).droppable({
        accept: "#dante",
        hoverClass: "drop-hover",
        drop: function( event, ui ) {
          var one = ui.draggable.attr('class')
          var two = one.split(" ")
          var three = two[1]
          var four = parseInt(three)
       var request = $.ajax({
        method: "PATCH",
        url: "/api/trails/" + four,
        data: { "id" : four }
      }).done(function(data){
        var liItem = $("." + data["id"]).children()[0];
        var html = '<div class="trail large-12 small-6 columns end callout secondary">' + $(liItem).html() + '</div>';
        $(".true").append(html);
        $("." + data["id"]).hide();
      });
    }
    });
  })
