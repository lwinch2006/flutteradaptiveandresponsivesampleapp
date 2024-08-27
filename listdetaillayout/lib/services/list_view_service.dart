import 'package:listdetaillayout/dtos/list_view_item_details_dto.dart';
import 'package:listdetaillayout/dtos/list_view_item_dto.dart';

class ListViewService {
  const ListViewService();

  Future<List<ListViewItemDTO>> getItems() {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        return const <ListViewItemDTO>[
          ListViewItemDTO(id: 0, title: 'Gmail'),
          ListViewItemDTO(id: 1, title: 'Outlook'),
          ListViewItemDTO(id: 2, title: 'iCloud'),
          ListViewItemDTO(id: 3, title: 'Macbook'),
          ListViewItemDTO(id: 4, title: 'Twitter'),
          ListViewItemDTO(id: 5, title: 'Facebook')
        ];
      },
    );
  }

  Future<ListViewItemDetailsDTO> getItemDetails(int itemId, String itemTitle) {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        switch (itemId) {
          case 0:
            return ListViewItemDetailsDTO(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Gmail user',
                password: 'Gmail password');
          case 1:
            return ListViewItemDetailsDTO(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Outlook user',
                password: 'Outlook password');
          case 2:
            return ListViewItemDetailsDTO(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'iCloud user',
                password: 'iCloud password');
          case 3:
            return ListViewItemDetailsDTO(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Macbook user',
                password: 'Macbook password');
          case 4:
            return ListViewItemDetailsDTO(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Twitter user',
                password: 'Twitter password');
          case 5:
            return ListViewItemDetailsDTO(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Facebook user',
                password: 'Facebook password');
          default:
            return ListViewItemDetailsDTO(
                itemId: itemId,
                itemTitle: itemTitle,
                username: 'Gmail user',
                password: 'Gmail password');
        }
      },
    );
  }
}
