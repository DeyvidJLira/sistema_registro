import 'dart:io';

String formatPhone(String phone) {
  return "(${phone.substring(0, 2)}) ${phone.substring(2, 3)} ${phone.substring(3, 7)}-${phone.substring(7)}";
}

String formatCEP(String cep) {
  return "${cep.substring(0, 2)}.${cep.substring(2, 5)}-${cep.substring(5)}";
}

String formatCPF(String cpf) {
  return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
}

String formatCNPJ(String cnpj) {
  return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}";
}

void pressEnterToContinue() {
  print("Pressione enter para continuar...");
  stdin.readLineSync();
}

T input<T>(String description) {
  stdout.write(description);
  dynamic data;
  switch (T) {
    case String:
      data = stdin.readLineSync()!;
      break;
    case int:
      data = int.tryParse(stdin.readLineSync()!);
      data ??= -1;
      break;
    case double:
      data = double.parse(stdin.readLineSync()!);
      break;
    case bool:
      data = stdin.readLineSync()!.toLowerCase() == 's';
      break;
    default:
      data = "";
  }
  return data;
}

void clear() {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

bool validateCPF(String cpf) {
  RegExp regExp = RegExp("([0-9]{11})");
  return regExp.hasMatch(cpf);
}

bool validateCNPJ(String cnpj) {
  RegExp regExp = RegExp("([0-9]{14})");
  return regExp.hasMatch(cnpj);
}

bool validateTelefone(String telefone) {
  RegExp regExp = RegExp("([0-9]{11})");
  return regExp.hasMatch(telefone);
}

bool validateCEP(String cnpj) {
  RegExp regExp = RegExp("([0-9]{8})");
  return regExp.hasMatch(cnpj);
}

bool validateFullCPF(String cpf) {
  RegExp regExp = RegExp("[0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2}");
  return regExp.hasMatch(cpf);
}

bool validateFullCNPJ(String cnpj) {
  RegExp regExp =
      RegExp("[0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2}");
  return regExp.hasMatch(cnpj);
}

String removeCharacters(String text) {
  RegExp regExp = RegExp("[./-]");
  return text.replaceAll(regExp, "");
}
