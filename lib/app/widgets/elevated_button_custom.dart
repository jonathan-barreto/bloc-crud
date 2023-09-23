import 'package:crud/app/features/update/bloc/update_bloc.dart';
import 'package:crud/app/features/update/bloc/update_event.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final int index;
  final UpdateBloc onPressed;
  final TextEditingController nomeContato, numeroContato;

  const ElevatedButtonCustom({
    super.key,
    required this.index,
    required this.onPressed,
    required this.nomeContato,
    required this.numeroContato,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed.inputController.add(
          UpdateContato(
            index: index,
            context: context,
            nomeContato: nomeContato.text,
            numeroContato: numeroContato.text,
          ),
        );
      },
      style: const ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(250, 50),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Colors.deepPurpleAccent,
        ),
      ),
      child: const Text(
        'ATUALIZAR',
        style: TextStyle(
          fontSize: 15,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
