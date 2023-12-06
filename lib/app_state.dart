import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _AvailablePrivateSettings =
          prefs.getStringList('ff_AvailablePrivateSettings') ??
              _AvailablePrivateSettings;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isRemovingFriend = false;
  bool get isRemovingFriend => _isRemovingFriend;
  set isRemovingFriend(bool _value) {
    _isRemovingFriend = _value;
  }

  List<String> _AvailablePrivateSettings = [
    'Public',
    'Friends Only',
    'Private'
  ];
  List<String> get AvailablePrivateSettings => _AvailablePrivateSettings;
  set AvailablePrivateSettings(List<String> _value) {
    _AvailablePrivateSettings = _value;
    prefs.setStringList('ff_AvailablePrivateSettings', _value);
  }

  void addToAvailablePrivateSettings(String _value) {
    _AvailablePrivateSettings.add(_value);
    prefs.setStringList(
        'ff_AvailablePrivateSettings', _AvailablePrivateSettings);
  }

  void removeFromAvailablePrivateSettings(String _value) {
    _AvailablePrivateSettings.remove(_value);
    prefs.setStringList(
        'ff_AvailablePrivateSettings', _AvailablePrivateSettings);
  }

  void removeAtIndexFromAvailablePrivateSettings(int _index) {
    _AvailablePrivateSettings.removeAt(_index);
    prefs.setStringList(
        'ff_AvailablePrivateSettings', _AvailablePrivateSettings);
  }

  void updateAvailablePrivateSettingsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _AvailablePrivateSettings[_index] =
        updateFn(_AvailablePrivateSettings[_index]);
    prefs.setStringList(
        'ff_AvailablePrivateSettings', _AvailablePrivateSettings);
  }

  void insertAtIndexInAvailablePrivateSettings(int _index, String _value) {
    _AvailablePrivateSettings.insert(_index, _value);
    prefs.setStringList(
        'ff_AvailablePrivateSettings', _AvailablePrivateSettings);
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
