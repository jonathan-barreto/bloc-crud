import 'package:crud/app/data/models/contato_model.dart';
import 'package:crud/app/features/home/bloc/home_bloc.dart';
import 'package:crud/app/features/home/bloc/home_event.dart';
import 'package:crud/app/widgets/circle_avatar_custom.dart';
import 'package:crud/app/widgets/icon_button_custom.dart';
import 'package:crud/app/widgets/text_custom.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final int index;
  final ContatoModel contato;
  final HomeBloc bloc;

  const ListTileCustom({
    super.key,
    required this.index,
    required this.contato,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatarCustom(
        text: contato.nomeContato![0],
      ),
      title: TextCustom(
        fontSize: 25,
        text: contato.nomeContato!,
      ),
      subtitle: TextCustom(
        fontSize: 15,
        text: contato.numeroContato!,
      ),
      trailing: IconButtonCustom(
        icon: Icons.remove,
        bloc: bloc,
        event: DeleteContato(index: index),
      ),
    );
  }
}
