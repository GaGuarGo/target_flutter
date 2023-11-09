import 'package:flutter/material.dart';
import 'package:target_flutter/helpers/color_helper.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.onPressed});

  final VoidCallback onPressed;
  final colorHelper = ColorHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: colorHelper.greenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32))),
          child: const Text(
            'Entrar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
