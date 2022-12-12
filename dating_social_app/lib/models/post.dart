class Post {
  late int? id;
  final int? userId;
  final String? name;
  final String? avatar;
  final String? title;
  final String? image;
  final int? numberLike;
  final String? createdDate;

  Post({
    this.id,
    this.userId,
    this.name,
    this.avatar,
    this.title,
    this.image,
    this.numberLike,
    this.createdDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      numberLike: json['numberLike'] ?? 0,
      createdDate: json['createdDate'] ?? '',
    );
  }
}
