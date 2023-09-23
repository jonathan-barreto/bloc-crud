import 'package:crud/app/data/models/contato_model.dart';
import 'package:crud/app/features/home/bloc/home_bloc.dart';
import 'package:crud/app/features/home/bloc/home_event.dart';
import 'package:crud/app/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class GestureDetectorCustom extends StatelessWidget {
  final int index;
  final ContatoModel contato;
  final HomeBloc bloc;

  const GestureDetectorCustom({
    super.key,
    required this.index,
    required this.contato,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bloc.inputController.add(
          UpdateContato(index: index, context: context),
        );
      },
      child: ListTileCustom(
        index: index,
        contato: contato,
        bloc: bloc,
      ),
    );
  }
}
