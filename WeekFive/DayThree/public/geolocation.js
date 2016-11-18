var map;

if ("geolocation" in navigator){
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}

function onLocation(position){
  // We can't just directly feed the position into our google map
  // The objects are formatted differently, google maps is looking for
  // an object with "lat" and "lng" keys.
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };

  createMap(myPosition);
  setupAutocomplete();
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}
function drawMarkers(){
  var jsonifiedPostion = JSON.parse(window.localStorage.getItem("position"));
  if(jsonifiedPostion !=undefined){
    for(var i = 0; i < jsonifiedPostion.length;i++){
        var location = {
          lat:jsonifiedPostion[i].lat,
          lng:jsonifiedPostion[i].lng,
        }
        createMarker(location, jsonifiedPostion[i].text);
    }
  }
}
function createMap(position){
  var mapOptions = {
      center: position,
      zoom: 17
    };
    map = new google.maps.Map($('#map')[0], mapOptions);
    drawMarkers();
}
function createMarker(position,text) {
  var marker = new google.maps.Marker({
   position: position,
   map: map
 });
 var contentString = text;
 var infowindow = new google.maps.InfoWindow({
    content: contentString
  });
 marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}
function saveMarkerToLocal(lat,lng,text){
  var jsonifiedPostion = JSON.parse(window.localStorage.getItem("position"));
  var array = [];
  var position = {
    lat:lat,
    lng:lng,
    text:text
  }
  if(jsonifiedPostion == null){

    array.push(position);
    var stringifiedPosition = JSON.stringify(array);
    window.localStorage.setItem("position", stringifiedPosition);
  }
  else{
    jsonifiedPostion.push(position);
    var newString = JSON.stringify(jsonifiedPostion);
    window.localStorage.setItem("position", newString);
  }
}
function setupAutocomplete(){
  var input = $('#get-places')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function(){
    var place = autocomplete.getPlace();
    if (place.geometry.location) {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
      saveMarkerToLocal(place.geometry.location.lat(),place.geometry.location.lng(),place.formatted_address);
      createMarker(place.geometry.location,place.formatted_address);
    } else {
      alert("The place has no location...?")
    }
  });
}
