import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  RxBool loader = false.obs;

  Future<Stream<QuerySnapshot>> getData(String collectionName) async {
    try {
      return FirebaseFirestore.instance.collection(collectionName).snapshots();
    } catch (e) {
      print('Error getting data: $e');
      rethrow;
    }
  }
}
