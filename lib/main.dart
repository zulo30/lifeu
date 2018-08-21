import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'lifeu',
      theme: new ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: new MyHomePage(title: 'lifeu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    List<String> _universidades = <String>[];
    @override
      void initState() {
        super.initState();
        _universidades = new List.generate(10, (i) => "universidades $i" );
      }

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        
        title: Text(widget.title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0)),
      ),
      body: new Center(
        child: new  ListView(
         children: _universidades.map((uni) => new Text(uni)).toList(),
      )),
    );
  }
}
