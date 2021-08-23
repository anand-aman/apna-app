import 'package:flutter/material.dart';
import 'package:apna_app/presentation/widget/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: PostCard(),
          ),
        ),
      ),
    );
  }
}
