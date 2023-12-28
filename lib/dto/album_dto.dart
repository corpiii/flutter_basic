class AlbumDTO {
  final int? userId;
  final int? id;
  final String? title;

  const AlbumDTO({
    this.userId,
    this.id,
    this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
    };
  }

  factory AlbumDTO.fromJson(Map<String, dynamic> map) {
    return AlbumDTO(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }
}