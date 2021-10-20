import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:appmex/global/environment.dart';

class UserServices {
  

  static Future addUser( Object data ) async {
    try{
      
      final addUser = getPath( '/' );
      print(data);
      final session = await http.post( addUser, 
        body: data
      );
      final body = jsonDecode(session.body);
      return body;
      
    }
    catch( error ){
      print( error );
      return null;
    }
  }

  static Future getUser( ) async {
    try{
      
      final getUser = getPath( '/1' );
      final session = await http.get( getUser, 
      );
      final body = jsonDecode(session.body);
      return body;
      
    }
    catch( error ){
      print( error );
      return null;
    }
  }

  static Future getUserById( ) async {
    try{
      
      final getUser = getPath( '/byId/' + await getId() );
      final session = await http.get( getUser, 
      );
      final body = jsonDecode(session.body);
      return body;
      
    }
    catch( error ){
      print( error );
      return null;
    }
  }

  static Future deleteUser( ) async {
    try{
      
      final deleteUser = getPath( '/' + await getId() );
      final session = await http.delete( deleteUser, 
      );
      final body = jsonDecode(session.body);
      return body;
      
    }
    catch( error ){
      print( error );
      return null;
    }
  }

  static Future editUser( Object data ) async {
    try{
      
      final editUser = getPath( '/' );
      print(data);
      final session = await http.put( editUser, 
        body: data
      );
      final body = jsonDecode(session.body);
      return body;
      
    }
    catch( error ){
      print( error );
      return null;
    }
  }

  static getPath( pathService ){
    return Uri(
        scheme: Environment.scheme,
        // host: ' http://192.168.1.73:8080/',
        host: Environment.host,
        port: 3001,
        path: '/user' + pathService,
      );
  }

  static Future saveId( id ) async {
    final _storage = FlutterSecureStorage();
    print(id);
    return await _storage.write(key: 'id', value: id);
  }
  
  static Future getId() async {
    final _storage = FlutterSecureStorage();
    final id = await _storage.read(key: 'id');
    return id == null ? '' : id;
  }

}