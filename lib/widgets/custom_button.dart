import 'package:flutter/material.dart';
import 'package:zoom_clone/utilis/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String leading;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed,this.leading = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(double.maxFinite, 50),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           leading.isNotEmpty ? Image.network(leading,width: 20,)
           : const SizedBox(),
            const SizedBox(width: 10,),
            Text(
              text,
              style: const TextStyle(fontSize: 17,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
