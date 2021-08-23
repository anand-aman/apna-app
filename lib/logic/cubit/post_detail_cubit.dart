import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit() : super(PostDetailInitial());

  String title = "title";
  String author = "author";
  String description = "description";
  int points = -1;
  List<dynamic> comments = [];

  Future<void> getPostData({required String objectId}) async{
    http.Response response = await http.get(Uri.parse('https://hn.algolia.com/api/v1/items/$objectId'));

    //Emitting state for error
    if(response.statusCode != 200){
      emit(PostDetailError());
      print("Error. Status Code: ${response.statusCode}");
      return;
    }

    var data = jsonDecode(response.body);
    title = data['title'];
    author = data['author'];
    description = data['text'];
    points = data['points'];
    comments = data['children'];
    print(comments);

    emit(PostDetailLoaded());
  }


}

