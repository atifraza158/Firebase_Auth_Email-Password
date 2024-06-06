import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Controllers/auth_controller.dart';
import 'package:firebase_app/Controllers/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController authController = Get.put(AuthController());
  FirestoreController firestoreController = Get.put(FirestoreController());
  Stream? userStream;

  getUsers() async {
    userStream = await firestoreController.getData('Users');
    setState(() {});
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: Obx(
              () => authController.loader.value
                  ? CircularProgressIndicator()
                  : Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return ListTile(
                  title: Text('${ds['name']}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }
}
