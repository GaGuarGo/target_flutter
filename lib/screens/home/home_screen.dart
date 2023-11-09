import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/color_helper.dart';
import '../../stores/info.dart';
import 'components/delete_alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final colorHelper = ColorHelper();

  final controller = TextEditingController();
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Observer(builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                            itemCount: infoController.infoNotes.length,
                            itemBuilder: (_, index) => ListTile(
                                  title: Text(
                                    infoController.infoNotes[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.edit)),
                                      IconButton(
                                        onPressed: () async {
                                          final delete = await showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const DeleteAlert());

                                          if (delete == true) {
                                            infoController.removeInfo(
                                                infoController
                                                    .infoNotes[index]);
                                          }
                                        },
                                        icon: const Icon(Icons.delete),
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ))),
                  );
                }),
                TextFormField(
                  controller: controller,
                  onFieldSubmitted: (String text) {
                    infoController.addInfo();

                    controller.clear();
                  },

                  onChanged: infoController.onChanged,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Texto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.white)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  // );
                  // },
                ),
              ],
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
