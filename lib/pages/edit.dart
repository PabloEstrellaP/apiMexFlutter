import 'package:appmex/widgets/FormEdit.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar'),
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
                  FormEdit()
                ],
              ),
            ),
          )),
      ),
    );
  }
}