import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<dynamic> postList = [];
  int itemCount = -1;

  Future<void> getData() async{
    http.Response response = await http.get(Uri.parse('https://hn.algolia.com/api/v1/search?query=hacker%20news'));

    //Emitting state for error
    if(response.statusCode != 200){
      emit(HomeError());
      print("Error. Status Code: ${response.statusCode}");
      return;
    }

    var data = jsonDecode(response.body);
    postList = data['hits'];
    itemCount = data['hitsPerPage'];
    print(postList.length);
    emit(HomeLoaded());
  }
}
