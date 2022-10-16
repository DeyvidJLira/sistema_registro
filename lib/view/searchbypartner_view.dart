import 'package:sistema_registro/register_system_controller.dart';
import 'package:sistema_registro/util.dart';
import 'package:sistema_registro/view/base_view.dart';

class SearchByPartnerView extends BaseView {
  @override
  void render() {
    String documento = input<String>("Informe o CPF/CNPJ do sócio: ");
    if (documento != "") {
      if (!validateFullCPF(documento) && !validateFullCNPJ(documento)) {
        print("Digite um CPF/CNPJ válido!");
        return;
      }
      final empresa = RegisterSystem.Instance.getEmpresaBySocioDocumento(
          removeCharacters(documento));
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
