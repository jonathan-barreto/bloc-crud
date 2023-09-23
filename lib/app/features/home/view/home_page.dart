import 'package:crud/app/features/home/bloc/home_bloc.dart';
import 'package:crud/app/features/home/bloc/home_event.dart';
import 'package:crud/app/widgets/icon_button_custom.dart';
import 'package:crud/app/widgets/stream_builder_custom.dart';
import 'package:crud/init.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = getIt<HomeBloc>();

  @override
  void initState() {
    super.initState();
    homeBloc.inputController.add(
      ReadContatos(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeBloc.inputController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButtonCustom(
          icon: Icons.add,
          bloc: homeBloc,
          event: CreateContato(),
        ),
        title: const Text('Contatos'),
        centerTitle: true,
      ),
      body: StreamBuilderCustom(
        bloc: homeBloc,
      ),
    );
  }
}
