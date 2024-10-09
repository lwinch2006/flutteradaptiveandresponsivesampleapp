import 'package:listdetaillayoutwithcubit/breakpoints.dart';

enum AppListDetailLayoutTypes {
  onePane('onePane'),
  twoPane('twoPane');

  final String name;
  const AppListDetailLayoutTypes(this.name);

  bool get isOnePane => index == 0;
  bool get isTwoPane => index == 1;

  static AppListDetailLayoutTypes fromWindowWidth(double width) {
    if (width <= compactWindowWidthMax) {
      return AppListDetailLayoutTypes.onePane;
    } else if (width <= mediumWindowWidthMax) {
      return AppListDetailLayoutTypes.onePane;
    } else {
      return AppListDetailLayoutTypes.twoPane;
    }
  }
}
