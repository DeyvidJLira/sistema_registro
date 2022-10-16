import 'package:sistema_registro/models/endereco_model.dart';
import 'package:sistema_registro/util.dart';

abstract class Pessoa {
  String documento;
  Endereco endereco;

  get nome => "";

  Pessoa({required this.documento, required this.endereco});

  bool validate();
}

class PessoaFisica extends Pessoa {
  String nomeCompleto;

  @override
  get nome => nomeCompleto;

  PessoaFisica(
      {required this.nomeCompleto,
      required String documento,
      required Endereco endereco})
      : super(documento: documento, endereco: endereco);

  @override
  bool validate() => validateCPF(documento) && validateCEP(endereco.cep);

  @override
  String toString() {
    return """
CPF: ${formatCPF(documento)}
Nome Completo: $nome
Endereço: $endereco""";
  }
}

class PessoaJuridica extends Pessoa {
  String razaoSocial;
  String nomeFantasia;

  @override
  get nome => razaoSocial;

  PessoaJuridica(
      {required this.razaoSocial,
      required this.nomeFantasia,
      required String documento,
      required Endereco endereco})
      : super(documento: documento, endereco: endereco);

  @override
  bool validate() => validateCNPJ(documento) && validateCEP(endereco.cep);

  @override
  String toString() {
    return """
CNPJ: ${formatCNPJ(documento)}
Razão Social: $razaoSocial
Nome Fantasia: $nomeFantasia
Endereço: $endereco
""";
  }
}
