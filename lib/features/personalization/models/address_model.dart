class Address {
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;

  Address({
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
  });

  Map<String, dynamic> toJson() => {
    'Name': name,
    'PhoneNumber': phoneNumber,
    'Street': street,
    'PostalCode': postalCode,
    'City': city,
    'State': state,
    'Country': country,
  };

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    name: json['Name'] ?? '',
    phoneNumber: json['PhoneNumber'] ?? '',
    street: json['Street'] ?? '',
    postalCode: json['PostalCode'] ?? '',
    city: json['City'] ?? '',
    state: json['State'] ?? '',
    country: json['Country'] ?? '',
  );
}
