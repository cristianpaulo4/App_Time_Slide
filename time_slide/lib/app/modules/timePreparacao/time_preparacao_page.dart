import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'time_preparacao_controller.dart';

class TimePreparacaoPage extends StatefulWidget {
  final String title;
  const TimePreparacaoPage({Key key, this.title = "TimePreparacao"})
      : super(key: key);

  @override
  _TimePreparacaoPageState createState() => _TimePreparacaoPageState();
}

class _TimePreparacaoPageState
    extends ModularState<TimePreparacaoPage, TimePreparacaoController> {
  int _cont = 5;

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      (x) {
        if (_cont > 0 && _cont <= 5) {
          _cont--;
          setState(() {});
        }

        if (_cont == 0) {
          _cont = 10;

          Modular.to.pushReplacementNamed('telaTime');
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            "$_cont",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 150,
              color: Colors.green,
            ),
            key: ValueKey<int>(_cont),
          ),
        ),
      ),
    );
  }
}
