import 'package:flutter/material.dart';

class ButtonRegister extends StatelessWidget {
  final String title;
  final bool isLogin;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const ButtonRegister({
    Key? key,
    required this.title,
    required this.isLogin,
    required this.color,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left: 30, right: 30),
      child: MaterialButton(
        splashColor: Colors.transparent,
        minWidth: double.infinity,
        height: 40,
        color: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        onPressed: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon( this.icon, color: Colors.white,),
            Text( this.title, style: TextStyle( color: Colors.white, fontSize: 17 ),)
          ],
        ),
      ),
    );
  }
}