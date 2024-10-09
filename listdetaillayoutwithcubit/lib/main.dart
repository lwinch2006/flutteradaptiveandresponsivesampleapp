import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/cubits/app_cubit.dart';
import 'package:listdetaillayoutwithcubit/routes.dart';
import 'package:listdetaillayoutwithcubit/theme_data.dart' as theme_data;
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';

void main() {
  final router = generateRouter();

  runApp(
    BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
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
