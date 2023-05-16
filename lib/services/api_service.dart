import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_flutter/models/post_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class Apiservice{
  factory Apiservice(Dio dio) = _Apiservice;
  
  @GET('posts')
  Future<List<PostModel>> getPosts();
}