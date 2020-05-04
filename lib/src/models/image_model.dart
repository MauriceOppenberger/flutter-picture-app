class ImageModel {
  String id;
  String url;
  String author;

  ImageModel(this.id, this.url);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['download_url'];
    author = parsedJson['author'];
  }
}
