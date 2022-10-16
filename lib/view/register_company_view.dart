import 'package:sistema_registro/models/empresa_model.dart';
import 'package:sistema_registro/models/endereco_model.dart';
import 'package:sistema_registro/models/pessoa_model.dart';
import 'package:sistema_registro/register_system_controller.dart';
import 'package:sistema_registro/strings.dart';
import 'package:sistema_registro/util.dart';
import 'package:sistema_registro/view/base_view.dart';

class RegisterCompanyView extends BaseView {
  Map<String, dynamic> formData = {
    FIELD_CNPJ: "",
    FIELD_RAZAO_SOCIAL: "",
    FIELD_NOME_FANTASIA: "",
    FIELD_TELEFONE: "",
    FIELD_LOGRADOURO: "",
    FIELD_NUMERO: "",
    FIELD_COMPLEMENTO: "",
    FIELD_BAIRRO: "",
    FIELD_CIDADE: "",
    FIELD_UF: "",
    FIELD_CEP: "",
  };

  Map<String, dynamic> formDataSocioPF = {
    FIELD_CPF: "",
    FIELD_NOME_COMPLETO: "",
    FIELD_LOGRADOURO: "",
    FIELD_NUMERO: "",
    FIELD_COMPLEMENTO: "",
    FIELD_BAIRRO: "",
    FIELD_CIDADE: "",
    FIELD_UF: "",
    FIELD_CEP: "",
  };

  Map<String, dynamic> formDataSocioPJ = {
    FIELD_CNPJ: "",
    FIELD_RAZAO_SOCIAL: "",
    FIELD_NOME_FANTASIA: "",
    FIELD_LOGRADOURO: "",
    FIELD_NUMERO: "",
    FIELD_COMPLEMENTO: "",
    FIELD_BAIRRO: "",
    FIELD_CIDADE: "",
    FIELD_UF: "",
    FIELD_CEP: "",
  };

  @override
  void render() {
    try {
      bool option;
      while (true) {
        print("\nInforme os dados da empresa!");
        for (var key in formData.keys) {
          formData[key] = input<String>("$key: ");
        }
        Empresa novaEmpresa = Empresa(
          razaoSocial: formData[FIELD_RAZAO_SOCIAL],
          nomeFantasia: formData[FIELD_NOME_FANTASIA],
          cnpj: formData[FIELD_CNPJ],
          endereco: Endereco(
            logradouro: formData[FIELD_LOGRADOURO],
            numero: formData[FIELD_NUMERO],
            complemento: formData[FIELD_COMPLEMENTO],
            bairro: formData[FIELD_BAIRRO],
            cidade: formData[FIELD_CIDADE],
            uf: formData[FIELD_UF],
            cep: formData[FIELD_CEP],
          ),
          telefone: formData[FIELD_TELEFONE],
          socio: null,
        );
        String answer = input<String>("O sócio dessa empresa é PF ou PJ? ");
        if (answer.toLowerCase() == 'pf') {
          for (var key in formDataSocioPF.keys) {
            formDataSocioPF[key] = input<String>("$key: ");
          }
          novaEmpresa.socio = PessoaFisica(
              nomeCompleto: formDataSocioPF[FIELD_NOME_COMPLETO],
              documento: formDataSocioPF[FIELD_CPF],
              endereco: Endereco(
                logradouro: formDataSocioPF[FIELD_LOGRADOURO],
                numero: formDataSocioPF[FIELD_NUMERO],
                complemento: formDataSocioPF[FIELD_COMPLEMENTO],
                bairro: formDataSocioPF[FIELD_BAIRRO],
                cidade: formDataSocioPF[FIELD_CIDADE],
                uf: formDataSocioPF[FIELD_UF],
                cep: formDataSocioPF[FIELD_CEP],
              ));
        } else {
          for (var key in formDataSocioPJ.keys) {
            formDataSocioPJ[key] = input<String>("$key: ");
          }
          novaEmpresa.socio = PessoaJuridica(
              razaoSocial: formDataSocioPJ[FIELD_RAZAO_SOCIAL],
              nomeFantasia: formDataSocioPJ[FIELD_NOME_FANTASIA],
              documento: formDataSocioPJ[FIELD_CNPJ],
              endereco: Endereco(
                logradouro: formDataSocioPJ[FIELD_LOGRADOURO],
                numero: formDataSocioPJ[FIELD_NUMERO],
                complemento: formDataSocioPJ[FIELD_COMPLEMENTO],
                bairro: formDataSocioPJ[FIELD_BAIRRO],
                cidade: formDataSocioPJ[FIELD_CIDADE],
                uf: formDataSocioPJ[FIELD_UF],
                cep: formDataSocioPJ[FIELD_CEP],
              ));
        }
        if (novaEmpresa.validate()) {
          RegisterSystem.Instance.addEmpresa(novaEmpresa);
          print("Empresa cadastrada com sucesso!");
        } else {
          print(
              "Há dados inválidos, confira as informações de CPF, CNPJ e CEP.");
          print("Operação não realizada!");
        }

        option = input<bool>("Deseja continuar cadastrando (s/n)? ");
        if (!option) break;
      }
    } catch (err) {
      print(
          "Operação falhou, verifique se os dados inseridos estão de acordo.");
    }
  }
}
