/**
 * statusOK
 */
class googleMapsApi {

  String status;
  String lat;
  String lng;
  
  googleMapsApi() {
    // default
    status = "0x11120119";
    lat = "0x11120119";
    lng = "0x11120119";
  }


  /**
   * generate aoogle maps api url.
   */
  void init(PApplet p5, String city) {
    println("### googleMapsApi init");

    // XML parsing
    // create a new xml element.
    XML data = new XML(p5, "http://maps.google.com/maps/api/geocode/xml?sensor=false&address=" + city);
    //debugng(data);

    // Get the status of request.
    XML gApi_status = data.getChild(1);
    //println(gApi_status.getContent());
    //println(gApi_status.getChildCount());
    String stat = gApi_status.getContent();
    //println("Google Maps API - status = " + stat);

    // Status rules
    if (stat.equals("OK") == true) {
      //status = "OK";
      
      statusOK(data);
    }
    
    if (stat.equals("ZERO_RESULTS") == true) {
      // set the googleMaps status "ZERO_RESULTS"
     gMaps.status = "ZERO_RESULTS";
    }
    
  }
  
  
  
  /**
   * statusOK
   */
  void debugng(XML _data) {
    println("\nXML: getChildCount: " + _data.getChildCount() + "\n");
    //println(_data);
    //println(data.getContent());
    
    // use this for debugging
    for(int i=0; i<_data.getChildCount(); i++){
      println("############ " + i);
      //println("############ " + gApi_status.getContent());
      //println("############ " + gApi_status.getChildCount());
      XML dataChild = _data.getChild(i);
      println(dataChild.getContent());
      println(dataChild.getChildCount());
    }
  }
  
  
  
  /**
   * statusOK
   */
  void statusOK(XML _data) {
    println("STATUS OK #################################");
    //debugng(_data);
    
    // Parse the third element.
    // This is the first result. it contains "geometry/location/lat/
    XML gApi_s = _data.getChild(3);
    //println(gApi_s);
    //debugng(gApi_s);
    
    XML[] geometry = gApi_s.getChildren("geometry");
    //println("geometry.lenght: " + geometry.length + "\ngeometry raw: ");
    //println(geometry);
    //debugng(geometry[0]);
    
    XML location = geometry[0].getChild(1);
    println(location);
    debugng(location);
    XML tempLat = location.getChild(1);
    lat = tempLat.getContent();
    XML tempLng = location.getChild(3);
    lng = tempLng.getContent();
  }
}

