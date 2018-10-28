  import 'package:flutter/material.dart';
  import 'auth/auth.dart';
  import 'starter_page.dart';

  class HomePage extends StatelessWidget {
    HomePage({this.auth, this.onSignOut});
    final BaseAuth auth;
    final VoidCallback onSignOut;


    @override
    Widget build(BuildContext context) {

      void _signOut() async {
        try {
          await auth.signOut();
          onSignOut();
        } catch (e) {
          print(e);
        }

      }

      return new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new FlatButton(
                onPressed: _signOut,
                child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.white))
            )
          ],
        ),
        body: new Center(
          child: new RaisedButton(
                color: Colors.purple,
                onPressed: (){ Navigator.pushNamed(context, '/calendar');},
                child: new Text('foobar', style: new TextStyle(fontSize: 17.0, color: Colors.white))
            )
        )
    );
  }
}