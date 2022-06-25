class Package {
  int? id;
  String? name;
  int? months;
  int? price;
  String? status;
  String? createdAt;

  Package(
      {this.id,
        this.name,
        this.months,
        this.price,
        this.status,
        this.createdAt});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    months = json['months'];
    price = json['price'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['months'] = this.months;
    data['price'] = this.price;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
