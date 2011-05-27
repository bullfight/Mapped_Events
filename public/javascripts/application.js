// Cloudmade b2a591ff0cc0411b973d9005253e741b

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  
  $("map").ready(function() {
    
    var path = document.getElementById("map").getAttribute("path")
    
    var latitude = document.getElementById("map").getAttribute("lat")
    var longitude = document.getElementById("map").getAttribute("lon")
    
    var po = org.polymaps;

    var map = po.map()
        .container(document.getElementById("map").appendChild(po.svg("svg")))
        .center({lat: latitude,lon: longitude})
        .zoom(13)
        .add(po.interact())
        .add(po.hash());

    map.add(po.image()
        .url(po.url("http://{S}tile.cloudmade.com"
        + "/1a1b06b230af4efdbb989ea99e9841af" // http://cloudmade.com/register
        + "/998/256/{Z}/{X}/{Y}.png")
        .hosts(["a.", "b.", "c.", ""])));
        
    map.add(po.geoJson()
      .url(path));
        
    map.add(po.compass()
        .pan("none"));
                     
  });
});