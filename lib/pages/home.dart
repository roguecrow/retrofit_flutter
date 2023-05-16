import 'package:flutter/material.dart';
import 'package:retrofit_flutter/services/api_service.dart';
import 'package:retrofit_flutter/models/post_model.dart';
import 'package:dio/dio.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1D1E22),
        title: const Text('RETROFIT'),
        centerTitle: true,
      ),
      body: _body()
    );
  }

  FutureBuilder _body(){
    final apiservice = Apiservice(Dio(BaseOptions(contentType:"applicaion/json")));
    return FutureBuilder(
      future: apiservice.getPosts(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          final List<PostModel>posts = snapshot.data!;
          return _posts(posts);
        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  Widget _posts(List<PostModel> posts){
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context,index) {
        return Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black38,width: 1),
          ),
          child: Column(
            children: [
              Text(
                posts[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                posts[index].title
              )
            ],
          ),
        );
      },
    );
  }
}
