import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/services.dart';

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
      listViewSelectedIndexState: context.listViewSelectedIndexState,
      listViewSelectedItemState: context.listViewSelectedItemState,
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
      onChanged: (queryString) async {
        await listDetailLayoutService.searchItems(queryString, commonState);
      },
      onSubmitted: null,
      trailing: <Widget>[
        ValueListenableBuilder(
          valueListenable: searchController,
          builder: (context, textEditingValue, child) {
            if (textEditingValue.text.isNotEmpty) {
              return IconButton(
                onPressed: () async {
                  searchController.clear();
                  await listDetailLayoutService.clearSearch();
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
