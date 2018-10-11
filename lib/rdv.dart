import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patient/doctors.dart';
import 'package:patient/horaires.dart';


class Rdv {
  Horaires appointment_date;
  String customer_first_name;
  String customer_last_name;
  Doctors doctor;
  final DocumentReference reference;

  Rdv({this.reference});

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

  void persist() {
    Firestore.instance.collection('appointments').document().setData({
      'appointment_date': appointment_date.id,
      'doctor': doctor.id,
      'customer_first_name': customer_first_name,
      'customer_last_name': customer_last_name
    });

    Firestore.instance.collection('time_slots').document(appointment_date.id).updateData({'available':false});
  }
}