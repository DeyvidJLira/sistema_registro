import 'package:sistema_registro/util.dart';

class Endereco {
  String logradouro;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String uf;
  String cep;

  Endereco(
      {required this.logradouro,
      required this.numero,
      this.complemento = "",
      required this.bairro,
      required this.uf,
      required this.cidade,
      required this.cep});

  @override
  String toString() {
    return """
$logradouro, $numero${complemento.isNotEmpty ? ', $complemento' : ''}, $bairro, $cidade/$uf, ${formatCEP(cep)}""";
  }
}
