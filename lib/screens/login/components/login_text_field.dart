import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isObscure;
  final String? Function(String?) validator;
  final List<TextInputFormatter> formatters;
  const LoginTextField(
      {super.key,
      required this.label,
      required this.icon,
      this.isObscure = false,
      required this.validator,
      this.formatters = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          obscureText: isObscure,
          validator: validator,
          maxLength: 20,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.black),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
          inputFormatters: formatters,
        ),
      ],
    );
  }
}
