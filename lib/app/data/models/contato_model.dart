class ContatoModel {
  String? nomeContato;
  String? numeroContato;

  ContatoModel({
    this.nomeContato,
    this.numeroContato,
  });

  ContatoModel.fromJson(Map<String, dynamic> json) {
    nomeContato = json['nomeContato'];
    numeroContato = json['numeroContato'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeContato'] = nomeContato;
    data['numeroContato'] = numeroContato;
    return data;
  }
}
