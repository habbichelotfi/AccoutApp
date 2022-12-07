import 'package:flutter_riverpod/flutter_riverpod.dart';

//this provider handle when we change page when the button is targetted

class PageProvider extends StateNotifier<String> {
  PageProvider() : super('account');
  static final pageProvider =
      StateNotifierProvider<PageProvider, String>((ref) {
    return PageProvider();
  });

  void setPage(toWhere) {
    state = toWhere;
  }
}
