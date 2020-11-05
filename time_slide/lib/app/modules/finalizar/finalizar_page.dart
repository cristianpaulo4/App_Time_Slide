import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:time_slide/app/modules/utils/utils.dart';
import 'finalizar_controller.dart';

class FinalizarPage extends StatefulWidget {
  final String title;
  const FinalizarPage({Key key, this.title = "Finalizar"}) : super(key: key);

  @override
  _FinalizarPageState createState() => _FinalizarPageState();
}

class _FinalizarPageState
    extends ModularState<FinalizarPage, FinalizarController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Apresentação Finalizada!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(
              backgroundColor: Colors.green.shade900,
              icon: Icon(Icons.arrow_back),
              label: Text(
                'Continuar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                listarSlide.clear();
                Modular.to.pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
    );
  }
}
