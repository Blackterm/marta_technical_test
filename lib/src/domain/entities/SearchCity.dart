class CityLocation {
  String? name;
  var lat;
  var lon;
  String? country;

  CityLocation({this.name, this.lat, this.lon, this.country});

  CityLocation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['country'] = this.country;
    return data;
  }
}
