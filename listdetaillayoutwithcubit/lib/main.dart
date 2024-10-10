import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:listdetaillayoutwithcubit/application/repositories/ilist_detail_repository.dart';
import 'package:listdetaillayoutwithcubit/application/repositories/list_detail_repository.dart';
import 'package:listdetaillayoutwithcubit/application/services/ilist_detail_service.dart';
import 'package:listdetaillayoutwithcubit/application/services/list_detail_service.dart';
import 'package:listdetaillayoutwithcubit/cubits/app_cubit.dart';
import 'package:listdetaillayoutwithcubit/routes.dart';
import 'package:listdetaillayoutwithcubit/theme_data.dart' as theme_data;
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';

Future<void> _setupDependencies() async {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<IListDetailRepository>(
      () => const ListDetailRepository());
  getIt.registerLazySingleton<IListDetailService>(
      () => ListDetailService(listDetailRepository: getIt.get()));
  await getIt.allReady();
}

void main() async {
  await _setupDependencies();
  final router = generateRouter();

  runApp(
    BlocProvider<AppCubit>(
      create: (context) => AppCubit(listDetailService: GetIt.I.get()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: theme_data.colorScheme,
          scaffoldBackgroundColor: theme_data.bodyBackGroundColor,
          listTileTheme: ListTileThemeData(
            selectedTileColor: theme_data.selectedTileColor,
            shape: const StadiumBorder(),
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('no'),
      ),
    ),
  );
}
