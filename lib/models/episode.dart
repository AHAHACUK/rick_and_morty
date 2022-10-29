class Episode {
  final String name;
  final String code;

  const Episode(this.name, this.code);

  Episode.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      code = json['episode'];

  static List<Episode> listFromJson(List<dynamic> json) => 
    json.map((e) => Episode.fromJson(e)).toList();
}