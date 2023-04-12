import 'package:dio/dio.dart';
import 'package:offline_store_upload/src/network/api.dart';

import '../../offline_store_upload.dart';

class ApiService {
  API api = API();
  Future<Response?> upload(OfflineStoreApi data, String token) async {
    Response? response;
    try {
      /// If api call is POST
      if (data.api_type == APITYPE.POST) {
        response = await api.sendRequest.post(
          data.api_url,
          data: data.api_body,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
      }

      /// If api call is PUT
      else if (data.api_type == APITYPE.PUT) {
        response = await api.sendRequest.put(
          data.api_url,
          data: data.api_body,
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
      return null;
    }
  }
}
