import 'package:listdetaillayout/models/list_item.dart';
import 'package:listdetaillayout/models/list_item_details.dart';

const dummyListItems = <ListItem>[
  ListItem(id: 0, title: 'Gmail'),
  ListItem(id: 1, title: 'Outlook'),
  ListItem(id: 2, title: 'iCloud'),
  ListItem(id: 3, title: 'Macbook'),
  ListItem(id: 4, title: 'Twitter'),
  ListItem(id: 5, title: 'Facebook')
];

const dummyListItemsDetails = <int, ListItemDetails>{
  0: ListItemDetails(
    itemId: 0,
    itemTitle: 'Gmail',
    username: 'Gmail user',
    password: 'Gmail password',
  ),
  1: ListItemDetails(
    itemId: 1,
    itemTitle: 'Outlook',
    username: 'Outlook user',
    password: 'Outlook password',
  ),
  2: ListItemDetails(
    itemId: 2,
    itemTitle: 'iCloud',
    username: 'iCloud user',
    password: 'iCloud password',
  ),
  3: ListItemDetails(
    itemId: 3,
    itemTitle: 'Macbook',
    username: 'Macbook user',
    password: 'Macbook password',
  ),
  4: ListItemDetails(
    itemId: 4,
    itemTitle: 'Twitter',
    username: 'Twitter user',
    password: 'Twitter password',
  ),
  5: ListItemDetails(
    itemId: 5,
    itemTitle: 'Facebook',
    username: 'Facebook user',
    password: 'Facebook password',
  ),
};
