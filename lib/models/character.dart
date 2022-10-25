class Character {
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String origin;
  final String imgUrl;
  final List<String> episodes;

  const Character(this.name, this.status, this.species, this.type, this.gender, this.origin, this.imgUrl, this.episodes);

  Character.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      status = json['status'],
      species = json['species'],
      type = json['type'],
      gender = json['gender'],
      origin = json['origin']['name'],
      imgUrl = json['image'],
      episodes = List<String>.from(json['episode']);
}