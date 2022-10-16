// ignore_for_file: non_constant_identifier_names

import 'package:sistema_registro/models/empresa_model.dart';
import 'package:sistema_registro/models/endereco_model.dart';
import 'package:sistema_registro/models/pessoa_model.dart';

class RegisterSystem {
  static final RegisterSystem _instance = RegisterSystem();

  static RegisterSystem get Instance => _instance;

  List<Empresa> listEmpresas = [];

  void mock() {
    Empresa empresa1 = Empresa(
        razaoSocial: "Elisa e Flávia Pães e Doces ME",
        nomeFantasia: "Pães e Doces",
        cnpj: "11941838000104",
        endereco: Endereco(
            logradouro: "Rua Três",
            numero: "338",
            bairro: "Vila Industrial",
            cidade: "Piracicaba",
            uf: "SP",
            cep: "13412233"),
        telefone: "19988380630",
        socio: PessoaFisica(
            nomeCompleto: "Mirella Kamilly Letícia Barbosa",
            documento: "76367980008",
            endereco: Endereco(
                cep: "74935870",
                logradouro: "Rua Ulisses Bueno",
                numero: "175",
                bairro: "Vila Rosa",
                cidade: "Aparecida de Goiânia",
                uf: "GO")));
    Empresa empresa2 = Empresa(
        razaoSocial: "Arthur e Andreia Telas Ltda",
        nomeFantasia: "Telas",
        cnpj: "92456516000163 ",
        endereco: Endereco(
            logradouro: "Rua Domingos Vendemiati",
            numero: "154",
            bairro: "Parque Recanto do Parrilho",
            cidade: "Jundiaí",
            uf: "SP",
            cep: "13219051"),
        telefone: "11995726906",
        socio: PessoaJuridica(
            razaoSocial: "Lavínia e Tereza Locações de Automóveis Ltda",
            nomeFantasia: "Loc. Auto",
            documento: "87009263000140",
            endereco: Endereco(
                logradouro: "Rua Ângelo Alberto Nesti",
                numero: "639",
                bairro: "Bussocaba",
                cidade: "Osasco",
                uf: "SP",
                cep: "06053060")));
    listEmpresas.add(empresa1);
    listEmpresas.add(empresa2);
  }

  void addEmpresa(Empresa empresa) {
    listEmpresas.add(empresa);
  }

  Empresa? getEmpresaByID(String id) {
    try {
      Empresa empresa = listEmpresas.firstWhere((element) => element.id == id);
      return empresa;
    } catch (err) {
      return null;
    }
  }

  Empresa? getEmpresaByCNPJ(String cnpj) {
    try {
      Empresa empresa =
          listEmpresas.firstWhere((element) => element.cnpj == cnpj);
      return empresa;
    } catch (err) {
      return null;
    }
  }

  Empresa? getEmpresaBySocioDocumento(String documento) {
    try {
      Empresa empresa = listEmpresas
          .firstWhere((element) => element.socio!.documento == documento);
      return empresa;
    } catch (err) {
      return null;
    }
  }

  void deleteEmpresaByID(String id) {
    try {
      listEmpresas.removeWhere((element) => element.id == id);
    } catch (err) {
      print("Operação falhou!");
    }
  }

  List<Empresa> getListAtoZ() {
    final lista = listEmpresas;
    lista.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
    return lista;
  }
}
