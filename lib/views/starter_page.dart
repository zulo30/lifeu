import 'package:flutter/material.dart';

import 'auth/auth.dart';
import 'root_page.dart';


class PageViewPage extends StatefulWidget {
  // fields 
 
  PageViewPage({String title, BaseAuth auth, void Function() gettingStarted,Key key, this.onLayoutToggle })
        : super(key: key);

  String title;
  BaseAuth auth;
  VoidCallback gettingStarted;
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
 
 
  Widget _buildPage({BuildContext context,String imageUrl,String text ="defaultText", String description = " description not found"}){
    return Container(
     padding: EdgeInsets.only(left:16.0, right: 16.0),
      alignment: AlignmentDirectional.topStart,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          new Image(
            image: new AssetImage('$imageUrl'),
              width:500.0,
              height:500.0,
              gaplessPlayback:true,
          ),    
          new Column(
           children:<Widget>[
              new Text('$text', style: new TextStyle( color:Colors.purple, fontSize: 24.0),),
              new Text('$description', style: new TextStyle( color:Colors.black, fontSize: 16.0),),
                 new RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    textColor: Colors.white,
                    color: Colors.purple,
                    onPressed:  () {
                        //widget?.gettingStarted();
                        Navigator.pushNamed(context, '/');
                    },
                    child: new Text("Get Started"),
                  ),

           ]
          )
         
        ]
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