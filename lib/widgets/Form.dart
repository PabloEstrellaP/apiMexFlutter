import 'dart:math';

import 'package:flutter/material.dart';
import 'package:appmex/services/userServices.dart';
import 'package:appmex/widgets/ButtonRegister.dart';
import 'package:appmex/widgets/CustomInput.dart';

import 'package:appmex/pages/menu.dart';


class FormUser extends StatefulWidget {  
  FormUser({ Key? key }) : super(key: key);

  @override
  _FormUserState createState() => _FormUserState( );
}

class _FormUserState extends State<FormUser> {
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final URLCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top: 40 ),
      padding: EdgeInsets.symmetric( horizontal: 10),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.email, 
            placeholder: 'Correo', 
            textController: emailCtrl,
            keyBoardType: TextInputType.emailAddress,  
          ),
          CustomInput(
            icon: Icons.person, 
            placeholder: 'Nombre', 
            textController: nameCtrl,  
          ),
          CustomInput(
            icon: Icons.person_outline_rounded, 
            placeholder: 'Apellido', 
            textController: lastNameCtrl,  
          ),
          CustomInput(
            icon: Icons.image, 
            placeholder: 'URL', 
            textController: URLCtrl,
            isBlock: false,
          ),
          SizedBox(
            height: 20,
          ),
          ButtonRegister(
            title: ' Registrar', 
            isLogin: true,
            color: Colors.red,
            icon: Icons.person_add,
            onPressed: _addUser,
          ),
        ],
      ),
    );
  }

  _addUser () async {
    final rng = new Random();
    String number = rng.nextInt(50).toString();
    print(number);
    final body = { 
        "name" : nameCtrl.text, 
        "lastName" : lastNameCtrl.text, 
        "email" : emailCtrl.text, 
        "imgPath" : "https://randomuser.me/api/portraits/women/${number}.jpg", 
        "idAdmin" : "1" 
    }; 

    final response = await UserServices.addUser( body );
    if( response['ok']){
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: ( _, __, ___ ) => MenuPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    }
  }
}