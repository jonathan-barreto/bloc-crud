import 'package:crud/app/data/models/contato_model.dart';

abstract class UpdateState {
  ContatoModel? contato;

  UpdateState({
    required this.contato,
  });
}

class UpdateInitialState extends UpdateState {
  UpdateInitialState() : super(contato: null);
}

class UpdateLoadingState extends UpdateState {
  UpdateLoadingState() : super(contato: null);
}

class UpdateSuccessState extends UpdateState {
  UpdateSuccessState({required ContatoModel contato})
      : super(
          contato: contato,
        );
}
