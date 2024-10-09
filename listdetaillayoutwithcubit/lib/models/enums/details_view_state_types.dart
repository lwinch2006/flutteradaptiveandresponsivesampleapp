enum DetailsViewStateTypes {
  loadingData('loadingData'),
  loadingDataError('loadingDataError'),
  loadedData('loadedData'),
  addingData('addingData'),
  addingDataError('addingDataError'),
  updatingData('updatingData'),
  updatingDataError('updatingDataError');

  final String name;
  const DetailsViewStateTypes(this.name);

  bool get isLoadingData => index == 0;
  bool get isLoadingDataError => index == 1;
  bool get isLoadedData => index == 2;
  bool get isAddingData => index == 3;
  bool get isAddingDataError => index == 4;
  bool get isUpdatingData => index == 5;
  bool get isUpdatingDataError => index == 6;
}
