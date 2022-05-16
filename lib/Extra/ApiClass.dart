import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClass {
  ApiClass();

  // static Future<void> sale(File img, String url, onSuccess, onError) async {
  //   var stream = new http.ByteStream(DelegatingStream.typed(img.openRead()));
  //   var length = await img.length();
  //
  //   var uri = Uri.parse(url);
  //   print("token: ${AuthToken.authtoken}");
  //
  //   var request = new http.MultipartRequest("POST", uri);
  //   request.headers["Authorization"] = 'Bearer ${AuthToken.authtoken}';
  //   var multipartFile = new http.MultipartFile('file', stream, length,
  //       filename: basename(img.path));
  //   request.files.add(multipartFile);
  //   var response = await request.send();
  //   print(response.statusCode);
  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print("value => $value");
  //     var s = jsonDecode(value);
  //     if (s['status'].toString() == "1") {
  //       print(value);
  //       onSuccess(value);
  //     } else {
  //       print(value);
  //       onError(value);
  //     }
  //   });
  // }

  // static void getApiCallWithAuth(data, onSuccess, onError) {
  //   print("token: ${AuthToken.authtoken}");
  //   print("api:$data");
  //
  //   final Map<String, String> defaultgetHeader = {
  //     "Content-Type": "application/json",
  //     "Authorization": 'Bearer ${AuthToken.authtoken}',
  //   };
  //   print("url ${data["url"]}");
  //   var header = data.containsKey("header") ? data["header"] : defaultgetHeader;
  //
  //   http
  //       .get(data["url"], headers: header)
  //       .timeout(
  //         Duration(seconds: 20),
  //       )
  //       .then((http.Response response) {
  //     print("errror ${response.statusCode}");
  //     if (response.statusCode < 200 ||
  //         response.statusCode >= 400 ||
  //         response == null) {
  //       onError({"status": 0, "message": response.body});
  //     } else {
  //       onSuccess({"status": 1, "response": response.body});
  //     }
  //   }).catchError((error) {
  //     print("errror $error");
  //     if (error is TimeoutException || error is SocketException) {
  //       onError({
  //         "status": -1,
  //         "message":
  //             "Something went wrong, please check your internet connection."
  //       });
  //       return;
  //     }
  //     onError({"status": 0, "message": error});
  //   });
  // }

  // static void deleteApiCallWithAuthHeader(apiData, onSuccess, onError) {
  //   print("apiData: $apiData");
  //   print("token: ${AuthToken.authtoken}");
  //   final Map<String, String> defaultHeader = {
  //     "Content-Type": "application/json",
  //     "Authorization": 'Bearer ${AuthToken.authtoken}',
  //   };
  //   var header =
  //       apiData.containsKey("header") ? apiData["header"] : defaultHeader;
  //   print("post data ${apiData["data"]}");
  //
  //   http
  //       .delete(apiData["url"], headers: header)
  //       .timeout(Duration(seconds: 20))
  //       .then((http.Response response) {
  //     print("response ${response.statusCode}");
  //     response.statusCode < 200 ||
  //             response.statusCode >= 400 ||
  //             response == null
  //         ? onError({
  //             "status": 0,
  //             "message": response.statusCode == 404
  //                 ? json.encode({"message": "Not Found"})
  //                 : response.body
  //           })
  //         : onSuccess({"status": 1, "response": response.body});
  //   })
  //         ..catchError((error) {
  //           print("errror $error");
  //           if (error is TimeoutException || error is SocketException) {
  //             onError({
  //               "status": -1,
  //               "message": "Please check if internet is available for RainMaker"
  //             });
  //             return;
  //           }
  //           onError({"status": 0, "message": error});
  //         });
  // }

  // static void putApiCall(apiData, onSuccess, onError) {
  //   print("api:$apiData");
  //   final Map<String, String> defaultHeader = {
  //     "Content-Type": "application/json",
  //     'Accept': 'application/json',
  //   };
  //   var header =
  //       apiData.containsKey("header") ? apiData["header"] : defaultHeader;
  //   print("post data ${apiData["data"]}");
  //
  //   http
  //       .put(apiData["url"],
  //           headers: header, body: json.encode(apiData["data"] ?? {}))
  //       .timeout(Duration(seconds: 20))
  //       .then((http.Response response) {
  //     print("response ${response.body}");
  //
  //     response.statusCode < 200 ||
  //             response.statusCode >= 400 ||
  //             response == null
  //         ? onError({
  //             "status": 0,
  //             "message": response.statusCode == 404
  //                 ? json.encode({"message": "url not found."})
  //                 : response.body
  //           })
  //         : onSuccess({"status": 1, "response": response.body});
  //   })
  //         ..catchError((error) {
  //           print("errror $error");
  //           if (error is TimeoutException || error is SocketException) {
  //             onError({
  //               "status": -1,
  //               "message": "Please check if internet is available for RainMaker"
  //             });
  //             return;
  //           }
  //
  //           onError({"status": 0, "message": error});
  //         });
  //   ;
  // }
  static void postApiCall(apiData, onSuccess, onError) {
    debugPrint("api:$apiData");
    final Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    };
    var header =
        apiData.containsKey("header") ? apiData["header"] : defaultHeader;
    debugPrint("post data ${apiData["data"]}");

    http
        .post(Uri.parse(apiData["url"]),
            headers: header, body: json.encode(apiData["data"] ?? {}))
        .timeout(const Duration(seconds: 30))
        .then((http.Response response) {
      debugPrint("response ${response.body}");

      response.statusCode < 200 ||
              response.statusCode >= 400
          ? onError({
              "success": 0,
              "message": response.statusCode == 404
                  ? json.encode({"message": "url not found."})
                  : response.body
            })
          : onSuccess({"success": 1, "response": response.body});
    })
      /*.catchError((error) {
        debugPrint("error $error");
        if (error is TimeoutException || error is SocketException) {
          onError({
            "success": -1,
            "message": "Please check if internet is available for RainMaker"
          });
          return;
        }

        onError({"status": 0, "message": error.toString()});
      });*/
    ;
  }
}
