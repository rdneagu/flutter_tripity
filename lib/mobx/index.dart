import 'package:mobx/mobx.dart';

import 'user.dart';

part 'index.g.dart';

class IndexStore = _IndexStore with _$IndexStore;

abstract class _IndexStore with Store {
  UserStore userStore;

  _IndexStore() {
    this.userStore = UserStore(this);
  }
}

IndexStore store = IndexStore();
