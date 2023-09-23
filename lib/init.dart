import 'package:crud/app/features/home/bloc/home_bloc.dart';
import 'package:crud/app/features/home/repository/home_repository.dart';
import 'package:crud/app/features/update/bloc/update_bloc.dart';
import 'package:crud/app/features/update/repository/update_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerFactory(
    () => HomeRepository(
      prefs: getIt<SharedPreferences>(),
    ),
  );

  getIt.registerFactory(
    () => HomeBloc(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerFactory(
    () => UpdateRepository(
      prefs: getIt<SharedPreferences>(),
    ),
  );

  getIt.registerFactory(
    () => UpdateBloc(
      updateRepository: getIt<UpdateRepository>(),
    ),
  );
}