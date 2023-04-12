<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

offline_store_upload: Stores api calls locally and uploads when needed. This package can be used in apps where offline functionality is needed.
 

## Usage
 
```dart

import 'package:offline_store_upload/offline_store_upload.dart'; 
  
/// Store API 
MaterialButton(
  child: Text('Store Api'),
  onPressed: () {

    /// initialize a list
    List<OfflineStoreApi> data = [];

    /// add api calls to the list

    data.add(
      OfflineStoreApi(
        api_body: {
          "name": "Flutter",
          "age": 30,
        },
        api_url: url,
        api_type: APITYPE.POST,
      ),
    );

    /// add api calls to the list

    data.add(
      OfflineStoreApi(
        api_body: {
          "name": "Dart",
          "age": 55,
        },
        api_url: url,
        api_type: APITYPE.PUT,
      ),
    );

    /// upload when needed

    OfflineStoreUpload().addData(api_data: data);
  },
),

/// Upload Api
MaterialButton(
  child: Text('UPLOAD API'),
  onPressed: () {

    /// Use this function to upload the locally stored api when needed
    OfflineStoreUpload().upload(token: '');
  },
),

```
