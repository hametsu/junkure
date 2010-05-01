$(function() {
  var mc = new MapControl();
});

function MapControl() {
  this.map = null;
  this.errors = [];
  MapControl.prototype.initialize.apply(this, arguments);
}

MapControl.prototype = {
  initialize : function() {
    $('#gmap').css({
      'width' : 800,
      'height' : 400,
      'border' : '1px solid #000'
    });

    $('#errors').css({
      'color' : '#F00',
      'font-weight' : 'bold'
    });

    this.map = new GMap2($('#gmap')[0])
    this.map.setCenter(new GLatLng(35.6593082, 139.7047617), 11);
    this.map.addControl(new GLargeMapControl());
    this.addInitialMarker();
    this.loadUserData();

    $(window).unload(function(){
      // Issue: Not effective this code on the Mac Chrome
      GUnload();
    });

  },

  loadUserData : function() {
    var self = this;
    var geocoder = new GClientGeocoder();
    $.getJSON('/admin_json', {}, function(response, status) {
      $.each(response.records, function(idx, r) {
        geocoder.getLatLng(r.user.address, lng.bind(self.addMarker, self, r.user));
      });
      setTimeout(lng.bind(self.showErrors, self), 2000);
    });
  },

  addMarker : function(point, user) {
    if (point) {
      var icon = new GIcon();
      icon.image = user.profile_image_url;
      icon.iconSize = new GSize(30, 30);
      icon.iconAnchor = new GPoint(15, 15);
      var marker = new GMarker(point, icon);
      this.map.addOverlay(marker);

      var self = this;
      GEvent.addListener(marker, "click", function(m) {
        self.map.openInfoWindow(m , self.toUserInfoString(user));
      });
    } else {
      this.errors.push("Cannot get geocode :" + user.address + ", " + user.login);
    }
  },

  toUserInfoString : function(user) {
    return '<img src="' + user.profile_image_url + '" style="height:30px;width:30px;" />' + user.login + '/' + user.name + '<br />' + user.address;
  },

  addInitialMarker : function() {
    var gp = new GLatLng(35.6593082, 139.7047617);
    this.map.addOverlay(new GMarker(gp));
    this.map.openInfoWindow(gp, "破滅*ラウンジ<br />渋谷アイビスビル");
  },

  showErrors : function() {
    var target = $('#errors');
    target.empty();
    $.each(this.errors, function(idx, e) {
      target.append($('<div>').text(e));
    });
  }
}

// for common utilities
lng = {
  bind : function(fn, thisObj, exArg) {
    return function() {
      var args = Array.prototype.slice.call(arguments);
      if (exArg) args.push(exArg);
      fn.apply(thisObj, args);
    }
  }
}
  
