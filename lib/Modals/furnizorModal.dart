import 'dart:typed_data';

class FurnizorFormModel {
  FurnizorFormModel({
    this.images,
    this.spaceType,
    this.spaceName,
    this.phoneNumber,
    this.email,
    this.userId,
    this.price,
    this.country,
    this.state,
    this.city,
    this.description,
    this.benefits,
    this.coordinates,
  });

  List<Uint8List> images=[];
  List<String> spaceType=[];
  String spaceName;
  String phoneNumber;
  String email;
  String userId;
  String price;
  String country;
  String state;
  String city;
  String description;
  List<String> benefits=[];
  Coordinates coordinates;

  factory FurnizorFormModel.fromJson(Map<String, dynamic> json) => FurnizorFormModel(
    images: List<Uint8List>.from(json["images"].map((x) => x)),
    spaceType: List<String>.from(json["spaceType"].map((x) => x)),
    spaceName: json["spaceName"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    userId: json["userID"],
    price: json["price"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    description: json["description"],
    benefits: List<String>.from(json["benefits"].map((x) => x))??[],
    coordinates: Coordinates.fromJson(json["coordinates"]),
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x)),
    "spaceType": List<dynamic>.from(spaceType.map((x) => x)),
    "spaceName": spaceName,
    "phoneNumber": phoneNumber,
    "email": email,
    "userID": userId,
    "price": price,
    "country": country,
    "state": state,
    "city": city,
    "description": description,
    "benefits": List<dynamic>.from(benefits.map((x) => x)),
    "coordinates": coordinates.toJson(),
  };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String latitude;
  String longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
