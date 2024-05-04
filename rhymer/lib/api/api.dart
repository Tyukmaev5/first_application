import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rhymer/api/models/models.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RhymerApiClient {
  factory RhymerApiClient(Dio dio, {String baseUrl}) = _RhymerApiClient;

  factory RhymerApiClient.create({String? apiUrl}) {
    final apiURL = dotenv.env['API_URL'];
    final dio = Dio();
    if (apiURL != null) {
      return RhymerApiClient(dio, baseUrl: apiURL);
    }
    return RhymerApiClient(dio);
  }

  @GET('/tasks')
  Future<Rhymes> getRhymesList(@Query('word') String word);
}

// RhymerApiClient initApiClient() {
//   final apiURL = dotenv.env['API_URL'];
//   final dio = Dio();
//   if (apiURL != null) {
//     return RhymerApiClient(dio, baseUrl: apiURL);
//   }
//   return RhymerApiClient(dio);
// }
