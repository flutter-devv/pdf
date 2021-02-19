import 'package:flutter/material.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("go to pdf"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PdfPage()),
            );
          },
        ),
      ),
    );
  }
}

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  var path;
  @override
  // void initState() {
  //   PdftronFlutter.openDocument(
  //       "http://www.africau.edu/images/default/sample.pdf");
  //   super.initState();
  // }

  openPdf() {
    PdftronFlutter.openDocument(
        "http://www.africau.edu/images/default/sample.pdf");
  }

  getFilePath() async {
    path = await PdftronFlutter.saveDocument();
    print("pathhhhhhhhhhh :$path");
  }

  // @override
  // void dispose() {
  //   getFilePath();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              path = await PdftronFlutter.saveDocument();
            }),
      ),
      body: Container(
        child: openPdf(),
      ),
    );
  }
}
