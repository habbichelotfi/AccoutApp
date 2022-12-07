import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app2/constants.dart';
import 'package:test_app2/providers/theme_provider.dart';


//the setting screen

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

var themeModes = ['Light Mode', 'night mode'];

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tTheme,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 20)),
          DropdownButton<String>(
              value: ref.watch(ThemeProvider.provider),
              items: themeModes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (text) {
                ref.read(ThemeProvider.provider.notifier).setTheme(text);
              }),
          const SizedBox(height: 20),
          Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.55,
              color: Colors.grey.shade400),
          const SizedBox(height: 20),
          Text(tHotk,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 20)),
          const SizedBox(height: 10),
          Row(children: [
           const Text(tOpen, style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            Container(
                padding:const EdgeInsets.all(1),
                color: Colors.grey.shade300,
                child: const Icon(Icons.keyboard_command_key_outlined, size: 16)),
            const SizedBox(width: 10),
            Container(
                padding:
                    const EdgeInsets.only(left: 4, top: 1, bottom: 1, right: 4),
                color: Colors.grey.shade300,
                child: const Text("J",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(width: 10),
            InkWell(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black)),
                    child: const Text(tRecord,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12))))
          ]),
          const SizedBox(height: 20),
          Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.55,
              color: Colors.grey.shade400),
          const SizedBox(height: 20),
          Text(tOther,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 20)),
          const SizedBox(height: 20),
          const Text(tRequestP,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}
