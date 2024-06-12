import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bottlend/network/appException.dart';
import 'package:bottlend/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices implements BaseApiServices {
  final String baseUrl = 'localhost:8282/api';

  @override
  Future getGetApiResponse(String endpoint) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(baseUrl + endpoint), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('Pastikan anda terhubung ke internet');
    } on TimeoutException {
      throw FetchDataException('Network request timed out');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String endpoint, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('Pastikan anda terhubung ke internet');
    } on TimeoutException {
      throw FetchDataException('Network request timed out');
    }

    return responseJson;
  }

  @override
  Future getPutApiResponse(String endpoint, data) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(baseUrl + endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('Pastikan anda terhubung ke internet');
    } on TimeoutException {
      throw FetchDataException('Network request timed out');
    }

    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String endpoint) async {
    dynamic responseJson;
    try {
      final response = await http
          .delete(Uri.parse(baseUrl + endpoint), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('Pastikan anda terhubung ke internet');
    } on TimeoutException {
      throw FetchDataException('Network request timed out');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    dynamic responseJson = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['messages'][0]);
      case 401:
        throw UnauthorizedException(responseJson['messages'][0]);
      case 403:
        throw ForbiddenException(responseJson['messages'][0]);
      case 404:
        throw NotFoundException(responseJson['messages'][0]);
      case 409:
        throw BadRequestException(responseJson['messages'][0]);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
