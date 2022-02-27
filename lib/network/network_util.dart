import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:astro_tak/network/simplified_uri.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'network_config.dart';
import 'network_exception.dart';

class NetworkUtil {
  static String url = baseUrl;

  NetworkUtil._internal();

  static final NetworkUtil _singleton = NetworkUtil._internal();

  factory NetworkUtil() {
    return _singleton;
  }

  String getBuildType() {
    String buildType = 'Qa build';
    switch (baseUrl) {
      case baseUrlQa:
        buildType = 'Qa build';
        break;
      case baseUrlDev:
        buildType = 'Dev build';
        break;
      default:
        buildType = 'Please check again';
    }
    return buildType;
  }

  getApiCall({
    required String url,
    Map<String, dynamic>? queryParameters,
    Function(dynamic data)? onSuccess,
    Function(dynamic data)? onFailure,
    Function(bool loading)? loading,
  }) async {
    var apiResponse;
    log('get -${baseUrl + url}');
    loading?.call(true);

    final Uri uri = SimplifiedUri.uri(baseUrl + url, queryParameters);

    try {
      final http.Response response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': authorizationToken
        },
      );
      log('Request: ${queryParameters}');
      try {
        apiResponse = _returnResponse(response: response);
        log('apiResponse: ${apiResponse}');
        loading?.call(false);
        onSuccess?.call(apiResponse);
        return apiResponse;
      } on UnauthorisedException {
        loading?.call(false);
      } catch (e) {
        apiResponse = json.decode(response.body.toString());
        loading?.call(false);
        onFailure?.call(apiResponse);
        return apiResponse;
      } finally {}
    } on SocketException {
      loading?.call(false);
      Map<String, String> jsonData = {'message': 'No Internet connection'};
      await Future.delayed(const Duration(seconds: 2));
      onFailure?.call(jsonData);
    }
  }

  postApiCall(
      {required String url,
      Object? requestBody,
      Function(dynamic data)? onSuccess,
      Function(dynamic data)? onFailure,
      Function(bool loading)? loading}) async {
    var apiResponse;
    log('post -${baseUrl + url}');
    loading?.call(true);
    try {
      final http.Response response = await http.post(
        Uri.parse(baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': authorizationToken
        },
        body: requestBody != null ? jsonEncode(requestBody) : null,
      );

      try {
        debugPrint('Api Request//////////////: ${jsonEncode(requestBody)} ');

        apiResponse = _returnResponse(response: response);
        log('Api response:  ${response.body}');

        onSuccess?.call(apiResponse);
        loading?.call(false);
        return apiResponse;
      } catch (e) {
        loading?.call(false);
        log('Post api exception: $e');
        apiResponse = json.decode(response.body.toString());
        onFailure?.call(apiResponse);
        return apiResponse;
      } finally {
        loading?.call(false);
      }
    } on SocketException {
      log('Post api socket  exception: ');

      Map<String, String> jsonData = {'message': 'No Internet connection'};
      await Future.delayed(const Duration(seconds: 2));
      onFailure?.call(jsonData);
      // throw FetchDataException('No Internet connection');
    }
  }

  callMultipartApi(
      {required String apiName,
      required dynamic requestBody,
      Map<String, String>? headers,
      List<File>? images,
      String? fileParamName,
      String? requestType,
      Function(dynamic onSucessJson)? onSuccess,
      Function(dynamic onFailureJson)? onFailure,
      Function(bool isLoading)? loading}) async {
    loading?.call(true);
    log('Api images:  ${images?.toList()}');
    var request =
        http.MultipartRequest(requestType ?? 'POST', Uri.parse(url + apiName));
    request.headers.addAll(headers ??
        <String, String>{
          "Content-Type": "multipart/form-data",
          "Accept": "application/json"
        });

    if (fileParamName != null && images != null) {
      for (int i = 0; i < images.length; i++) {
        request.files.add(http.MultipartFile(
            'Files', images[i].readAsBytes().asStream(), images[i].lengthSync(),
            filename: basename(images[i].path)));
      }
    }
    log('Api Request files:  ${request.files}');
    request.fields.addAll(requestBody);
    var apiResponse;

    http.Response response =
        await http.Response.fromStream(await request.send());
    try {
      log('Api Request:  ${jsonEncode(requestBody)}');

      apiResponse = _returnResponse(response: response);
      log('Response:  ${response.body}');
      log('Api response:  ${apiResponse.body}');
      loading?.call(false);

      onSuccess?.call(apiResponse);
    } catch (e) {
      log('Error from network util ${e.toString()}');

      //   apiResponse = json.decode(response.body.toString());
      loading?.call(false);
      onFailure?.call(apiResponse);
    } finally {
      loading?.call(false);
    }

    return apiResponse;
  }

  dynamic _returnResponse({required http.Response response}) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // log(responseJson.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        // log(responseJson.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());

      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());

      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
        throw InternalServerErrorException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
