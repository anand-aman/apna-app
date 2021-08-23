import 'package:apna_app/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:apna_app/presentation/widget/post_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.getData();
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return ListView.builder(
                    itemCount: _homeCubit.itemCount,
                    itemBuilder: (context, index) {
                      return PostCard(
                        title: _homeCubit.postList[index]['title'],
                        author: _homeCubit.postList[index]['author'],
                        date: _homeCubit.postList[index]['created_at'],
                        objectId: _homeCubit.postList[index]['objectID'],
                      );
                    });
              }
              else if (state is HomeError){
                Center(child: Text("Error Occurred"),);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
