import 'dart:convert';

PackageModel packageModelFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
  String? title;
  String? price;
  String? desc;

  PackageModel({
     this.title,
     this.price,
     this.desc,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
    title: json["title"] ?? '',
    price: json["price"] ?? '',
    desc: json["desc"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "desc": desc,
  };
}
