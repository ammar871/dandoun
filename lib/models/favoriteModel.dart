import 'home_model.dart';

class Favorite {
  int? id;
  String? userId;
  int? postId;
  String? createdAt;

  Favorite({this.id, this.userId, this.postId, this.createdAt});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    postId = json['postId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['postId'] = postId;
    data['createdAt'] = createdAt;
    return data;
  }
}


class ResponseFavorite {

  Favorite? favorite;
  Post? post;

  ResponseFavorite({this.favorite, this.post});

  ResponseFavorite.fromJson(Map<String, dynamic> json) {
    favorite = json['favorite'] != null
        ? Favorite.fromJson(json['favorite'])
        : null;
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (favorite != null) {
      data['favorite'] = favorite!.toJson();
    }
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

