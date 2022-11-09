import 'package:flutter/material.dart';
import 'package:pinehouse/Widgets/appBar_widget.dart';

class Third_Screen extends StatelessWidget {
  const Third_Screen(
      {super.key,
      required this.Name,
      required this.Age,
      required this.Mobile_no,
      required this.Department,
      required this.img});
  final String Name;
  final int Age;
  final String Mobile_no;
  final String Department;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "SCREEN3"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              Center(
                child: ClipRect(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              container(context, " Name : ${Name}"),
              container(context, " Age : ${Age}"),
              container(context, " Mobile no. : ${Mobile_no}"),
              container(context, "Department : ${Department} ")
            ],
          ),
        ),
      ),
    );
  }
}

Widget container(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(left: 10, top: 10),
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15)),
    child: Text(
      text,
      style: TextStyle(fontSize: 18),
    ),
  );
}
