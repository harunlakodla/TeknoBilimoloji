import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:teknobilimoloji/comp/linkUrl/LinkUrl.dart';

class WordPerss extends StatefulWidget {
  @override
  _WordPerssState createState() => _WordPerssState();
}

class _WordPerssState extends State<WordPerss> {
  wp.WordPress wordPress;

  List<wp.Post> _posts = new List();
  int _currentPage = 1;

  @override
  void initState() {

    /// Initialize WordPress
    wordPress = new wp.WordPress(
      baseUrl: BilimFiliUrl,
    );

    /// Generate posts for the first page and append it to _posts list.
    _generatePosts(_currentPage);
    super.initState();
  }

  void _generatePosts(int pageNum) {
    Future<List<wp.Post>> response = wordPress.fetchPosts(
      postParams: wp.ParamsPostList(
        pageNum: pageNum,
        perPage: 5,
      ),
    );

    response.then((newPosts) {

      /// Once posts are fetched append it to existing list. setState updates
      /// listview widget with new posts.
      setState(() {
        _posts.addAll(newPosts);
      });
    }).catchError((err) {
      print("Failed to fetch posts: " + err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Wordpress",
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {

          /// Create a button at the end of the listview which increments
          /// _currentPage and generates posts on press.
          if (i == _posts.length) {
            return RaisedButton(
              onPressed: () {
                setState(() {
                  _currentPage++;
                  _generatePosts(_currentPage);
                });
              },
              child: Text("Load More"),
            );
          }

          /// Replace this with whatever post content you want display
          return Card(
            child: Column(
              children: <Widget>[
                Image.network(_posts[i].featuredMedia.mediaDetails.sizes.medium.sourceUrl.toString()),
                Text(_posts[i].title.rendered)
              ],
            ),
          );
        },
        /// Number of posts plus the button
        itemCount: _posts.length + 1,
      ),
    );
  }
  
}
