import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getData() async{
    http.Response response = await http.get(Uri.parse('https://hn.algolia.com/api/v1/search?query=hacker%20news'));
    print(response.statusCode);
    var data = jsonDecode(response.body);
    print(data);
    emit(HomeLoaded());
  }
}
