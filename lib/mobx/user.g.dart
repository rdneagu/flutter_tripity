// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$idAtom = Atom(name: '_UserStore.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$permissionAtom = Atom(name: '_UserStore.permission');

  @override
  int get permission {
    _$permissionAtom.reportRead();
    return super.permission;
  }

  @override
  set permission(int value) {
    _$permissionAtom.reportWrite(value, super.permission, () {
      super.permission = value;
    });
  }

  final _$fullNameAtom = Atom(name: '_UserStore.fullName');

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$birthDayAtom = Atom(name: '_UserStore.birthDay');

  @override
  String get birthDay {
    _$birthDayAtom.reportRead();
    return super.birthDay;
  }

  @override
  set birthDay(String value) {
    _$birthDayAtom.reportWrite(value, super.birthDay, () {
      super.birthDay = value;
    });
  }

  final _$homeCountryAtom = Atom(name: '_UserStore.homeCountry');

  @override
  String get homeCountry {
    _$homeCountryAtom.reportRead();
    return super.homeCountry;
  }

  @override
  set homeCountry(String value) {
    _$homeCountryAtom.reportWrite(value, super.homeCountry, () {
      super.homeCountry = value;
    });
  }

  final _$homeCityAtom = Atom(name: '_UserStore.homeCity');

  @override
  String get homeCity {
    _$homeCityAtom.reportRead();
    return super.homeCity;
  }

  @override
  set homeCity(String value) {
    _$homeCityAtom.reportWrite(value, super.homeCity, () {
      super.homeCity = value;
    });
  }

  final _$postCodeAtom = Atom(name: '_UserStore.postCode');

  @override
  String get postCode {
    _$postCodeAtom.reportRead();
    return super.postCode;
  }

  @override
  set postCode(String value) {
    _$postCodeAtom.reportWrite(value, super.postCode, () {
      super.postCode = value;
    });
  }

  final _$tokenAtom = Atom(name: '_UserStore.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$expirationAtom = Atom(name: '_UserStore.expiration');

  @override
  int get expiration {
    _$expirationAtom.reportRead();
    return super.expiration;
  }

  @override
  set expiration(int value) {
    _$expirationAtom.reportWrite(value, super.expiration, () {
      super.expiration = value;
    });
  }

  final _$loggedAtAtom = Atom(name: '_UserStore.loggedAt');

  @override
  bool get loggedAt {
    _$loggedAtAtom.reportRead();
    return super.loggedAt;
  }

  @override
  set loggedAt(bool value) {
    _$loggedAtAtom.reportWrite(value, super.loggedAt, () {
      super.loggedAt = value;
    });
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  dynamic setUser() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setUser');
    try {
      return super.setUser();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
email: ${email},
permission: ${permission},
fullName: ${fullName},
birthDay: ${birthDay},
homeCountry: ${homeCountry},
homeCity: ${homeCity},
postCode: ${postCode},
token: ${token},
expiration: ${expiration},
loggedAt: ${loggedAt}
    ''';
  }
}
