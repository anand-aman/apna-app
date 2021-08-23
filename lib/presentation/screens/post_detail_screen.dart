import 'package:apna_app/logic/cubit/post_detail_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailScreen extends StatelessWidget {
  PostDetailScreen({Key? key, required this.objectId}) : super(key: key);
  final String objectId;

  final AppBar _appBar = AppBar(
    title: Text('Post'),
  );

  @override
  Widget build(BuildContext context) {
    final _postDetailCubit = BlocProvider.of<PostDetailCubit>(context);
    _postDetailCubit.getPostData(objectId: objectId);
    final double bodyHeight = MediaQuery.of(context).size.height - _appBar.preferredSize.height;
    return Scaffold(
      appBar: _appBar,
      body: Container(
        margin: EdgeInsets.all(15.0),
        height: bodyHeight,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<PostDetailCubit, PostDetailState>(
          builder: (context, state) {
            if (state is PostDetailLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_postDetailCubit.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Points: ${_postDetailCubit.points.toString()}',
                    style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '${_postDetailCubit.description}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                            itemCount: _postDetailCubit.comments.length <=10 ? _postDetailCubit.comments.length : 10,
                            itemBuilder: (context, index) {
                              var comment = _postDetailCubit.comments[index];
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${comment['author']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text('${comment['text']}'),
                                  ],
                                ),
                              );
                            }),
                      ))
                ],
              );
            }
            else if (state is PostDetailError){
              Center(child: Text("Error Occurred"),);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}