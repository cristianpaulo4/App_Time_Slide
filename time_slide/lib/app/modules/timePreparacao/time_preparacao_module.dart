import 'time_preparacao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'time_preparacao_page.dart';

class TimePreparacaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TimePreparacaoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => TimePreparacaoPage()),
      ];

  static Inject get to => Inject<TimePreparacaoModule>.of();
}
