import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_flutter/helpers/color_helper.dart';
import 'package:target_flutter/screens/login/components/login_button.dart';
import 'package:target_flutter/screens/login/components/login_text_field.dart';
import 'package:target_flutter/screens/login/components/textField_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../stores/info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final colorHelper = ColorHelper();

  final _formKey = GlobalKey<FormState>();

  final _textFieldController = TextFieldController();
  final infoController = Info();

  @override
  void initState() {
    super.initState();
    infoController.getInfoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colorHelper.primaryColor, colorHelper.secondColor],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginTextField(
                    label: 'Usuário',
                    icon: Icons.person,
                    validator: _textFieldController.onChangedUser,
                  ),
                  const SizedBox(height: 16),
                  LoginTextField(
                    label: 'Senha',
                    icon: CupertinoIcons.lock_fill,
                    isObscure: true,
                    validator: _textFieldController.onChangedPassword,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          _textFieldController.normalCharacters)
                    ],
                  ),
                  LoginButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (kDebugMode) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 32),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _launchUrl,
                child: const Text(
                  'Política de Privacidade',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _url = Uri.parse('https://www.google.com.br/');
}
