// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_preparacao_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TimePreparacaoController = BindInject(
  (i) => TimePreparacaoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimePreparacaoController on _TimePreparacaoControllerBase, Store {
  final _$valueAtom = Atom(name: '_TimePreparacaoControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_TimePreparacaoControllerBaseActionController =
      ActionController(name: '_TimePreparacaoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_TimePreparacaoControllerBaseActionController
        .startAction(name: '_TimePreparacaoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_TimePreparacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
