import 'package:time_slide/app/modules/finalizar/finalizar_controller.dart';
import 'package:time_slide/app/modules/finalizar/finalizar_page.dart';
import 'package:time_slide/app/modules/telaTime/tela_time_controller.dart';
import 'package:time_slide/app/modules/telaTime/tela_time_page.dart';
import 'package:time_slide/app/modules/timePreparacao/time_preparacao_controller.dart';
import 'package:time_slide/app/modules/timePreparacao/time_preparacao_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:time_slide/app/app_widget.dart';
import 'package:time_slide/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        $TelaTimeController,
        $TimePreparacaoController,
        $FinalizarController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(
          '/telaTime',
          child: (_, args) => TelaTimePage(),
          transition: TransitionType.downToUp,
        ),
        ModularRouter(
          '/prepare',
          child: (_, args) => TimePreparacaoPage(),
          transition: TransitionType.downToUp,
        ),
        ModularRouter(
          '/finalizar',
          child: (_, args) => FinalizarPage(),
          transition: TransitionType.downToUp,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
