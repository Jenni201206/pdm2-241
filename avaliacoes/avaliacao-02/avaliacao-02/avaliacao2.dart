import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  
  String get nome => _nome;

  Map<String, dynamic> toJson() => {'nome': _nome};
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() => {
      'nome': _nome,
      'dependentes': _dependentes.map((dep) => dep.toJson()).toList(),
  };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() => {
    'nomeProjeto': _nomeProjeto,
    'funcionarios': _funcionarios.map((func) => func.toJson()).toList(),
  };
}

void main() {
  // 1. Criar varios objetos Dependentes
  var dependente1 = Dependente("Projeto A");
  var dependente2 = Dependente("Projeto B");
  var dependente3 = Dependente("Projeto C");
  var dependente4 = Dependente("Projeto D");

  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos funcionarios
  var funcionario1 = Funcionario("samuel", [dependente1]);
  var funcionario2 = Funcionario("Guilherme", [dependente2]);
  var funcionario3 = Funcionario("Helena", [dependente3]);
  var funcionario4 = Funcionario("Carla", [dependente4]);
    
  // 4. Criar uma lista de Funcionarios
  List<Funcionario> listaDeFunc = [funcionario1, funcionario2, funcionario3, funcionario4];
  
  // 5. criar um objeto Equipe Projeto chamando o metodo contrutor que da nome ao projeto e insere uma coleção de funcionario
    var equipe1 = EquipeProjeto("Projeto01", listaDeFunc);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  var jsonEquipeProjeto = jsonEncode(equipe1.toJson());
  print(jsonEquipeProjeto);
}
                                                                     
