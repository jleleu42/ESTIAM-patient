import 'package:cloud_firestore/cloud_firestore.dart';


class Horaires {
  final bool available;
  final DateTime end;
  final DateTime start;
  final DocumentReference reference;


  Horaires.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['available'] != null),
        assert(map['end'] != null),
        assert(map['start'] != null),
        available = map['available'],
        end = map['end'],
        start = map['start'];

  Horaires.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$end:$start>";
}