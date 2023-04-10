// To parse this JSON data, do
//
//     final OfflineStoreUploadModel = OfflineStoreUploadModelFromJson(jsonString);

import 'dart:convert';

enum APITYPE {
  POST,
  PUT,
}

List<OfflineStoreUploadModel> offlineStoreUploadModelFromJson(String str) =>
    List<OfflineStoreUploadModel>.from(
        json.decode(str).map((x) => OfflineStoreUploadModel.fromJson(x)));

String offlineStoreUploadModelToJson(List<OfflineStoreUploadModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfflineStoreUploadModel {
  OfflineStoreUploadModel({
    required this.body,
    // required this.filepath,
    required this.api_url,
    required this.api_type,
  });

  Map body;
  // String filepath;
  String api_url;
  APITYPE api_type; // POST, PUT

  factory OfflineStoreUploadModel.fromJson(Map<String, dynamic> json) =>
      OfflineStoreUploadModel(
        body: json["body"],
        // filepath: json["filepath"],
        api_url: json["api_url"],
        api_type: json["api_type"] == 'POST' ? APITYPE.POST : APITYPE.PUT,
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        // "filepath": filepath,
        "api_url": api_url,
        "api_type": api_type == APITYPE.POST ? 'POST' : 'PUT',
      };
}
