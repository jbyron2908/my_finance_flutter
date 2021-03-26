import 'package:riverpod/riverpod.dart';

final floatingPanelBlocProvider = StateNotifierProvider(
  (ref) {
    return FloatingPanelBloc(isHidden: false);
  },
);

class FloatingPanelBloc extends StateNotifier<bool> {
  FloatingPanelBloc({
    required bool isHidden,
  }) : super(isHidden);

  void hide() {
    state = true;
  }

  void show() {
    state = false;
  }

  void toggle() {
    state = !state;
  }
}
