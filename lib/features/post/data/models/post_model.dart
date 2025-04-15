class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel({required this.id, required this.title, required this.body});

  // Converts a JSON Map to a PostModel object
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  // Converts a PostModel object to a JSON Map
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
