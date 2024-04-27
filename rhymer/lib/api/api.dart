import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rhymer/api/models/models.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RhymerApiClient {
  factory RhymerApiClient(Dio dio, {String baseUrl}) = _RhymerApiClient;

  @GET('/tasks')
  Future<List<Rhymes>> getTasks();
}
