import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinehouse/Widgets/appBar_widget.dart';
import 'package:pinehouse/Widgets/button.dart';
import 'package:pinehouse/Widgets/dropoDown_Menu.dart';
import 'package:pinehouse/Widgets/textField_widget.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController profile_photo = TextEditingController();
  TextEditingController drop = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Users");

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'SCREEN1',
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FadeInDownBig(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        ClipRect(
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: name,
                          hintTxt: "Enter Name",
                          labelTxt: "Name",
                          myIcon: Icon(Icons.person),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: phone,
                          hintTxt: "Enter Phone",
                          labelTxt: "Phone no.",
                          myIcon: Icon(Icons.phone),
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone no.';
                            } else if (value.length != 10) {
                              return 'Enter 10 digit phone no.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: age,
                          hintTxt: "Enter Age ",
                          labelTxt: "Age",
                          myIcon: Icon(Icons.calendar_month),
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter age';
                            } else if (int.parse(value) > 100 ||
                                int.parse(value) < 6) {
                              return 'Enter valid age';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: profile_photo,
                          hintTxt: "Upload a photo",
                          labelTxt: "Photo",
                          myIcon: Icon(Icons.photo),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Upload Your photo';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myDropDown(
                          controller: drop,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 108, 159, 200),
                            onPrimary: Colors.white,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Add all required field')),
                              );
                            }
                            collectionReference.doc().set({
                              'Name': name.text,
                              'Mobile No': int.parse(phone.text),
                              'Age': int.parse(age.text),
                              "Photo": profile_photo.text,
                              'Department': drop.text
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Submited Data')),
                            );
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
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
                          textColor: Color.fromARGB(255, 243, 33, 114),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: myButton(
                            height: 50,
                            path: "/Second_Screen",
                            radius: 20,
                            text: "Second Screen",
                            width: 174,
                            backColor: Color.fromARGB(255, 202, 80, 137),
                            textColor: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
