
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//this provider handle when the theme is changed didnt finish yet the implementation

final sharedPrefs =
FutureProvider<SharedPreferences>((_) async => await SharedPreferences.getInstance());

class ThemeProvider extends StateNotifier<String> {
  ThemeProvider(this.pref) : super(pref?.getString("theme") ?? 'Light Mode');

  static final provider = StateNotifierProvider<ThemeProvider, String>((ref) {
    final pref = ref.watch(sharedPrefs).maybeWhen(
      data: (value) => value,
      orElse: () => null,
    );
    return ThemeProvider(pref);
  });

  final SharedPreferences? pref;

  String getTheme(){
    return state;
  }

  void setTheme(theme){
    state=theme;
    pref!.setString("theme", state);
    // updateShouldNotify(state, email);
  }
}