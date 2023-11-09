// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFieldController {
  final RegExp normalCharacters = RegExp(r'[a-zA-Z0-9]');

  String? onChangedUser(String? text) {
    if (text!.isEmpty) {
      return 'Insira algo';
    } else if (text.characters.last == ' ') {
      return 'O último caractere não pode ser espaço';
    } else {
      return null;
    }
  }

  String? onChangedPassword(String? text) {
    if (text!.isEmpty || text.length < 2) {
      return 'Insira algo mais forte';
    } else if (text.characters.last == ' ') {
      return 'O último caractere não pode ser espaço';
    } else {
      return null;
    }
  }
}
