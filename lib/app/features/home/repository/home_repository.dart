import 'dart:convert';
import 'dart:math';

import 'package:crud/app/data/models/contato_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  final SharedPreferences prefs;
  List<ContatoModel> contatos = [];

  HomeRepository({
    required this.prefs,
  });

  ContatoModel randomContato() {
    List<Map<String, dynamic>> contatosAleatorios = [
      {
        'nomeContato': 'Jonathan',
        'numeroContato': '21999999999',
      },
      {
        'nomeContato': 'Tatiana',
        'numeroContato': '21977778888',
      },
      {
        'nomeContato': 'Bruno',
        'numeroContato': '21937712045',
      },
    ];

    Random random = Random();

    ContatoModel contatoGerado = ContatoModel.fromJson(
      contatosAleatorios[random.nextInt(contatosAleatorios.length)],
    );

    return contatoGerado;
  }

  Map<String, dynamic> returnContatoJson() {
    ContatoModel contatoGerado = randomContato();

    ContatoModel contatoModel = ContatoModel(
      nomeContato: contatoGerado.nomeContato,
      numeroContato: contatoGerado.numeroContato,
    );

    Map<String, dynamic> contatoJson = contatoModel.toJson();

    return contatoJson;
  }

  List<ContatoModel> addToContatos(List<String> contatosSalvos) {
    contatos.clear();

    contatos.addAll(
      contatosSalvos.map(
        (e) => ContatoModel.fromJson(
          jsonDecode(e),
        ),
      ),
    );

    return contatos;
  }

  Future<List<ContatoModel>> createContato() async {
    final List<String>? contatosSalvos = prefs.getStringList('contatos');

    Map<String, dynamic> contatoJson = returnContatoJson();

    contatosSalvos!.add(jsonEncode(contatoJson));

    contatos = addToContatos(contatosSalvos);

    await prefs.setStringList('contatos', contatosSalvos);
    return contatos;
  }

  Future<List<ContatoModel>> readContatos() async {
    final List<String>? contatosSalvos = prefs.getStringList('contatos');

    contatos = addToContatos(contatosSalvos!);

    return contatos;
  }

  Future<List<ContatoModel>> deleteContato(int index) async {
    final List<String>? contatosSalvos = prefs.getStringList('contatos');

    contatosSalvos!.removeAt(index);

    contatos = addToContatos(contatosSalvos);

    await prefs.setStringList('contatos', contatosSalvos);
    return contatos;
  }
}
