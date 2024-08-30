import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/models/list_item.dart';
import 'package:listdetaillayout/models/list_item_details.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class ListViewService {
  const ListViewService();

  Future<List<ListViewViewModel>> getItems() {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        const listItems = <ListItem>[
          ListItem(id: 0, title: 'Gmail'),
          ListItem(id: 1, title: 'Outlook'),
          ListItem(id: 2, title: 'iCloud'),
          ListItem(id: 3, title: 'Macbook'),
          ListItem(id: 4, title: 'Twitter'),
          ListItem(id: 5, title: 'Facebook')
        ];

        final response = listItems.map((listItem) {
          return ListViewViewModel(id: listItem.id, title: listItem.title);
        });

        return response.toList();
      },
    );
  }

  Future<DetailViewViewModel> getItemDetails(int itemId, String itemTitle) {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        ListItemDetails listItem;

        switch (itemId) {
          case 0:
            listItem = ListItemDetails(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Gmail user',
                password: 'Gmail password');
            break;
          case 1:
            listItem = ListItemDetails(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Outlook user',
                password: 'Outlook password');
            break;
          case 2:
            listItem = ListItemDetails(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'iCloud user',
                password: 'iCloud password');
            break;
          case 3:
            listItem = ListItemDetails(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Macbook user',
                password: 'Macbook password');
            break;
          case 4:
            listItem = ListItemDetails(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Twitter user',
                password: 'Twitter password');
            break;
          case 5:
            listItem = ListItemDetails(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Facebook user',
                password: 'Facebook password');
            break;
          default:
            listItem = ListItemDetails(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Gmail user',
                password: 'Gmail password');
            break;
        }

        final response = listItem.toDetailViewViewModel();
        return response;
      },
    );
  }

  void closeItemDetails(BuildContext context) {
    context.appState.selectedListViewItemIndex.value = -1;
  }
}
