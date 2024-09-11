//import 'package:firebase_core/firebase_core.dart';
import 'package:connections/HOME.dart';
import 'package:connections/forgetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MYHome extends StatefulWidget {
  const MYHome({super.key});

  @override
  State<MYHome> createState() => _MYHomeState();
}

class _MYHomeState extends State<MYHome> {
  final _formkey=GlobalKey<FormState>();
  bool isLogin=false;
  String username='';
  String passwords='';
   String passEmail='';
  TextEditingController PasswordController= TextEditingController();
  TextEditingController EmailController= TextEditingController();

  sinup(String email,String password)
  async{
if(email==""  && password=="")
{
    UIHELPER.CustomAlertBox(context, "Enter Required Field");

}
else{
  UserCredential ? userCredential;

  try{
    userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MYPAGE()));
    });
  }
  on FirebaseAuthException catch(ex){

    return UIHELPER.CustomAlertBox(context, ex.code.toString());

  }

}
  }
    login(String email,String password)
  async{
if(email==""  && password=="")
{
    UIHELPER.CustomAlertBox(context, "Enter Required Field");

}
else{
  UserCredential ? userCredential;

  try{
    userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) 
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MYPAGE()));
    });
  }
  on FirebaseAuthException catch(ex){

    return UIHELPER.CustomAlertBox(context, ex.code.toString());

  }

}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HELOOOOOO'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: 90,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20) ),
            gradient: LinearGradient(
              colors: [Colors.red,Colors.pink],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
          ),
        ),

        
      ),

      body:  Form(
        key:_formkey,
          child:Container(
            margin: EdgeInsets.all(20),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
               !isLogin? TextFormField(
                 // obscureText: true,
                  key: ValueKey('Username'),
                  decoration: const InputDecoration(
                    hintText: 'Enter Username',
                  ),
                  validator: (value)
                  {
                    if(value.toString().length<3)
                    {return 'Username is So Small';}
                    else
                    {
                      return null;
                    }
                  },
                  // onSaved: (value){
                  //   setState(() {
                  //     username=value!;
                  //   });
                  // } ,
                ):Container(),
                TextFormField(
                  controller: EmailController,
                  
                  key: ValueKey('Email'),
                  decoration: const InputDecoration(
                    
            
                    hintText: 'Enter Email',
                    
                  ),
                   validator: (value)
                  {
                    if(!(value.toString().contains('@')))
                    {return 'Invalid Email';}
                    else
                    {
                      return null;
                    }
                  },
                  // onSaved: (value){
                  //   setState(() {
                  //     passEmail=value!;
                  //   });
                  // } ,

                ),

                TextFormField(
                  obscureText: true,
                controller: PasswordController,
                  key: ValueKey('Password'),
                  decoration: const InputDecoration(
            
                    hintText: 'Enter Password',
                    
                  ),
                    validator: (value)
                  {
                    if(value.toString().length<3)
                    {return 'Password is So Small';}
                    else
                    {
                      return null;
                    }
                  },
                  // onSaved: (value){
                  //   setState(() {
                  //     passwords=value!;
                  //   });
                  // } ,
                ),
               SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    if (_formkey.currentState!.validate()) 
                    {
                      _formkey.currentState!.save();
                     isLogin? login(EmailController.text.toString(), PasswordController.text.toString()) : sinup(EmailController.text.toString(),  PasswordController.text.toString());
                    }
                    
                  
                  }, child:isLogin? const Text('Login'): const Text('Sinup')),
                ),
                 SizedBox(height: 10,),
                 TextButton(onPressed: (){
                    setState(() {
                      isLogin=!isLogin;
                    });
                 }, child: isLogin?  const Text("Don't have an Account ? Sinup"): const Text('Already Sinup ? Just login'))
            ,SizedBox(height: 20,),
            
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotpasswords()));
            }, child:const  Text("ForgotPassword"))

            ]
            
            ),
          ),
         
         
        
      ),
    );
  }
}


class UIHELPER
{



  static CustomAlertBox(BuildContext context,String text)
  {
    return showDialog(context: context, builder: (BuildContext context) 

    {
  return AlertDialog
  (
      title: Text(text),   
      
       );
    }
    );
    
    
  
  }


}