class Facility {
  final List<String> photos;
  final String name;
  final String capacity;
  final String isAvailable;

  Facility(this.photos, this.name, this.capacity, this.isAvailable);

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
        (json['photos'] as List).map((e) => e.toString()).toList(),
        json['name'].toString(),
        json['capacity'].toString(),
        json['isAvailable'].toString());
  }
}
