import 'dart:async';

import 'package:crud/app/data/models/contato_model.dart';
import 'package:crud/app/features/home/bloc/home_event.dart';
import 'package:crud/app/features/home/bloc/home_state.dart';
import 'package:crud/app/features/home/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeBloc {
  final HomeRepository homeRepository;

  final StreamController<HomeEvent> _inputHomeController =
      StreamController<HomeEvent>();
  final StreamController<HomeState> _outputHomeController =
      StreamController<HomeState>();

  Sink<HomeEvent> get inputController => _inputHomeController.sink;
  Stream<HomeState> get stream => _outputHomeController.stream;

  HomeBloc({required this.homeRepository}) {
    _inputHomeController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(HomeEvent event) async {
    List<ContatoModel> contatos = [];

    _outputHomeController.add(
      HomeLoadingState(),
    );

    if (event is CreateContato) {
      contatos = await homeRepository.createContato();
    } else if (event is ReadContatos) {
      contatos = await homeRepository.readContatos();
    } else if (event is UpdateContato) {
      await Navigator.pushNamed(
        event.context,
        '/update',
        arguments: event.index,
      );
      contatos = await homeRepository.readContatos();
    } else if (event is DeleteContato) {
      contatos = await homeRepository.deleteContato(event.index);
    }

    _outputHomeController.add(
      HomeSuccessState(
        contatos: contatos,
      ),
    );
  }
}
