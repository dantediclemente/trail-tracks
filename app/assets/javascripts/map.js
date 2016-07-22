window.onload = function() {
handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
  var url = window.location
  var split = url.toString().split("/")
  var id = split[split.length-1]
  var int = parseInt(id)
  var request = $.ajax({
    method: "GET",
    url: "/api/trails/" + int,
    data: {
      format: 'json'
    },
    success: function(data) {
      lng = data["trail"].lng
      lat = data["trail"].lat
    }
  });
  request.done(function(data){
    markers = handler.addMarkers([
      {
        "lat": lat,
        "lng": lng
      }
    ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
  handler.getMap().setZoom(12);
})
});
}
