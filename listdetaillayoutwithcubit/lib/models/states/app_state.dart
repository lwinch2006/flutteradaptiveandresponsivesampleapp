import 'package:listdetaillayoutwithcubit/models/enums/app_state_types.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';

class AppState {
  final AppStateTypes state;
  final int navigationCurrentIndex;
  final List<ListItemViewModel> listViewItems;

  const AppState(
      {required this.state,
      required this.navigationCurrentIndex,
      required this.listViewItems});

  AppState copyWith({
    AppStateTypes? state,
    int? navigationCurrentIndex,
    List<ListItemViewModel>? listItemsViewModels,
  }) {
    return AppState(
      state: state ?? this.state,
      navigationCurrentIndex:
          navigationCurrentIndex ?? this.navigationCurrentIndex,
      listViewItems: listItemsViewModels ?? this.listViewItems,
    );
  }
}
