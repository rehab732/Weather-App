import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const MainButton(
      {Key? key, required, required this.text, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE80F88),
         
        ),
        child: Text(
          text,
          style:const TextStyle(color: Color(0xFFE5E5E5)),
        ),
      ),
    );
  }
}
