import 'package:appmex/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:appmex/services/userServices.dart';
import 'package:appmex/widgets/ButtonRegister.dart';
import 'package:appmex/widgets/CustomInput.dart';

import 'package:appmex/models/User.dart';

class FormEdit extends StatefulWidget {
  FormEdit({Key? key}) : super(key: key);

  @override
  _FormEditState createState() => _FormEditState();
}

class _FormEditState extends State<FormEdit> {
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final URLCtrl = TextEditingController();

  late User data; 

  @override
  void initState (){
    super .initState ();
    _getUserById();
  }
  
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
            title: ' Editar', 
            isLogin: true,
            color: Colors.green,
            icon: Icons.edit,
            onPressed: () async{
              await _editUser();
            },
          ),
          ButtonRegister(
            title: ' Borrar', 
            isLogin: true,
            color: Colors.blue,
            icon: Icons.delete,
            onPressed: () async{
              await _deleteUser();
            },
          ),
        ],
      ),
    );
  }
  Future<void> _getUserById() async {
    
    final response = await UserServices.getUserById();
    data = User.fromJson(response['msg']);
    emailCtrl.text = data.email;
    nameCtrl.text = data.name;
    lastNameCtrl.text = data.lastName;
    URLCtrl.text = data.imgPath;
  }
  _deleteUser () async {
    final response = await UserServices.deleteUser();
    if( response['ok'] ){
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: ( _, __, ___ ) => MenuPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    }
  }

  _editUser () async {

    final body = { 
        "name" : nameCtrl.text, 
        "lastName" : lastNameCtrl.text, 
        "email" : emailCtrl.text, 
        "imgPath" : URLCtrl.text, 
        "idAdmin" : "1",
        "_id" : await UserServices.getId()
    }; 

    final response = await UserServices.editUser( body );
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