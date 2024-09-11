import 'package:connections/mypahe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MYHOMEPAGE extends StatefulWidget {
  const MYHOMEPAGE({super.key});

  @override
  State<MYHOMEPAGE> createState() => _MYHOMEPAGEState();
}

class _MYHOMEPAGEState extends State<MYHOMEPAGE> {



  logout()async{
    FirebaseAuth.instance.signOut().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MYHome()));
    });


  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HOME PAGE"),
    );
  }
}