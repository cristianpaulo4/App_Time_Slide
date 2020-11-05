import 'tela_time_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'tela_time_page.dart';

class TelaTimeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TelaTimeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TelaTimePage()),
      ];

  static Inject get to => Inject<TelaTimeModule>.of();
}
