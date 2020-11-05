import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'tela_time_controller.g.dart';

@Injectable()
class TelaTimeController = _TelaTimeControllerBase with _$TelaTimeController;

abstract class _TelaTimeControllerBase with Store {}
