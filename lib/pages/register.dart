import 'package:flutter/material.dart';

import 'package:appmex/widgets/Form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormUser()
                ],
              ),
            ),
          )),
      ),
    );
  }
}