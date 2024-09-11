import 'package:connections/mypahe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotpasswords extends StatefulWidget {
  const forgotpasswords({super.key});

  @override
  State<forgotpasswords> createState() => _forgotpasswordsState();
}

class _forgotpasswordsState extends State<forgotpasswords> {

  String email='';
  final _formkeyis=GlobalKey<FormState>();

  Forgotpasswordfun(String email)
 async {
  if(email=='')
  {
    UIHELPER.CustomAlertBox(context, 'Enter Correct Password');
  }
  else{
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  }
  

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('ForgotPassword'),
        
        
        ),

        body: Form(
          key: _formkeyis,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: ValueKey('password'),
              
              decoration: InputDecoration(
                hintText: 'Password'
              ),
             onSaved: (value) {
              setState(() {
                
                email=value!;
              });
               
             },
            ),
            ElevatedButton(
              
              onPressed: (){
               Forgotpasswordfun(email);
              }, child: const Text("forgotPAssword"))
          ],
        )),
      );
    
  }
}