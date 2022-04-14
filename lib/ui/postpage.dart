import 'package:flutter_examples/models/posts.dart';
import 'package:flutter_examples/services/remote_services.dart';
import 'package:flutter/material.dart';

/****
 * Example of listview
 * Fetch data from api and display data in listview
 * {@link https://www.youtube.com/watch?v=c09XiwOZKsI}
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // fetch data from api
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      posts![index].title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text("${posts![index].body}")
                  ],
                ),
              );
            },
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
}
