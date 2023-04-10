import 'package:dio/dio.dart';
import 'package:offline_store_upload/src/OfflineStoreUploadModel.dart';
import 'package:offline_store_upload/src/network/api.dart';

class ApiService {
  API api = API();
  Future<Response?> upload(OfflineStoreUploadModel data, String token) async {
    Response? response;
    try {
      if (data.api_type == APITYPE.POST) {
        response = await api.sendRequest.post(
          data.api_url,
          data: data.body,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
      } else if (data.api_type == APITYPE.PUT) {
        response = await api.sendRequest.put(
          data.api_url,
          data: data.body,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
      }
      return response;
    } catch (e) {
      print(e);
    }
  }
}
