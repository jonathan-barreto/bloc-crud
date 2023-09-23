import 'package:crud/app/data/models/contato_model.dart';
import 'package:crud/app/features/home/bloc/home_bloc.dart';
import 'package:crud/app/widgets/gesture_detector_custom.dart';
import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {
  final List<ContatoModel> contatos;
  final HomeBloc bloc;

  const ListViewCustom({
    super.key,
    required this.contatos,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: contatos.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return GestureDetectorCustom(
          index: index,
          contato: contatos[index],
          bloc: bloc,
        );
      },
    );
  }
}
