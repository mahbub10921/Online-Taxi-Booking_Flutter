import 'dart:convert';

Route1 postModelFromJson(String str) => Route1.fromJson(json.decode(str));

List<Route1> postsFromJson2(String str) =>
    List<Route1>.from(json.decode(str).map((x) => Route1.fromJson(x)));

String postModelToJson(Route1 data) => json.encode(data.toJson());

class Route1 {
  String? location;
  double? latitude;
  double? longitude;

  Route1({
    this.location,
    this.latitude,
    this.longitude,
  });

  factory Route1.fromJson(Map<String, dynamic> json) => Route1(
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
      };

  toLowerCase() {}
}
