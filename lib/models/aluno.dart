// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:consumo_api_stream/models/curso.dart';
import 'package:consumo_api_stream/models/endereco.dart';

class Aluno {
  final String id;
  final String nome;
  final int? idade;
  final List<String> nomeCursos;
  final Endereco endereco;
  final List<Curso> cursos;

  Aluno({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.endereco,
    required this.cursos,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "idade": idade,
      "nomeCursos": nomeCursos,
      "endereco": endereco.toMap(),
      "cursos": cursos.map((curso) => curso.toMap()).toList(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map["id"] ?? "",
      nome: map["nome"] ?? "",
      idade: map["idade"], //idade aceita nulo
      nomeCursos: List<String>.from(map["nomeCursos"]),
      endereco: Endereco.fromMap(map["endereco"]),
      cursos: map["cursos"].map<Curso>((cursoMap) => Curso.fromMap(cursoMap)).toList(),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString() {
    return '''Aluno: 
                id: $id
                nome: $nome
                idade: $idade
                nomeCursos: $nomeCursos
                endereco: $endereco
                cursos: $cursos''';
  }
}
