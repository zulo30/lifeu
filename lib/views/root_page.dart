import 'dart:async';
import 'package:flutter/material.dart';
import 'auth/auth.dart';
import 'auth/login_page.dart';
import 'home_page.dart';
import 'starter_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class RootPage extends StatefulWidget  {
  RootPage({Key key, this.auth}) : super(key: key);
  final BaseAuth auth;



  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  gettingStarted,
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {

  final storage = new FlutterSecureStorage();
  AuthStatus authStatus = AuthStatus.gettingStarted;


  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        if(authStatus != AuthStatus.gettingStarted ){
        authStatus = (userId != null )? AuthStatus.signedIn : AuthStatus.notSignedIn;
        }
        
      });
    });
  }

  void _updateAuthStatus(AuthStatus status) {
    setState(() {
      authStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
   
      switch (authStatus) {
      case AuthStatus.gettingStarted:
        return new PageViewPage(
          title: 'lifeu',
          auth: widget.auth,
          gettingStarted: () => _updateAuthStatus(AuthStatus.notSignedIn),
//          builder: (context) => new Scaffold(),
        );
      case AuthStatus.notSignedIn:
        return new LoginPage(
          title: 'lifeu',
          auth: widget.auth,
          onSignIn: () => _updateAuthStatus(AuthStatus.signedIn),

        );
      case AuthStatus.signedIn:
        return new HomePage(
          auth: widget.auth,
          onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn),

        );
      }
    }
    
  
}