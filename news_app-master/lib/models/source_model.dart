class SourceModel {
  String ? status;
  String ? code;
  String ? message;
  List<Sources> ? sources;

  SourceModel({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json){
    return SourceModel(
      status: json["status"],
      code: json["code"] ?? "",
      message: json["message"] ?? "",
      sources: List<Sources>.from(
          json["sources"].map((elements) => Sources.fromJson(elements))
      ),

    );
  }

}

class Sources {
  String ? id;
  String ? name;
  String ? description;
  String ? url;
  String ? category;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
  });

  factory Sources.fromJson(Map<String, dynamic> json){
    return Sources(
      id: json["id"],
      category: json["category"],
      description: json["description"],
      name: json["name"],
      url: json["url"],
    );
  }
}