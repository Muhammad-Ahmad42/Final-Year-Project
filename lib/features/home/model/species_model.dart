class SpeciesModel {
  final String name;
  final List<LocationModel> locations;

  SpeciesModel({required this.name, required this.locations});

  factory SpeciesModel.fromMap(Map<String, dynamic> map) {
    final locs = (map['locations'] as List)
        .map((e) => LocationModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();

    return SpeciesModel(name: map['name'], locations: locs);
  }
}

class LocationModel {
  final String city;
  final double lat;
  final double lng;

  LocationModel({required this.city, required this.lat, required this.lng});

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      city: map['city'],
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
    );
  }
}
