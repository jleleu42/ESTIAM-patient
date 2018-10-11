import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';


class Horaires {
  final bool available;
  final DateTime end;
  final DateTime start;
  final int id;
  final DocumentReference reference;



  Horaires.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['available'] != null),
        assert(map['end'] != null),
        assert(map['id'] != null),
        assert(map['start'] != null),
        available = map['available'],
        end = map['end'],
        id = map['id'],
        start = map['start'];

  Horaires.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$end:$start>";

  static Future<DocumentSnapshot> getById (String id) async {
    return Firestore.instance.collection('time_slots').document(id).get();
  }
}