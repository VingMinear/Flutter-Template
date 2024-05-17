import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../constant/Constant.dart';
import '../../configs/Language.dart';
import '../LocalStorage.dart';
import '../Log.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
  @override
  String toString() {
    return 'Error : \n - StatusCode : $statusCode \n - Body : -> ( $bodyString )';
  }
}

enum METHODE { get, post }

class BaseHelper {
  String _getUrl({required String endpoint}) {
    return "$serverUrl/rest-api/$endpoint?${_langCode()}";
  }

  String _langCode() {
    return Language.currentLanguage.languageCode == 'en'
        ? 'languageCode=en'
        : 'languageCode=km';
  }

  String _token() => LocalStorage.getToken;

  Future<dynamic> onNetworkRequesting({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    required METHODE method,
    bool useToken = true,
  }) async {
    String reqUrl = _getUrl(endpoint: endPoint);

    Map<String, String> defaultHeader = useToken
        ? {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${_token()}',
          }
        : {
            'Content-Type': 'application/json; charset=UTF-8',
          };

    Log.warning("Requested To URL 👉 $reqUrl");
    try {
      switch (method) {
        case METHODE.get:
          final request = http.Request('GET', Uri.parse(reqUrl));
          request.body = json.encode(body);
          request.headers.addAll(header ?? defaultHeader);
          var response = await request.send().then((res) async {
            var contentType = res.headers['content-type'];

            if (contentType != null && contentType.contains('text/html')) {
              return Future.error(ErrorModel(
                bodyString: await res.stream.bytesToString(),
                statusCode: res.statusCode,
              ));
            } else {
              var data = await res.stream.bytesToString();
              return data;
            }
          });

          return _responseHandler(
            response,
            callBackHeader: header ?? defaultHeader,
            callBackBody: body,
          );

        case METHODE.post:
          http.Response response;
          response = await http.post(
            Uri.parse(reqUrl),
            body: body == null ? null : json.encode(body),
            headers: header ?? defaultHeader,
          );
          return _responseHandler(
            response,
            callBackHeader: header ?? defaultHeader,
            callBackBody: body,
          );
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  dynamic _responseHandler(
    http.Response response, {
    Map<String, String>? callBackHeader,
    Map<String, dynamic>? callBackBody,
  }) async {
    switch (response.statusCode) {
      case 200:
        Log.warning('status code : -- > 200');
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        Log.warning('status code : -- > 201');
        var responseJson = json.decode(response.body);
        return responseJson;
      case 202:
        Log.warning('status code : -- >  202');
        var responseJson = json.decode(response.body);
        return responseJson;
      case 404:
        Log.warning('Error Code :  404');
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        Log.warning('Error Code :  400');
        var responseJson = json.decode(response.body);

        return responseJson;
      case 401:
        Log.warning('Error Code :  401 refresh token');
        http.Response? res = await _refreshToken(
          callBackEndpoint: '',
          callBackBody: callBackBody,
        );
        if (res == null) {
          return Future.error(
            ErrorModel(
              statusCode: response.statusCode,
              bodyString: res,
            ),
          );
        } else {
          var responseJson = json.decode(res.body);
          return responseJson;
        }

      case 403:
        LocalStorage.removeToken();
        Log.warning('Token Expired Code :  403');
        var responseJson = json.decode(response.body);

        return responseJson;
      case 500:
        var res = json.decode(response.body);
        Log.warning('Error Code :  500 > $res');

        return Future.error(
          ErrorModel(
            statusCode: response.statusCode,
            bodyString: res,
          ),
        );

      default:
        final contentType = response.headers['content-type'];
        late ErrorModel error;
        Log.warning('Error defualt ');
        if (contentType != null && contentType.contains('application/json')) {
          error = ErrorModel(
            statusCode: response.statusCode,
            bodyString: jsonDecode(response.body),
          );
        } else {
          error = ErrorModel(
            statusCode: response.statusCode,
            bodyString: response.body,
          );
        }

        return Future.error(error);
    }
  }

  Future<http.Response?> _refreshToken({
    required String callBackEndpoint,
    Map<String, dynamic>? callBackBody,
  }) async {
    late http.Response? recallAPI;
    try {
      LocalStorage.removeToken();
      String reqUrl = _getUrl(endpoint: "");

      var request = http.Request('POST', Uri.parse(reqUrl));
      request.body = '''''';

      http.StreamedResponse response = await request.send();

      final result = json.decode(await response.stream.bytesToString());
      if (result['code'] == 200) {
        await LocalStorage.storeData(
          key: 'token',
          value: result['data']['access_token'],
        );
        recallAPI = await post(
          Uri.parse(_getUrl(endpoint: callBackEndpoint)),
          body: callBackBody != null ? jsonEncode(callBackBody) : null,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${_token()}',
          },
        );

        Log.success(recallAPI.toString());
      } else {
        recallAPI = null;
      }
    } catch (e) {
      recallAPI = null;
      Log.success(e.toString());
    }

    return recallAPI;
  }
}
