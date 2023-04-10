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

TODO:  Add longer examples
to `/example` folder.

```dart

import 'package:offline_store_upload/offline_store_upload.dart';

/// initialize a list
 List<OfflineStoreUploadModel> data = [];


/// add api calls to the list
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

/// add api calls to the list

 data.add(
    OfflineStoreUploadModel(
    body: {
      "name": "Dart",
      "age": 20,
    },
    api_url: url,
    api_type: APITYPE.POST,
    ),
   );

/// upload when needed
OfflineStoreUpload().addData(data: data);

```
