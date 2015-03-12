var map;

function initialize() {
  var mapOptions = {
    zoom: 13
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
  mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
        position.coords.longitude);

        map.setCenter(pos);
      }, function() {
        handleNoGeolocation(true);
      });
    } else {
      // Browser doesn't support Geolocation
      handleNoGeolocation(false);
    }


    // need the lat long for each restaurant
    $.get('restaurants.json', function(restaurantData) {
      restaurantData.forEach(function(restaurant) {
        // make a new LatLng object
        var latlng = new google.maps.LatLng(restaurant.latitude, restaurant.longitude);
        // make a new Marker object
        var marker = new google.maps.Marker({
          position: latlng,
          map: map,
          title:"Hello World!"
        });
        // place the marker on the map
        marker.setMap(map);
      });
    });

  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      var content = 'Error: The Geolocation service failed.';
    } else {
      var content = 'Error: Your browser doesn\'t support geolocation.';
    }

    var options = {
      map: map,
      position: new google.maps.LatLng(39.7391500, -104.9847000),
      content: content
    };

    map.setCenter(options.position);
  }

  google.maps.event.addDomListener(window, 'load', initialize);
