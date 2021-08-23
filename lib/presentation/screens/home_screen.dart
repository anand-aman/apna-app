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
      body: SafeArea(
        child: Container(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return SingleChildScrollView(
                  child: PostCard(),
                );
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
