import 'package:listdetaillayoutwithcubit/repositories/list_detail_layout_repository.dart';
import 'package:listdetaillayoutwithcubit/services/list_detail_layout_service.dart';

const listDetailLayoutRepository = ListDetailLayoutRepository();
const listDetailLayoutService = ListDetailLayoutService(
    listDetailLayoutRepository: listDetailLayoutRepository);
