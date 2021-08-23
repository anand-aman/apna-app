import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  PostDetailScreen({Key? key}) : super(key: key);

  final AppBar _appBar = AppBar(
    title: Text('Post'),
  );

  @override
  Widget build(BuildContext context) {
    final double bodyHeight = MediaQuery.of(context).size.height - _appBar.preferredSize.height;
    return Scaffold(
      appBar: _appBar,
      body: Container(
        margin: EdgeInsets.all(8.0),
        height: bodyHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            Text(
              'Points: 1520',
              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
            ),
            SizedBox(height: 15),
            Text(
              'I’m currently in a country with low speed internet and the entire ‘modern’ web is basically unusable except HN, which still loads instantly. Reddit, Twitter, news and banking sites are all painfully slow or simply time out altogether.</p><p>To PG, the mods and whoever else is responsible: thank you for not trying to ‘fix’ what isn’t broken.',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 15),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Author', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('old.reddit.com is still usable if it helps!'),
                    SizedBox(height: 10.0),
                    Text('Author', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('old.reddit.com is still usable if it helps!'),
                    SizedBox(height: 10.0),
                    Text('Author', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('old.reddit.com is still usable if it helps!'),
                    SizedBox(height: 10.0),
                    Text('Author', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('old.reddit.com is still usable if it helps!'),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
