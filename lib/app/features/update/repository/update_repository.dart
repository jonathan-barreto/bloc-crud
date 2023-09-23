import 'dart:convert';

import 'package:crud/app/data/models/contato_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateRepository {
  final SharedPreferences prefs;

  UpdateRepository({
    required this.prefs,
  });

  Future<ContatoModel> readContato({required int index}) async {
    final List<String>? contatosSalvos = prefs.getStringList('contatos');
    return ContatoModel.fromJson(jsonDecode(contatosSalvos![index]));
  }

  Future<bool> updateContato({
    required int index,
    required String nomeContato,
    required String numeroContato,
  }) async {
    final List<String>? contatosSalvos = prefs.getStringList('contatos');

    ContatoModel contatoModel = ContatoModel(
      nomeContato: nomeContato,
      numeroContato: numeroContato,
    );

    contatosSalvos![index] = jsonEncode(
      contatoModel.toJson(),
    );

    await prefs.setStringList('contatos', contatosSalvos);

    return true;
  }
}
