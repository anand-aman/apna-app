import 'package:apna_app/logic/cubit/home_cubit.dart';
import 'package:apna_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _homeCubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apna App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider.value(
        value: _homeCubit,
        child: HomeScreen(),
      ),
    );
  }
}
