class Slider {
  int? id;
  String? title;
  String? image;
  String? link;

  Slider({this.id, this.title, this.image, this.link});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}
