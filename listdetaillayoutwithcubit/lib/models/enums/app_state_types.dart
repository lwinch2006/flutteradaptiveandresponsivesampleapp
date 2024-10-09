enum AppStateTypes {
  notInitialized('notInitialized'),
  initializing('initializing'),
  initialized('initialized'),
  initializationError('initializationError');

  final String name;
  const AppStateTypes(this.name);

  bool get isNotInitialized => index == 0;
  bool get isInitializing => index == 1;
  bool get isInitialized => index == 2;
  bool get isInitializationError => index == 3;
}
