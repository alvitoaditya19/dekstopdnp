import 'package:dekstopdnp/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomServiceButton extends StatelessWidget {
  final String imageUrl;
  final String buttonText;
  Color? buttonColor;
  final Function() onPressed;

  CustomServiceButton({
     this.buttonColor,
    required this.imageUrl,

    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor ?? blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.width * 0.23,
              width: MediaQuery.of(context).size.width * 0.23,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 40
              )
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
