import 'package:flutter/material.dart';
import 'package:offline_store_upload/offline_store_upload.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Store Upload ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UploadExample(),
    );
  }
}

class UploadExample extends StatelessWidget {
  String url = 'http://192.168.1.19:8000/api/person/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///
            MaterialButton(
              child: Text('POST 1'),
              onPressed: () {
                List<OfflineStoreUploadModel> data = [];
                data.add(
                  OfflineStoreUploadModel(
                    body: {
                      "name": "Hussain",
                      "age": 22,
                    },
                    api_url: url,
                    api_type: APITYPE.POST,
                  ),
                );
                OfflineStoreUpload().addData(data: data);
              },
            ),
            SizedBox(height: 20),

            ///
            MaterialButton(
              child: Text('POST 2'),
              onPressed: () {
                List<OfflineStoreUploadModel> data = [];
                data.add(
                  OfflineStoreUploadModel(
                    body: {
                      "name": "Flutter",
                      "age": 30,
                    },
                    api_url: url,
                    api_type: APITYPE.POST,
                  ),
                );
                data.add(
                  OfflineStoreUploadModel(
                    body: {
                      "name": "Dart",
                      "age": 55,
                    },
                    api_url: url,
                    api_type: APITYPE.POST,
                  ),
                );
                OfflineStoreUpload().addData(data: data);
              },
            ),
            SizedBox(height: 20),

            ////
            MaterialButton(
              child: Text('PUT 1'),
              onPressed: () {
                List<OfflineStoreUploadModel> data = [];
                data.add(
                  OfflineStoreUploadModel(
                    body: {
                      "name": "Hussain",
                      "age": 20,
                    },
                    api_url: url,
                    api_type: APITYPE.PUT,
                  ),
                );
                OfflineStoreUpload().addData(data: data);
              },
            ),
            SizedBox(height: 20),
            MaterialButton(
              child: Text('UPLOAD'),
              onPressed: () {
                OfflineStoreUpload().upload(token: '');
              },
            ),
            SizedBox(height: 20),

            MaterialButton(
              child: Text('DELETE'),
              onPressed: () {
                OfflineStoreUpload().clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
