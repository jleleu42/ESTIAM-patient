import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patient/doctors.dart';

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
      stream: Firestore.instance.collection('appointements').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );

  }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final doctors = Doctors.fromSnapshot(data);

    return Padding(
      key: ValueKey(doctors.login),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(doctors.first_name + ' ' + doctors.last_name),
          /*onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenHoraire()),
          ) ,*/
        ),
      ),
    );
  }
}


