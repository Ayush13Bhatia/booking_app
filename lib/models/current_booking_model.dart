import 'dart:convert';

CurrentBookingModel currentBookingModelFromJson(String str) => CurrentBookingModel.fromJson(json.decode(str));

String currentBookingModelToJson(CurrentBookingModel data) => json.encode(data.toJson());

class CurrentBookingModel {
  String? title;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBookingModel({
    this.title,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  factory CurrentBookingModel.fromJson(Map<String, dynamic> json) => CurrentBookingModel(
        title: json["title"] ?? '',
        fromDate: json["from_date"] ?? '',
        fromTime: json["from_time"] ?? '',
        toDate: json["to_date"] ?? '',
        toTime: json["to_time"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "from_date": fromDate,
        "from_time": fromTime,
        "to_date": toDate,
        "to_time": toTime,
      };
}
