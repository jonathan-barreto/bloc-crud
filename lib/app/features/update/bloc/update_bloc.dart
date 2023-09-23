import 'dart:async';

import 'package:crud/app/data/models/contato_model.dart';
import 'package:crud/app/features/update/bloc/update_event.dart';
import 'package:crud/app/features/update/bloc/update_state.dart';
import 'package:crud/app/features/update/repository/update_repository.dart';
import 'package:flutter/material.dart';

class UpdateBloc {
  final UpdateRepository updateRepository;
  final StreamController<UpdateEvent> _inputUpdateController =
      StreamController<UpdateEvent>();
  final StreamController<UpdateState> _outputUpdateController =
      StreamController<UpdateState>();

  Sink<UpdateEvent> get inputController => _inputUpdateController.sink;
  Stream<UpdateState> get stream => _outputUpdateController.stream;

  UpdateBloc({required this.updateRepository}) {
    _inputUpdateController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(UpdateEvent event) async {
    ContatoModel? contato;

    _outputUpdateController.add(
      UpdateLoadingState(),
    );

    if (event is ReadContato) {
      contato = await updateRepository.readContato(index: event.index);
    } else if (event is UpdateContato) {
      await updateRepository.updateContato(
        index: event.index,
        nomeContato: event.nomeContato,
        numeroContato: event.numeroContato,
      );

      Navigator.pop(event.context);
      return;
    }

    _outputUpdateController.add(
      UpdateSuccessState(
        contato: contato!,
      ),
    );
  }
}
