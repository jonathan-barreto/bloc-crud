import 'package:crud/app/data/models/contato_model.dart';

abstract class HomeState {
  List<ContatoModel> contatos;

  HomeState({
    required this.contatos,
  });
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(contatos: []);
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super(contatos: []);
}

class HomeSuccessState extends HomeState {
  HomeSuccessState({required List<ContatoModel> contatos})
      : super(
          contatos: contatos,
        );
}
