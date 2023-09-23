import 'package:crud/app/features/update/bloc/update_bloc.dart';
import 'package:crud/app/widgets/column_update.dart';
import 'package:flutter/material.dart';

class SizedBoxUpdate extends StatelessWidget {
  final int index;
  final UpdateBloc bloc;
  final TextEditingController nome;
  final TextEditingController numero;

  const SizedBoxUpdate({
    super.key,
    required this.index,
    required this.bloc,
    required this.nome,
    required this.numero,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ColumnUpdate(
        index: index,
        bloc: bloc,
        nome: nome,
        numero: numero,
      ),
    );
  }
}
