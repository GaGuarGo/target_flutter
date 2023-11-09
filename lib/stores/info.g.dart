// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Info on InfoBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'InfoBase.isValid'))
      .value;

  late final _$infoNotesAtom =
      Atom(name: 'InfoBase.infoNotes', context: context);

  @override
  ObservableList<String> get infoNotes {
    _$infoNotesAtom.reportRead();
    return super.infoNotes;
  }

  @override
  set infoNotes(ObservableList<String> value) {
    _$infoNotesAtom.reportWrite(value, super.infoNotes, () {
      super.infoNotes = value;
    });
  }

  late final _$textAtom = Atom(name: 'InfoBase.text', context: context);

  @override
  String? get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String? value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$addInfoAsyncAction =
      AsyncAction('InfoBase.addInfo', context: context);

  @override
  Future<void> addInfo() {
    return _$addInfoAsyncAction.run(() => super.addInfo());
  }

  late final _$removeInfoAsyncAction =
      AsyncAction('InfoBase.removeInfo', context: context);

  @override
  Future<void> removeInfo(String info) {
    return _$removeInfoAsyncAction.run(() => super.removeInfo(info));
  }

  late final _$InfoBaseActionController =
      ActionController(name: 'InfoBase', context: context);

  @override
  String onChanged(String text) {
    final _$actionInfo =
        _$InfoBaseActionController.startAction(name: 'InfoBase.onChanged');
    try {
      return super.onChanged(text);
    } finally {
      _$InfoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infoNotes: ${infoNotes},
text: ${text},
isValid: ${isValid}
    ''';
  }
}
