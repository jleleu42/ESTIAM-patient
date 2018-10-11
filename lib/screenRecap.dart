import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patient/doctors.dart';
import 'package:patient/globals.dart';
import 'package:patient/horaires.dart';
import 'package:intl/intl.dart';

class ScreenRecap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Récapitulatif')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {

    return Column(
      children: <Widget>[
        new Divider(height: 1.0,),
        new  Text('Dr.' + currentRdv.doctor.first_name.toString() + ' ' + currentRdv.doctor.last_name.toString()),
        new Divider(height: 1.0,),
        new Text('Pour ' + currentRdv.customer_first_name.toString() + ' ' + currentRdv.customer_last_name.toString()),
        new Divider(height: 1.0,),
        new Text('Le ' + formater.format(currentRdv.appointment_date.start) + ' au ' + formater.format(currentRdv.appointment_date.end)),
        new Center(
          child: new Container(
            child: new RaisedButton(
              child: new Text("Valider le rendez-vous"),
              onPressed: () {
                currentRdv.persist();
                Navigator.pop(
                    context
                );
              },
            ),
          ),
        )
      ],
    );


  }
}


