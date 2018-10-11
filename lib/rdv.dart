import 'package:cloud_firestore/cloud_firestore.dart';


class Rdv {
  final String appointment_date;
  final DateTime customer_first_name;
  final DateTime customer_last_name;
  final DateTime doctor;
  final DocumentReference reference;


  Rdv.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['appointment_date'] != null),
        assert(map['customer_first_name'] != null),
        assert(map['customer_last_name'] != null),
        assert(map['doctor'] != null),
        appointment_date = map['appointment_date'],
        customer_first_name = map['customer_first_name'],
        customer_last_name = map['customer_last_name'],
        doctor = map['doctor'];

  Rdv.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$customer_first_name:$customer_last_name>";
}