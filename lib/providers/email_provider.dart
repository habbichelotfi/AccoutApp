import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this provider handle when we change the email in the textformfield and change the value
// in the sharedpreference

final sharedPrefs =
FutureProvider<SharedPreferences>((_) async => await SharedPreferences.getInstance());

class EmailProvider extends StateNotifier<String> {
  EmailProvider(this.pref) : super(pref?.getString("email") ?? '');

  static final provider = StateNotifierProvider<EmailProvider, String>((ref) {
    final pref = ref.watch(sharedPrefs).maybeWhen(
      data: (value) => value,
      orElse: () => null,
    );
    return EmailProvider(pref);
  });

  final SharedPreferences? pref;

  String getEmail(){
    return state;
  }

  void setEmail(email){
    state=email;
    pref!.setString("email", state);
  }
}