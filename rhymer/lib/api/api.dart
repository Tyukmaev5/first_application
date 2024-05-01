import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rhymer/api/models/models.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RhymerApiClient {
  factory RhymerApiClient(Dio dio, {String baseUrl}) = _RhymerApiClient;

  @GET('/tasks')
  Future<List<Rhymes>> getTasks(@Query('word') String word);
}

void initApiClient() {
  final apiURL = dotenv.env['API_URL'];
  if (apiURL != null) {
    final apiClient = RhymerApiClient(Dio(), baseUrl: apiURL); 
  }
  RhymerApiClient(Dio());
}