import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';

final dummyListItems = <ListItem>[
  const ListItem(id: 11, title: 'Gmail'),
  const ListItem(id: 22, title: 'Outlook'),
  const ListItem(id: 33, title: 'iCloud'),
  const ListItem(id: 44, title: 'Macbook'),
  const ListItem(id: 55, title: 'Twitter'),
  const ListItem(id: 66, title: 'Facebook'),
];

final dummyListItemsDetails = <int, ListItemDetails>{
  11: const ListItemDetails(
    itemId: 11,
    itemTitle: 'Gmail',
    username: 'Gmail user',
    password: 'Gmail password',
  ),
  22: const ListItemDetails(
    itemId: 22,
    itemTitle: 'Outlook',
    username: 'Outlook user',
    password: 'Outlook password',
  ),
  33: const ListItemDetails(
    itemId: 33,
    itemTitle: 'iCloud',
    username: 'iCloud user',
    password: 'iCloud password',
  ),
  44: const ListItemDetails(
    itemId: 44,
    itemTitle: 'Macbook',
    username: 'Macbook user',
    password: 'Macbook password',
  ),
  55: const ListItemDetails(
    itemId: 55,
    itemTitle: 'Twitter',
    username: 'Twitter user',
    password: 'Twitter password',
  ),
  66: const ListItemDetails(
    itemId: 66,
    itemTitle: 'Facebook',
    username: 'Facebook user',
    password: 'Facebook password',
  ),
};
