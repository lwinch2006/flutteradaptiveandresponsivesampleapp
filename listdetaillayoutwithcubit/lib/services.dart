import 'package:listdetaillayoutwithcubit/application/repositories/list_detail_repository.dart';
import 'package:listdetaillayoutwithcubit/application/services/list_detail_service.dart';

const listDetailLayoutRepository = ListDetailLayoutRepository();
const listDetailLayoutService = ListDetailLayoutService(
    listDetailLayoutRepository: listDetailLayoutRepository);
