import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/application/services/ilist_detail_service.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_state_types.dart';
import 'package:listdetaillayoutwithcubit/models/states/app_state.dart';
import 'package:listdetaillayoutwithcubit/routes.dart' as routes;
import 'package:listdetaillayoutwithcubit/utils/mappers/list_detail_layout_mapper.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';

class AppCubit extends Cubit<AppState> {
  final IListDetailService listDetailService;

  AppCubit({required this.listDetailService})
      : super(AppState(
          state: AppStateTypes.notInitialized,
          navigationCurrentIndex: -1,
          listViewItems: List<ListItemViewModel>.empty(),
        ));

  Future<void> initApp() async {
    try {
      emit(state.copyWith(state: AppStateTypes.initializing));

      final listItems = await listDetailService.getItems();

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
