import 'dart:convert';

enum APITYPE {
  POST,
  PUT,
}

List<OfflineStoreApi> offlineStoreApiFromJson(String str) =>
    List<OfflineStoreApi>.from(
        json.decode(str).map((x) => OfflineStoreApi.fromJson(x)));

String offlineStoreApiToJson(List<OfflineStoreApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfflineStoreApi {
  OfflineStoreApi({
    required this.api_body,
    // required this.filepath, // TODO: ADD CUSTOM FILE PATH
    required this.api_url,
    required this.api_type,
  });

  Map api_body;
  // String filepath;  // TODO: ADD CUSTOM FILE PATH
  String api_url;
  APITYPE api_type; // POST, PUT

  factory OfflineStoreApi.fromJson(Map<String, dynamic> json) =>
      OfflineStoreApi(
        api_body: json["api_body"],
        // filepath: json["filepath"],
        api_url: json["api_url"],
        api_type: json["api_type"] == 'POST' ? APITYPE.POST : APITYPE.PUT,
      );

  Map<String, dynamic> toJson() => {
        "api_body": api_body,
        // "filepath": filepath,
        "api_url": api_url,
        "api_type": api_type == APITYPE.POST ? 'POST' : 'PUT',
      };
}
