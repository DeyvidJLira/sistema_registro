import 'dart:io';

import 'package:sistema_registro/register_system_controller.dart';
import 'package:sistema_registro/view/base_view.dart';

class ListCompanyView extends BaseView {
  @override
  void render() {
    if (RegisterSystem.Instance.listEmpresas.isEmpty) {
      print("Não há nenhuma empresa cadastrada!");
    } else {
      stdout.writeAll(RegisterSystem.Instance.listEmpresas, "\n");
      print(
          "Total de empresas: ${RegisterSystem.Instance.listEmpresas.length}.");
    }
  }
}
