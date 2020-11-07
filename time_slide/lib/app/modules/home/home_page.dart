import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:time_slide/app/modules/model/slideModel.dart';
import 'package:time_slide/app/modules/utils/utils.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  TimeOfDay tempo;
  TextEditingController _editingController = TextEditingController();
  int duracaoTotal = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
              right: 30,
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Apresentação',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.black45,
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Tempo Máximo da Apresentação'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${tempo == null ? "00" : tempo.hour < 10 ? '0${tempo.hour}' : tempo.hour}:${tempo == null ? '00' : tempo.minute < 10 ? "0${tempo.minute}" : tempo.minute}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    FloatingActionButton(
                      heroTag: null,
                      backgroundColor: Colors.white,
                      mini: true,
                      child: Icon(
                        Icons.timelapse,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        tempo = await showTimePicker(
                          initialEntryMode: TimePickerEntryMode.input,
                          useRootNavigator: true,
                          context: context,
                          initialTime: TimeOfDay(hour: 0, minute: 0),
                        );
                        if (tempo != null) {
                          int segundos = tempo.minute * 60;
                          int segundos2 = tempo.hour * 3600;
                          totalSegundos = segundos + segundos2;
                          totalSegundoRegressivo = totalSegundos;

                          print(segundos);
                          print(totalSegundoRegressivo);
                        }

                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _globalKey,
                  child: TextFormField(
                    controller: _editingController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.green,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'Minutos de cada Slide',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      suffixIcon: FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        child: Icon(Icons.add),
                        onPressed: () {
                          if (tempo == null) {
                            var snak = SnackBar(
                              content:
                                  Text('Verifique o Tempo da Apresentação!'),
                              backgroundColor: Colors.red,
                            );
                            _key.currentState.showSnackBar(snak);
                          } else {
                            if (_globalKey.currentState.validate()) {
                              listarSlide.add(
                                SlideModel(
                                  minutos: int.parse(_editingController.text),
                                  totalSegundos:
                                      int.parse(_editingController.text) * 60,
                                ),
                              );
                              duracaoTotal +=
                                  int.parse(_editingController.text) * 60;
                              print(duracaoTotal);

                              setState(() {});
                              _editingController.clear();
                            }
                          }
                        },
                      ),
                    ),
                    validator: (x) {
                      if (x.isEmpty) {
                        return "Adicione os Minutos do Slide";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listarSlide.length,
                  itemBuilder: (_, i) {
                    return ListTile(
                      title: Text('Slide ${i + 1}'),
                      subtitle: Text(
                        'Minutos: ${listarSlide.elementAt(i).minutos}',
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          duracaoTotal -=
                              listarSlide.elementAt(i).totalSegundos;

                          listarSlide.remove(listarSlide.elementAt(i));
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Duração Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${Duration(seconds: duracaoTotal).toString().substring(0, 4)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Duration(minutes: tempo == null ? 0 : tempo.minute)
                                .inSeconds <
                            duracaoTotal
                        ? Colors.red
                        : Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  child: FloatingActionButton.extended(
                    icon: Icon(Icons.hourglass_bottom),
                    label: Text(
                      'Iniciar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      if (duracaoTotal > 0) {
                        Modular.to.pushReplacementNamed('/prepare');
                      } else {
                        var snak = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Adicione os Slides'),
                        );
                        _key.currentState.showSnackBar(snak);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
