import 'package:flutter/material.dart';

import 'package:appmex/services/userServices.dart';
import 'package:appmex/models/User.dart';
class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<User> data = [];
  // final List<User> data = <User>[];
 
  // @override
  // void initState (){
  //   super .initState ();
  //   _getUsers();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu page'),
      ),
      body: FutureBuilder(
      future: _getUsers(),
      builder:(context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
          } else {
            return Container(
                child: ListView.builder(                                                  
                  itemCount: data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(  
                        mainAxisSize: MainAxisSize.min,  
                        children: <Widget>[  
                          ListTile(
                            onTap: () async{
                              print(data[index].id);
                              await UserServices.saveId( data[index].id );
                              Navigator.pushNamed(context, 'edit');
                            },  
                            leading: Image.network(data[index].imgPath),  
                            title:  Text( '${ data[index].name} ${data[index].lastName}' ),  
                            subtitle: Text( data[index].email ),  
                          ),  
                        ],  
                      ),  
                    );                                       
                  }
                )
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, 'register');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Object> _getUsers() async {
    data = [];
    final response = await UserServices.getUser();
    for( var dataJson in response['msg']){
      data.add(User.fromJson(dataJson));
    }
    return data.toList();
  }
}