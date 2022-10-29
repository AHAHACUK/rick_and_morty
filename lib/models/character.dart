class Character {
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String origin;
  final String imgUrl;
  final List<int> episodesIds;

  const Character(this.name, this.status, this.species, this.type, this.gender, this.origin, this.imgUrl, this.episodesIds);

  Character.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      status = json['status'],
      species = json['species'],
      type = json['type'],
      gender = json['gender'],
      origin = json['origin']['name'],
      imgUrl = json['image'],
      episodesIds = List<String>.from(json['episode']).map((e) => _EpisodeIdFromUrl(e)).toList();

  static List<Character> listFromJson(List<dynamic> json) =>
    List<Character>.from([for(dynamic characterJson in json) Character.fromJson(characterJson)]);

  static int _EpisodeIdFromUrl(String url) {
    Uri uri = Uri.parse(url);
    int id = int.parse(uri.pathSegments.last);
    return id;
  }
}