class Place {
  int id;
  String name;
  String? city;
  String? type;
  String? tourismType;
  String? description;
  String? imageURL;
  String? address;
  String? directions;

  Place(
      {required this.id,
        required this.name,
        this.city,
        this.type,
        this.tourismType,
        this.description,
        this.imageURL,
        this.address,
        this.directions});

  Place.fromJson(Map<String, dynamic> json)
  : id = json['id']??-1,
    name = json['name']??"",
    city = json['city'],
    type = json['type'],
    tourismType = json['tourismType'],
    description = json['description'],
    imageURL = json['imageURL'],
    address = json['address'],
    directions = json['directions'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city'] = city;
    data['type'] = type;
    data['tourismType'] = tourismType;
    data['description'] = description;
    data['imageURL'] = imageURL;
    data['address'] = address;
    data['directions'] = directions;
    return data;
  }
}