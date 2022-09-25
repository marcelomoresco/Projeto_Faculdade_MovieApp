import 'dart:html';

import 'package:dio/dio.dart';

import 'dio_service.dart';

class DioServiceImp extends DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://developers.themoviedb.org/4/',
        headers: {
          'content-type': 'aplicattion/json;chaset=utf-8',
          'authorization':
              'Bear eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTc1MzNjMTA5OTY4ZmFhNzI0ZDE3ODdmNjViOGEyMSIsInN1YiI6IjYzMDVhMDJlYWFmODk3MDA3Y2ViYThkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Caph5PaplciHIziUfc4dI-7lvbu4vZcIkQmieoIbB2Y'
        },
      ),
    );
  }
}
