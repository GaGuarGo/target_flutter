import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'info.g.dart';

class Info = InfoBase with _$Info;

abstract class InfoBase with Store {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<String>?> getInfoList() async {
    final SharedPreferences prefs = await _prefs;
    infoNotes =
        ObservableList.of(prefs.getStringList('infoList') as Iterable<String>);

    return infoNotes;
  }

  @action
  Future<void> addInfo() async {
    if (isValid) {
      infoNotes.add(text!);
      final SharedPreferences prefs = await _prefs;
      prefs.setStringList('infoList', infoNotes);
    }
  }

  @action
  Future<void> removeInfo(String info) async {
    infoNotes.remove(info);
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList('infoList', infoNotes);
  }

  @observable
  ObservableList<String> infoNotes = ObservableList<String>();

  @observable
  String? text;

  @computed
  bool get isValid => text!.isNotEmpty;

  @action
  String onChanged(String text) {
    this.text = text;
    return this.text!;
  }
}
