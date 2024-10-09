import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';

class ListViewSearchBar extends StatefulWidget {
  const ListViewSearchBar({super.key});

  @override
  State<StatefulWidget> createState() => _ListViewSearchBarState();
}

class _ListViewSearchBarState extends State<ListViewSearchBar> {
  late final ListDetailLayoutCubit listDetailLayoutCubit;
  final searchController = SearchController();

  String queryString = '';

  @override
  void initState() {
    super.initState();
    listDetailLayoutCubit = context.read<ListDetailLayoutCubit>();
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
      hintText: context.l10n.searchFieldPlaceholder,
      elevation: const WidgetStatePropertyAll(0),
      onTap: () {},
      onChanged: (queryString) {
        debugPrint(
            'Query string "$queryString" and is empty ${queryString.isEmpty}');

        if (queryString.isNotEmpty) {
          listDetailLayoutCubit.searchItems(queryString);
        } else {
          listDetailLayoutCubit.clearSearch();
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
                  listDetailLayoutCubit.clearSearch();
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
