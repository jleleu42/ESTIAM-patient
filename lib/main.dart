import 'package:flutter/material.dart';
import 'package:patient/screenDoctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String prenom = '';
  String nom = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Identification')),


      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text('Entrez nom et prénom :'),

            new Divider(height: 2.0),

            new TextField(
              decoration: InputDecoration(
                  hintText: 'Prénom'
              ),
              autofocus: true,
              onChanged: (String text){
                setState(() {
                  prenom = text;
                });
              },
            ),
            new TextField(
              decoration: InputDecoration(
                  hintText: 'Nom'
              ),
              onChanged: (String text){
                setState(() {
                  nom = text;
                });
              },
            ),


            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              child: new Text("Choisir un médecin"),

              onPressed: () {
                if(prenom != '' && nom != ''){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScreenDoctor()),
              );}else{
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the user has typed in using our
                        // TextEditingController
                        content: Text('Veuillez entrer les infos demandées'),
                      );
                    },
                  );
                }
              }
              ,
            ),
          ],
        ),
      ),
    );
  }


}
