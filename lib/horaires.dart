import 'package:cloud_firestore/cloud_firestore.dart';


class Horaires {
  final bool available;
  final DateTime end;
  final DateTime start;
  final DocumentReference reference;


  Horaires.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['first_name'] != null),
        assert(map['last_name'] != null),
        assert(map['login'] != null),
        assert(map['password'] != null),
        assert(map['time_slots'] != null),
        first_name = map['first_name'],
        last_name = map['last_name'],
        login = map['login'],
        password = map['password'],
        time_slots = map['time_slots'];

  Horaires.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$first_name:$last_name>";
}