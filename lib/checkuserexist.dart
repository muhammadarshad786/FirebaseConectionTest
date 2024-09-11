import 'package:connections/homepage.dart';
import 'package:connections/mypahe.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CheckuserExist extends StatefulWidget {
  const CheckuserExist({super.key});

  @override
  State<CheckuserExist> createState() => _CheckuserExistState();
}

class _CheckuserExistState extends State<CheckuserExist> {
  @override
  Widget build(BuildContext context) {
    return Checkuser();
  }

  Checkuser()
  async{

    final user=FirebaseAuth.instance.currentUser;

    if(user!=null)
    {
      Navigator.push(context,MaterialPageRoute(builder: (context)=>MYHOMEPAGE())); 

    }
    else{
       Navigator.push(context,MaterialPageRoute(builder: (context)=>MYHome()));
    }

  }
}