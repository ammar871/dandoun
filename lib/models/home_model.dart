import 'package:dandoun/models/slider.dart';

class HomeModel {
  List<Post>? postsOffer;
  List<Post>? listByTime;
  List<Post>? bestView;
  List<Slider>? sliders;
  HomeModel({this.postsOffer, this.listByTime, this.bestView});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['postsOffer'] != null) {
      postsOffer = [];
      json['postsOffer'].forEach((v) {
        postsOffer!.add( Post.fromJson(v));
      });
    }
    if (json['listByTime'] != null) {
      listByTime = [];
      json['listByTime'].forEach((v) {
        listByTime!.add(Post.fromJson(v));
      });
    }
    if (json['bestView'] != null) {
      bestView = [];
      json['bestView'].forEach((v) {
        bestView!.add(Post.fromJson(v));
      });
    }

    if (json['sliders'] != null) {
      sliders = [];
      json['sliders'].forEach((v) {
        sliders!.add( Slider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (postsOffer != null) {
      data['postsOffer'] = postsOffer!.map((v) => v.toJson()).toList();
    }
    if (listByTime != null) {
      data['listByTime'] = listByTime!.map((v) => v.toJson()).toList();
    }
    if (bestView != null) {
      data['bestView'] = bestView!.map((v) => v.toJson()).toList();
    }
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  int? id;
  String? title;
  String? description;
  String? photo;
  String? sound;
  String? publisherImage;
  String? publisherName;
  String? publisherSummary;
  int? categoryId;
  int? views;
  String? type;
  String? status;
  String? createdAt;

  Post(
      {this.id,
        this.title,
        this.description,
        this.photo,
        this.sound,
        this.publisherImage,
        this.publisherName,
        this.publisherSummary,
        this.categoryId,
        this.views,
        this.type,
        this.status,
        this.createdAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    photo = json['photo'];
    sound = json['sound'];
    publisherImage = json['publisherImage'];
    publisherName = json['publisherName'];
    publisherSummary = json['publisherSummary'];
    categoryId = json['categoryId'];
    views = json['views'];
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['photo'] = photo;
    data['sound'] = sound;
    data['publisherImage'] = publisherImage;
    data['publisherName'] = publisherName;
    data['publisherSummary'] = publisherSummary;
    data['categoryId'] = categoryId;
    data['views'] = views;
    data['type'] = type;
    data['status'] = status;
    data['createdAt'] = createdAt;
    return data;
  }
}
