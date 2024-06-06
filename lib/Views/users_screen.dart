import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersCollection extends StatefulWidget {
  const UsersCollection({super.key});

  @override
  State<UsersCollection> createState() => _UsersCollectionState();
}

class _UsersCollectionState extends State<UsersCollection> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
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
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('${snapshot.data!.docs[index]['name']}'),
                    subtitle: Text('${snapshot.data!.docs[index]['email']}'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: Text('No Data Found'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
