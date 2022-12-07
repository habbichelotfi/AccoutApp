import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_app2/providers/page_provider.dart';
import 'package:test_app2/providers/theme_provider.dart';
import 'package:test_app2/views/account_view.dart';
import 'package:test_app2/views/settings_view.dart';
import 'package:test_app2/widgets/circle_picture.dart';
import 'package:test_app2/widgets/side_menu.dart';

import '../widgets/circle_picture.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//this is the mainView that have the side menu and both account or setting screen depending on the user choice

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final currentPage = ref.watch(PageProvider.pageProvider);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Row(
            children: [
              SideMenu(width: width),
              Expanded(
                  child: currentPage == "settings"
                      ? SettingsView()
                      : AccountView())
            ],
          ),
        ));
  }
}
