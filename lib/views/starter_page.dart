import 'package:flutter/material.dart';
import 'package:lifeu/views/utils/vendors/page_view_indicator.dart';

import 'auth/auth.dart';
import 'utils/button.dart';



class PageViewPage extends StatefulWidget {
  // fields 
 
  PageViewPage({Key key, this.onLayoutToggle, this.title, this.auth, this.gettingStarted })
        : super(key: key);

  final String title;
  final BaseAuth auth;
  final VoidCallback gettingStarted;
  final VoidCallback onLayoutToggle;

  @override
  PageViewPageState createState() {
    return new PageViewPageState();
  }
}

class PageViewPageState extends State<PageViewPage> {

  @override
	void initState(){
		super.initState();
	}


  Widget _buildPage(
      {BuildContext context, String imageUrl, String text = "defaultText", String description = " description not found"}) {
    return new FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.topCenter,
        child: new Container(
            decoration:  new BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            alignment: AlignmentDirectional.topStart,
            child: new Column(
                children: <Widget>[
                  new Image(
                    image: new AssetImage('$imageUrl'),
                    width: 450.0,
                    height: 450.0,
                    gaplessPlayback: true,
                  ),
                  new PageViewIndicator(
                    pageIndexNotifier: new ValueNotifier(0),
                    length: 4,
                    normalBuilder: (animationController) =>
                        Circle(
                          size: 8.0,
                          color: Colors.purple,
                        ),
                    highlightedBuilder: (animationController) =>
                        ScaleTransition(
                          scale: CurvedAnimation(
                            parent: animationController,
                            curve: Curves.ease,
                          ),
                          child: Circle(
                            size: 8.0,
                            color: Colors.white,
                          ),
                        ),
                  ),
                  new Text('$text', style: new TextStyle( color:Colors.purple, fontSize: 28.0),),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Container(
                      constraints: new BoxConstraints(
                          maxWidth: 350.0
                      ),
                      child: new Text('$description',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                              color:Colors.black,
                              fontSize: 16.0),
                              softWrap: true
                      )
                  ),
                  new RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    textColor: Colors.white,
                    color: Colors.purple,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: () {
                      widget?.gettingStarted();
                    },
                    child: new Text("Get Started"),
                  ),

                  new SizedBox(
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Divider(height: 16.0,color:Colors.purple,),
                        Center(child: Text('or')),
                        Divider( height: 16.0,color:Colors.purple),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        child: button('Google', 'assets/login/google.png'),
                        onPressed: (){},
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      MaterialButton(
                        child: button('Facebook', 'assets/login/facebook.png', Colors.white),
                        onPressed: (){},
                        color: Color.fromRGBO(58, 89, 152, 1.0),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(35.0)),
                ]
            )
        )
    );
  }

  Widget _buildPageView() {
      return PageView(
        children: [
          _buildPage(
            imageUrl:'assets/onboarding_pages/confirmed.png',
            text: 'Maneja mejor tu tiempo',
            description:'Contaras con un calendario donde puedes almacenar tus horarios y fechas importantes como por ejemplo entregas de trabajos o examenes. ',
          ),
          _buildPage(
            imageUrl:'assets/onboarding_pages/grades.png',
            text:'Te ayuda a elegir tu profesor',
            description:'En esta aplicación contaras con un ranking de profesores donde puedes ver las calificaciones que otros usuarios han hecho de cada maestro.',
            ),
        
          _buildPage(   
            imageUrl:'assets/onboarding_pages/designer.png',        
            text:'No te pierdas',
            description:'lifeu te brinda la posibilidad de ver los mapas que existan en la app de tu universidad. Así que si eres nuevo, ¡No te pierdas!',
            ),
          _buildPage(
            imageUrl:'assets/onboarding_pages/fans.png',
            text:'¿Listo para empezar?',
            description:'La universidad es una experiencia, usa LIFE-U todos los días y ¡mejórala!',
            ),
        ],
      );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _buildPageView()
      );
    }
}