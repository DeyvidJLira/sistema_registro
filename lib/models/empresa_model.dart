import 'package:sistema_registro/models/endereco_model.dart';
import 'package:sistema_registro/models/pessoa_model.dart';
import 'package:sistema_registro/util.dart';
import 'package:uuid/uuid.dart';

class Empresa {
  final String id = Uuid().v4();
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  Endereco endereco;
  String telefone;
  late DateTime dataCriacao;
  Pessoa? socio;

  Empresa(
      {required this.razaoSocial,
      required this.nomeFantasia,
      required this.cnpj,
      required this.endereco,
      required this.telefone,
      required this.socio}) {
    dataCriacao = DateTime.now();
  }

  bool validate() =>
      validateCNPJ(cnpj) &&
      validateTelefone(telefone) &&
      validateCEP(endereco.cep) &&
      socio!.validate();

  @override
  String toString() {
    return """
ID: $id
CNPJ: ${formatCNPJ(cnpj)} Data Cadastro: $dataCriacao
Razão Social: $razaoSocial
Nome Fantasia: $nomeFantasia
Telefone: ${formatPhone(telefone)}
Endereço: $endereco
Sócio:
$socio
""";
  }
}
