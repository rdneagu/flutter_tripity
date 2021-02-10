import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final dynamic rootStore;

  @observable
  int id;
  @observable
  String email;
  @observable
  int permission;
  @observable
  String fullName;
  @observable
  String birthDay;
  @observable
  String homeCountry;
  @observable
  String homeCity;
  @observable
  String postCode;
  @observable
  String token;
  @observable
  int expiration;
  @observable
  bool loggedAt;

  _UserStore(this.rootStore);

  @action
  setUser() {
    this.id = 1;
    this.email = 'test';
  }
}
