import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RootRepo {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('products');
}
