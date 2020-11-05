import 'finalizar_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'finalizar_page.dart';

class FinalizarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $FinalizarController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => FinalizarPage()),
      ];

  static Inject get to => Inject<FinalizarModule>.of();
}
