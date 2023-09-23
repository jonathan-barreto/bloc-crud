import 'package:crud/app/features/update/bloc/update_bloc.dart';
import 'package:crud/app/widgets/elevated_button_custom.dart';
import 'package:crud/app/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';

class ColumnUpdate extends StatelessWidget {
  final int index;
  final UpdateBloc bloc;
  final TextEditingController nome;
  final TextEditingController numero;

  const ColumnUpdate({
    super.key,
    required this.index,
    required this.bloc,
    required this.nome,
    required this.numero,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFieldCustom(
          label: 'Nome',
          textController: nome,
        ),
        TextFieldCustom(
          label: 'Número',
          textController: numero,
        ),
        ElevatedButtonCustom(
          index: index,
          onPressed: bloc,
          nomeContato: nome,
          numeroContato: numero,
        ),
      ],
    );
  }
}
