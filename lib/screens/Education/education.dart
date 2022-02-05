import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  final Stream<QuerySnapshot> education =
      FirebaseFirestore.instance.collection("education").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: education,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text("something went wrong");
            if (snapshot.connectionState == ConnectionState.waiting)
              return Text("Loading");
            final data = snapshot.requireData;
            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Card(
        borderOnForeground: true,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title:  Text("${data.docs[index]['head']}"),
                  subtitle: Text(
                    '${data.docs[index]['detail']}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),],
    ));
              },
            );
          },
        ));
  }
}





