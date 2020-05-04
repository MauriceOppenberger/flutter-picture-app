// Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

// Refactor 'StatelessWidget' into 'StateFulWidget
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

// Create a class that will be our custom widget
// This call must extend the 'StatelessWidget' base class
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 5;
    final response =
        // await get('https://jsonplaceholder.typicode.com/photos/$counter');
        await get('https://picsum.photos/id/$counter/info');

    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

// Must define a 'build' method that returns
// the widget that *this* widget will show
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's see some images!"),
        ),
        // => set comma to avoid VS collapse code for more readability
        body: ImageList(images),

        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage, // => Add your onPressed code here!
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
