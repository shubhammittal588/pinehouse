import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinehouse/Screens/Third_Screen.dart';
import 'package:pinehouse/Widgets/appBar_widget.dart';
import 'package:pinehouse/Widgets/button.dart';

class Second_Screen extends StatefulWidget {
  const Second_Screen({super.key});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'SCREEN2',
      ),
      body: FadeInDownBig(
        child: Column(
          children: [
            Container(
                height: 610,
                child: StreamBuilder<QuerySnapshot>(
                  stream: db.collection("Users").snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    final Value = (snapshot.data! as QuerySnapshot).docs;
                    return ListView.builder(
                      itemCount: Value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Third_Screen(
                                      Age: Value[index]["Age"],
                                      Department: Value[index]["Department"],
                                      Mobile_no: Value[index]["Mobile No"],
                                      Name: Value[index]["Name"],
                                      img: Value[index]["Photo"],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 100,
                                margin: EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    )),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRect(
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  Value[index]["Photo"]),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(right: 8, top: 4),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            Value[index]["Name"],
                                            maxLines: 2,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: myButton(
                        height: 50,
                        path: "/",
                        radius: 20,
                        text: "First Screen",
                        width: 174,
                        backColor: Colors.white,
                        textColor: Colors.blue),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: myButton(
                        height: 50,
                        path: "/Third_Screen",
                        radius: 20,
                        text: "Third Screen",
                        width: 174,
                        backColor: Color.fromARGB(255, 80, 108, 202),
                        textColor: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
