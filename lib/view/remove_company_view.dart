import 'package:sistema_registro/models/empresa_model.dart';
import 'package:sistema_registro/register_system_controller.dart';
import 'package:sistema_registro/util.dart';
import 'package:sistema_registro/view/base_view.dart';

class RemoveCompanyView extends BaseView {
  @override
  void render() {
    try {
      String id = input<String>("Informe o ID da empresa que deseja remover: ");
      if (id == "") {
        print("É necessário informar um ID.");
        return;
      }
      Empresa? empresa = RegisterSystem.Instance.getEmpresaByID(id);
      if (empresa != null) {
        print("\nDados da Empresa: ");
        print(empresa);
        bool option =
            input<bool>("Deseja realmente excluir essa empresa (s/n)? ");
        if (option) {
          RegisterSystem.Instance.deleteEmpresaByID(id);
          print("Empresa excluída com sucesso!");
        } else {
          print("Operação cancelada!");
        }
      } else {
        print("Empresa não encontrada!");
      }
    } catch (err) {
      print(
          "Operação falhou, verifique se os dados inseridos estão de acordo.");
    }
  }
}
