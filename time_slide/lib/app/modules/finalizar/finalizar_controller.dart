import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'finalizar_controller.g.dart';

@Injectable()
class FinalizarController = _FinalizarControllerBase with _$FinalizarController;

abstract class _FinalizarControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
