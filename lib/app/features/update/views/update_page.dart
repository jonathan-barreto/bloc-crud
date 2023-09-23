import 'package:crud/app/data/models/contato_model.dart';
import 'package:crud/app/features/update/bloc/update_bloc.dart';
import 'package:crud/app/features/update/bloc/update_event.dart';
import 'package:crud/app/widgets/sized_box_update.dart';
import 'package:crud/init.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late Object? args;
  final UpdateBloc updateBloc = getIt<UpdateBloc>();
  late TextEditingController nomeContatoController;
  late TextEditingController numeroContatoController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments;
    updateBloc.inputController.add(
      ReadContato(
        index: int.parse(
          args.toString(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    updateBloc.inputController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1D21),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Atualizar'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: updateBloc.stream,
        builder: (context, snapshot) {
          ContatoModel? contato = snapshot.data?.contato;
          nomeContatoController = TextEditingController(
            text: contato?.nomeContato,
          );
          numeroContatoController = TextEditingController(
            text: contato?.numeroContato,
          );
          return Center(
            child: contato?.nomeContato == null
                ? const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.deepPurpleAccent,
                  )
                : SizedBoxUpdate(
                    index: int.parse(args.toString()),
                    bloc: updateBloc,
                    nome: nomeContatoController,
                    numero: numeroContatoController,
                  ),
          );
        },
      ),
    );
  }
}
