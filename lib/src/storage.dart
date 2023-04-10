import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:offline_store_upload/src/OfflineStoreUploadModel.dart';
import 'package:offline_store_upload/src/network/apiUpload.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

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
      // If encountering an error, return 0
      return '';
    }
  }

  /// add new api request in queue in local file
  Future<void> addData({
    required List<OfflineStoreUploadModel> data,
  }) async {
    String k = await OfflineStoreUpload().readData();

    List<OfflineStoreUploadModel> olddata = [];
    if (k.trim() != '') {
      olddata = offlineStoreUploadModelFromJson(k);
    }

    ///
    List<OfflineStoreUploadModel> newdata = olddata + data;
    String newDataToStore = offlineStoreUploadModelToJson(newdata);

    ///
    final file = await _localFile;

    // Write the file
    file.writeAsString('$newDataToStore');
    return;
  }

  Future<void> upload({required String token}) async {
    String k = await OfflineStoreUpload().readData();
    if (k.trim() == '') return;
    List<OfflineStoreUploadModel> l = offlineStoreUploadModelFromJson(k);

    List<OfflineStoreUploadModel> notUploaded = [];
    for (var i = 0; i < l.length; i++) {
      Response? status = await ApiService().upload(l[i], token);

      if (status == null ||
          (status.statusCode! < 200 || status.statusCode! > 300)) {
        notUploaded.add(l[i]);
      }
    }

    await clear();
    if (notUploaded.isNotEmpty) await addData(data: notUploaded);
  }

  Future<void> clear() async {
    final file = await _localFile;

    // Write the file
    file.writeAsString('');
    return;
  }

  Future<bool> hasDataToUpload() async {
    String k = await OfflineStoreUpload().readData();
    if (k.trim() == '') return false;

    return true;
  }
}
