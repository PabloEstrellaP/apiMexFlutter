import 'package:appmex/pages/menu.dart';
import 'package:appmex/pages/register.dart';
import 'package:flutter/material.dart';

import 'package:appmex/pages/edit.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'menu'     : ( _ ) => MenuPage(),
  'edit'     : ( _ ) => EditPage(),
  'register' : ( _ ) => RegisterPage() 
};


