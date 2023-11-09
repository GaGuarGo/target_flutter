import 'package:flutter/material.dart';

class DeleteAlert extends StatelessWidget {
  const DeleteAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Você Deseja Excluir?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text(
              "Excluir",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
