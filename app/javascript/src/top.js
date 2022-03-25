// This example requires the Places library. Include the libraries=places
// parameter when you first load the API.
// <script src="https://maps.googleapis.com/maps/api/js?key=GOOGLE_MAP_API&libraries=places&callback=initMap">

let map;
let service;
let infowindow;

function initMap() {
  const sydney = new google.maps.LatLng(-33.867, 151.195);
  console.log('test1');

  infowindow = new google.maps.InfoWindow();
  map = new google.maps.Map(document.getElementById("map"), {
    center: sydney,
    zoom: 15,
  });
  console.log('test2');

  const request = {
    query: "Museum of Contemporary Art Australia",
    fields: ["name", "geometry"],
  };
  console.log('test3');

  service = new google.maps.places.PlacesService(map);
  console.log('test4');
  service.findPlaceFromQuery(request, (results, status) => {
    if (status === google.maps.places.PlacesServiceStatus.OK && results) {
      for (let i = 0; i < results.length; i++) {
        createMarker(results[i]);
        console.log('test5');
      }

      map.setCenter(results[0].geometry.location);
      console.log('test6');
    }
  });
  console.log('test7');
}

function createMarker(place) {
  if (!place.geometry || !place.geometry.location) return;
  console.log('test8');

  const marker = new google.maps.Marker({
    map,
    position: place.geometry.location,
  });
  console.log('test9');

  google.maps.event.addListener(marker, "click", () => {
    infowindow.setContent(place.name || "");
    infowindow.open(map);
  });
  console.log('test10');
}

console.log('test');
