// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:consumo_api_stream/models/cidade.dart';
import 'package:consumo_api_stream/models/telefone.dart';

class Endereco {
  final String rua;
  final int numero;
  final String cep;
  final Cidade cidade;
  final Telefone telefone;

  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      "rua": rua,
      "numero": numero,
      "CEP": cep,
      "cidade": cidade.toMap(),
      "telefone": telefone.toMap(),
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map["rua"] ?? "",
      numero: map["numero"] ?? 0,
      cep: map["CEP"] ?? "",
      cidade: Cidade.fromMap(map["cidade"]),
      telefone: Telefone.fromMap(map["telefone"]),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));

  @override
  String toString() {
    return '''  rua: $rua, $numero 
                cep: $cep 
                cidade: $cidade 
                telefone: $telefone''';
  }
}
