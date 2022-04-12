import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoaderIndicatorService extends StateNotifier<bool> {
  LoaderIndicatorService() : super(false);

  void show() => state = true;

  void hide() => state = false;
}
class BottomNavigationService extends StateNotifier<int> {
  BottomNavigationService() : super(0);

  void updateIndex(int index) => state = index;
}
