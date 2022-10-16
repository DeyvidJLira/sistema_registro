import 'package:sistema_registro/register_system_controller.dart';
import 'package:sistema_registro/util.dart';
import 'package:sistema_registro/view/base_view.dart';

class SearchByCNPJView extends BaseView {
  @override
  void render() {
    String cnpj = input<String>("Informe o CNPJ: ");
    if (cnpj != "") {
      if (!validateFullCNPJ(cnpj)) {
        print("Digite um CNPJ válido!");
        return;
      }
      final empresa = RegisterSystem.Instance.getEmpresaByCNPJ(cnpj);
      if (empresa != null) {
        print(empresa);
      } else {
        print("Empresa não encontrada!");
      }
    } else {
      print("É necessário informar um CNPJ");
    }
  }
}
