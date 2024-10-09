import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/application/utils/mappers/list_detail_layout_mapper.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_state_types.dart';
import 'package:listdetaillayoutwithcubit/models/states/app_state.dart';
import 'package:listdetaillayoutwithcubit/routes.dart' as routes;
import 'package:listdetaillayoutwithcubit/services.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
          state: AppStateTypes.notInitialized,
          navigationCurrentIndex: -1,
          listViewItems: List<ListItemViewModel>.empty(),
        ));

  Future<void> initApp() async {
    try {
      emit(state.copyWith(state: AppStateTypes.initializing));

      final listItems = await listDetailLayoutService.getItems();

      final listItemsViewModel =
          ListDetailLayoutMapper.MapToListViewViewModels(listItems);

      emit(state.copyWith(
        state: AppStateTypes.initialized,
        navigationCurrentIndex: routes.listDetailLayoutPageIndex,
        listItemsViewModels: listItemsViewModel,
      ));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
      emit(state.copyWith(state: AppStateTypes.initializationError));
    }

    return;
  }

  Future<void> resetApp() async {
    try {
      emit(state.copyWith(
          listItemsViewModels: List<ListItemViewModel>.empty(),
          navigationCurrentIndex: -1,
          state: AppStateTypes.notInitialized));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }
  }

  void onNavigationDestinationSelected(int selectedIndex) {
    if (selectedIndex == state.navigationCurrentIndex) {
      return;
    }

    emit(state.copyWith(navigationCurrentIndex: selectedIndex));
    return;
  }
}
