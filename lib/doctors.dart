import 'package:cloud_firestore/cloud_firestore.dart';


class Doctors {
  final String first_name;
  final int id;
  final String last_name;
  final String login;
  final String password;
  final List<dynamic> time_slots;
  final DocumentReference reference;


  Doctors.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['first_name'] != null),
        assert(map['id'] != null),
        assert(map['last_name'] != null),
        assert(map['login'] != null),
        assert(map['password'] != null),
        assert(map['time_slots'] != null),
        first_name = map['first_name'],
        id = map['id'],
        last_name = map['last_name'],
        login = map['login'],
        password = map['password'],
        time_slots = map['time_slots'];

  Doctors.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$first_name:$last_name>";
}