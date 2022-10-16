import 'dart:io';

import 'package:sistema_registro/register_system_controller.dart';
import 'package:sistema_registro/util.dart';
import 'package:sistema_registro/view/base_view.dart';
import 'package:sistema_registro/view/list_company_view.dart';
import 'package:sistema_registro/view/register_company_view.dart';
import 'package:sistema_registro/view/remove_company_view.dart';
import 'package:sistema_registro/view/searchbycnpj_view.dart';
import 'package:sistema_registro/view/searchbypartner_view.dart';

class HomeView extends BaseView {
  @override
  void render() {
    RegisterSystem.Instance.mock();
    while (true) {
      drawTitle();
      print("1 - Cadastrar Empresa");
      print("2 - Buscar empresa por CNPJ");
      print("3 - Buscar empresa por CPF/CNPJ do sócio");
      print("4 - Listar empresas cadastradas");
      print("5 - Excluir empresa por ID");
      print("0 - Sair");
      int option = input<int>("\nInforme uma opção: ");
      if (option == -1) {
        print("Infome uma opção válida!");
        pressEnterToContinue();
        continue;
      }
      switch (option) {
        case 1:
          RegisterCompanyView();
          break;
        case 2:
          SearchByCNPJView();
          break;
        case 3:
          SearchByPartnerView();
          break;
        case 4:
          ListCompanyView();
          break;
        case 5:
          RemoveCompanyView();
          break;
        case 0:
          print("\nEncerrando programa...");
          break;
        default:
          print("Opção informada não é válida!");
      }
      if (option == 0) {
        break;
      } else {
        pressEnterToContinue();
        clear();
      }
    }
  }

  void drawTitle() {
    print("""
  _____            _     _               _____           _                 
 |  __ \\          (_)   | |             / ____|         | |                
 | |__) |___  __ _ _ ___| |_ ___ _ __  | (___  _   _ ___| |_ ___ _ __ ___  
 |  _  // _ \\/ _` | / __| __/ _ \\ '__|  \\___ \\| | | / __| __/ _ \\ '_ ` _ \\ 
 | | \\ \\  __/ (_| | \\__ \\ ||  __/ |     ____) | |_| \\__ \\ ||  __/ | | | | |
 |_|  \\_\\___|\\__, |_|___/\\__\\___|_|    |_____/ \\__, |___/\\__\\___|_| |_| |_|
              __/ |                             __/ |                      
             |___/                             |___/                       
Created by: Deyvid Jaguaribe
Version: 1.0.0
""");
  }
}
