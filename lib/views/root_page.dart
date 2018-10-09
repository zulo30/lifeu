import 'package:flutter/material.dart';
import 'auth/auth.dart';
import 'auth/login_page.dart';
import 'home_page.dart';
import 'starter_page.dart';


class RootPage extends StatefulWidget {
  RootPage({Key key, this.auth}) : super(key: key);
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
 
  bool _gettingStarted = true;
  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus = userId != null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
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
    if(!_gettingStarted){
      switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage(
          title: 'lifeu',
          auth: widget.auth,
          onSignIn: () => _updateAuthStatus(AuthStatus.signedIn),
        );
      case AuthStatus.signedIn:
        return new HomePage(
          auth: widget.auth,
          onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn)
        );
      }
    }else{
       _gettingStarted = false;
       return new PageViewPage(context);

    
    }
    return new PageViewPage(context);
  }
}