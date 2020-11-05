import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'time_preparacao_controller.g.dart';

@Injectable()
class TimePreparacaoController = _TimePreparacaoControllerBase
    with _$TimePreparacaoController;

abstract class _TimePreparacaoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
