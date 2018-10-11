import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patient/doctors.dart';
import 'package:patient/horaires.dart';

var test = ['1','2','3'];

class ScreenHoraire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horaire')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('time_slots').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );

  }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: test.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, String id) {
    return new FutureBuilder(
      future: Horaires.getById(id),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          return new Container();
        }

        if (snapshot.data.data == null) {
          return new Container();
        }

        final horaires = Horaires.fromSnapshot(snapshot.data);

        return Padding(
          key: ValueKey(horaires.id),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(

              title: Text('Début : '+horaires.start.toString() + '\r\nFin : ' + horaires.end.toString()),
              /*onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenHoraire()),
          ) ,*/
            ),
          ),
        );
      },
    );
  }
}


