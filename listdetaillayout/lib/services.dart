import 'package:listdetaillayout/services/app_service.dart';
import 'package:listdetaillayout/services/list_view_service.dart';
import 'package:listdetaillayout/services/navigation_service.dart';

const listViewService = ListViewService();
const appService = AppService(listItemService: listViewService);
const navigationService = NavigationService();
