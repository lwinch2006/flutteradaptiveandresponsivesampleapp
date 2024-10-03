import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

class ListViewSearchBar extends StatefulWidget {
  const ListViewSearchBar({super.key});

  @override
  State<StatefulWidget> createState() => _ListViewSearchBarState();
}

class _ListViewSearchBarState extends State<ListViewSearchBar> {
  final searchController = SearchController();
  late final CommonStateDto commonState;

  String queryString = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    commonState = CommonStateDto(
      detailsViewState: context.detailsViewState,
      listViewItemsState: context.listViewItemsState,
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: searchController,
      leading: const Icon(Icons.search),
      hintText: 'Search...',
      elevation: const WidgetStatePropertyAll(0),
      onTap: () {},
      onChanged: (queryString) {
        debugPrint(
            'Query string "$queryString" and is empty ${queryString.isEmpty}');

        if (queryString.isNotEmpty) {
          listDetailLayoutService.searchItems(queryString, commonState);
        } else {
          listDetailLayoutService.clearSearch(commonState);
        }
      },
      onSubmitted: null,
      trailing: <Widget>[
        ValueListenableBuilder(
          valueListenable: searchController,
          builder: (context, textEditingValue, child) {
            if (textEditingValue.text.isNotEmpty) {
              return IconButton(
                onPressed: () {
                  searchController.clear();
                  listDetailLayoutService.clearSearch(commonState);
                },
                icon: const Icon(Icons.close_outlined),
              );
            }
            return const Text('');
          },
        ),
      ],
    );
  }
}
