
// We have to hardcode the width and height of the map image
var mapWidth = 188;	
var mapHeight = 140;

// pinMarhinTop and pinMaringLeft will be overridden later...
var pinMarginTop = 0;
var pinMarginLeft = 0;
// to actually place the pin on the correct spot we have to 
// substract half of the width and height,
// so the middle of the pin is on the coorinates
var pinWidth = 8;	
var pinHeight = 8;

/*
 * Maps a value from range [minFrom..maxFrom] to [minTo..maxTo]
 */
var map = function(value, minFrom, maxFrom, minTo, maxTo){
	return minTo + (maxTo - minTo) * ((value - minFrom) / (maxFrom - minFrom));
}

/*
 * Draws a custom map to the figure #map and places a pin on it
 * The pin is 'moved' on the map by manipulating marginTop and marginBottom
 */
function displayMap(){
	$("#userData").append('<figure id="map"></figure>');
	$("#map").append('<img id="mapImg" src="img/worldmap_188x140.png" />');
	$("#map").append('<img id="mapPin" src="img/Pin_8x8_white.png" />');		
	$("#mapPin").css("marginTop", pinMarginTop-pinHeight*0.5);
	$("#mapPin").css("marginLeft", pinMarginLeft-pinWidth*0.5);
}

/*
 * Makes a request for the address on the Google Maps API
 * If the address was not found, there is no error message and no callback is called!
 * On success callback is called.
 */	
function getLatLong(address, callback) {
	var geocoder = new google.maps.Geocoder();
	var result = "";
	geocoder.geocode({ 'address': address }, function (results, status) {
	    if (status == google.maps.GeocoderStatus.OK) {
	        result = results[0].geometry.location;
	        latLongCallback(result);
	    } else {
	        result = "Unable to find address: " + status;
	    }
	});
	return result;
}

/*
 * Will be called, when a request to Google Maps API succeeded.
 * result.lng() = Longitude
 * result.lat() = Langitude
 */
function latLongCallback(result) {
	//alert('Search returns: \n' + 'Latitude: ' + result.lat() + '\n' + 'Longitude: ' + result.lng());
	pinMarginLeft = map(result.lng(), -180.0, 180.0, 0, mapWidth); 
	pinMarginTop = map(result.lat(), 90.0, -90.0, 0, mapHeight);
	displayMap();
}
			  