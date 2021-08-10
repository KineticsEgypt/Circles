import 'dart:async';
import 'dart:convert';
import 'package:circles/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../settings/app_settings.dart';


class SettingProvider extends ChangeNotifier{

  resetSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(ASettings.user);
    _user = null;
    notifyListeners();
  }

  bool loaded = false;

  User _user;
  User get user => _user;
  Future<void> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(user == null){
      prefs.remove(ASettings.user);
    }else{
      prefs.setString(ASettings.user, json.encode(user.toMap()));
    }
    _user = user;
    notifyListeners();
  }

  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  Future<void> setThemeMode(ThemeMode value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(ASettings.firstTimeOpenApp, value.index);
    _themeMode = value;
    notifyListeners();
  }

  bool _firstTimeOpenApp;
  bool get firstTimeOpenApp => _firstTimeOpenApp;
  Future<void> setFirstTimeOpenApp(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ASettings.firstTimeOpenApp, value);
    _firstTimeOpenApp = value;
    notifyListeners();
  }

  // call loadSharedPreferences when provider initialise
  SettingProvider(){
    loadSharedPreferences();
  }

  // get app setting
  Future<void> loadSharedPreferences() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey(ASettings.user)){
      String userJson = prefs.getString(ASettings.user);
      if(userJson != null)
        _user = User.fromJson(json.decode(userJson));
    }

    if(prefs.containsKey(ASettings.themeMode)){
      _themeMode = ThemeMode.values[prefs.get(ASettings.themeMode)];
    }else{
      _themeMode = ThemeMode.system;
    }

    if(prefs.containsKey(ASettings.firstTimeOpenApp)){
      _firstTimeOpenApp = prefs.getBool(ASettings.firstTimeOpenApp);
    }else{
      prefs.setBool(ASettings.firstTimeOpenApp, false);
      _firstTimeOpenApp  = true;
    }

    loaded = true;
    notifyListeners();
  }

}