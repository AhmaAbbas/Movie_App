import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Faulire{
  String error;
  Faulire(this.error);
}
class ServerFaulire extends Faulire {
  ServerFaulire(super.error);

  factory ServerFaulire.fromDioErro(DioError dioError)
  {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFaulire("connectionTimeout with Api Server");
      case DioErrorType.sendTimeout:
        return ServerFaulire("sendTimeout with Api Server");
      case DioErrorType.receiveTimeout:
        return ServerFaulire("receiveTimeout with Api Server");
      case DioErrorType.badCertificate:
        return ServerFaulire("badCertificate with Api Server");
      case DioErrorType.badResponse:
        return ServerFaulire.frombadresponse(dioError.response!.statusCode!,dioError.response!.data!);
      case DioErrorType.cancel:
        return ServerFaulire("Request to Api Server was canceled");
      case DioErrorType.connectionError:
        return ServerFaulire("connectionError with Api Server, please try again later");
      case DioErrorType.unknown:
        if(dioError.message!.contains('SocketException')){
          return ServerFaulire("No Internet Connection");
        }
        return ServerFaulire("Unexpected error please try again!");
      default:
        return ServerFaulire("Opps There Was an error,please try again!");

    }
  }
  factory ServerFaulire.frombadresponse(int statuscode,dynamic response)
  {
    if(statuscode==400||statuscode==401||statuscode==403)
    {
      return ServerFaulire(response['error']['message']);
    }
    else if(statuscode==404)
    {
      return ServerFaulire('Your Requset Not Found, please try later!');
    }
    else if(statuscode==500)
    {
      return ServerFaulire('Internal Server Error, please try later!');
    }
    else{
      return ServerFaulire("Opps There Was an error,please try again!");
    }
  }
}