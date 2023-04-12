import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

import '../offline_store_upload.dart';

class OfflineStoreUpload {
  /// to get the local directory path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /// file path
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/offlineStoreUpload.txt');
  }

  /// returns the data that is stored in local file
  Future<String> readData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      print('*** read ****');
      print(contents);
      return contents;
    } catch (e) {
      // If encountering an error, return ''
      return '';
    }
  }

  /// add new api request in queue in local file
  ///
  /// if data alredy exist in file, then
  /// add old data and new data then convert the whole into map and store it into file
  Future<void> addData({
    required List<OfflineStoreApi> api_data,
  }) async {
    String k = await OfflineStoreUpload().readData();

    List<OfflineStoreApi> olddata = [];
    if (k.trim() != '') {
      olddata = offlineStoreApiFromJson(k);
    }

    ///
    List<OfflineStoreApi> newdata = olddata + api_data;
    String newDataToStore = offlineStoreApiToJson(newdata);

    ///
    final file = await _localFile;

    // Write the file
    file.writeAsString('$newDataToStore');
    return;
  }

  /// uploads the api
  ///
  /// if api request returns error then it is store back in the file
  ///
  /// if no error, then that particular api call is removed from the file
  Future<void> upload({required String token}) async {
    String k = await OfflineStoreUpload().readData();
    if (k.trim() == '') return;
    List<OfflineStoreApi> l = offlineStoreApiFromJson(k);

    List<OfflineStoreApi> notUploaded = [];
    for (var i = 0; i < l.length; i++) {
      Response? status = await ApiService().upload(l[i], token);

      if (status == null ||
          (status.statusCode! < 200 || status.statusCode! > 300)) {
        notUploaded.add(l[i]);
      }
    }

    await clear();
    if (notUploaded.isNotEmpty) await addData(api_data: notUploaded);
  }

  /// clear all the data in the file
  Future<void> clear() async {
    final file = await _localFile;

    // Write the file
    file.writeAsString('');
    return;
  }

  /// returns status is there is data present in the local file
  Future<bool> hasDataToUpload() async {
    String k = await OfflineStoreUpload().readData();
    if (k.trim() == '') return false;

    return true;
  }
}
