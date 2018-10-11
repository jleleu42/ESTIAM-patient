import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';


class Horaires {
  final bool available;
  final DateTime end;
  final DateTime start;
  final String id;
  final DocumentReference reference;

  Horaires.fromMap(Map<String, dynamic> map, id, {this.reference})
      : assert(map['available'] != null),
        assert(map['end'] != null),
        assert(map['start'] != null),
        available = map['available'],
        end = map['end'],
        id = id,
        start = map['start'];

  Horaires.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.documentID, reference: snapshot.reference);

  @override
  String toString() => "Record<$end:$start>";

  static Future<DocumentSnapshot> getById (String id) async {
    return Firestore.instance.collection('time_slots').document(id).get();
  }
}