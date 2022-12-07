import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app2/constants.dart';
import 'package:test_app2/providers/page_provider.dart';
import 'package:test_app2/providers/theme_provider.dart';

import 'circle_picture.dart';

//the side menu widget , i think we can clean it a little bit more specifically the responsive part

class SideMenu extends ConsumerStatefulWidget {
  final double width;

  const SideMenu({Key? key, required this.width}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  logOut() {
    Navigator.pushReplacementNamed(context, '/');
  }

  settingPage(page) {
    ref.read(PageProvider.pageProvider.notifier).setPage(page);
  }


  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(ThemeProvider.provider);
    final currentPage = ref.watch(PageProvider.pageProvider);
    return Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 0.25,
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const CirclePicture(defaultPicturePath),
          const SizedBox(height: 20),
          InkWell(
              onTap: () {},
              child: const Text(editText,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline))),
          const SizedBox(height: 20),
          widget.width < 520
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: currentPage == "settings"
                          ? Colors.grey.shade200
                          : Colors.black,
                      elevation: 5,
                      fixedSize: Size(widget.width * 0.12, widget.width * 0.12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  onPressed: () {
                    settingPage('account');
                  },
                  child: Image.asset(accountIconPath,
                      color: currentPage == "settings"
                          ? Colors.black
                          : Colors.white,
                      width: 23,
                      height: 23),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: currentPage == "settings"
                          ? Colors.grey.shade200
                          : Colors.black,
                      fixedSize: Size.fromWidth(200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  onPressed: () {
                    settingPage('account');
                  },
                  child: Row(children: [
                    Image.asset(accountIconPath,
                        color: currentPage == "settings"
                            ? Colors.black
                            : Colors.white,
                        width: 18,
                        height: 18),
                    const SizedBox(width: 10),
                    Text(
                      "Account",
                      style: TextStyle(
                          color: currentPage == "settings"
                              ? Colors.black
                              : Colors.white),
                    )
                  ])),
          const SizedBox(height: 15),
          widget.width < 520
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: currentPage == "account"
                          ? Colors.grey.shade200
                          : Colors.black,
                      elevation: 5,
                      fixedSize: Size(widget.width * 0.12, widget.width * 0.12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  onPressed: () {
                    settingPage('settings');
                  },
                  child: Icon(Icons.settings_outlined,
                      size: 25,
                      color: currentPage == "account"
                          ? Colors.black
                          : Colors.white),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: currentPage == "account"
                          ? Colors.grey.shade200
                          : Colors.black,
                      elevation: 0,
                      fixedSize: const Size.fromWidth(200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  onPressed: () {
                    settingPage('settings');
                  },
                  child: Row(children: [
                    Icon(Icons.settings_outlined,
                        size: 15,
                        color: currentPage == "account"
                            ? Colors.black
                            : Colors.white),
                    const SizedBox(width: 10),
                    Text("Settings",
                        style: TextStyle(
                            color: currentPage == "account"
                                ? Colors.black
                                : Colors.white))
                  ])),
          const Spacer(),
          widget.width < 520
              ? IconButton(onPressed: logOut, icon: const Icon(Icons.login_outlined))
              : InkWell(
                  onTap: logOut,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.login_outlined, size: 16),
                        SizedBox(width: 10),
                        Text('Log out',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]))
        ]));
  }
}
