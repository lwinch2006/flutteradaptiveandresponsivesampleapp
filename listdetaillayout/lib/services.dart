import 'package:listdetaillayout/repositories/list_detail_layout_repository.dart';
import 'package:listdetaillayout/services/app_service.dart';
import 'package:listdetaillayout/services/list_detail_layout_service.dart';
import 'package:listdetaillayout/services/navigation_service.dart';
import 'package:listdetaillayout/services/state_service.dart';

const stateService = StateService();
const listDetailLayoutRepository = ListDetailLayoutRepository();
const listDetailLayoutService = ListDetailLayoutService(
  listDetailLayoutRepository: listDetailLayoutRepository,
  stateService: stateService,
);
const appService = AppService(
  listDetailLayoutService: listDetailLayoutService,
  stateService: stateService,
);
const navigationService = NavigationService(
  appService: appService,
  listDetailLayoutService: listDetailLayoutService,
  stateService: stateService,
);
