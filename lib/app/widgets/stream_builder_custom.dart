import 'package:crud/app/data/models/contato_model.dart';
import 'package:crud/app/features/home/bloc/home_bloc.dart';
import 'package:crud/app/features/home/bloc/home_state.dart';
import 'package:crud/app/widgets/list_view_custom.dart';
import 'package:flutter/material.dart';

class StreamBuilderCustom extends StatelessWidget {
  final HomeBloc bloc;

  const StreamBuilderCustom({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (BuildContext context, AsyncSnapshot<HomeState> snapshot) {
        List<ContatoModel> contatos = snapshot.data?.contatos ?? [];
        return ListViewCustom(
          contatos: contatos,
          bloc: bloc,
        );
      },
    );
  }
}
