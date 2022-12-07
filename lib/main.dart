import 'package:flutter/material.dart';
import 'package:test_app2/providers/email_provider.dart';
import 'package:test_app2/providers/page_provider.dart';
import 'package:test_app2/views/main_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app2/widgets/email_component.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const MyHomePage(),
        '/main': (context) => const MainView()
      },
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  ref.watch(PageProvider.pageProvider.notifier).setPage('account');
                  Navigator.pushNamed(context, '/main');
                },
                child: const Text('Go to Account',
                    style: TextStyle(decoration: TextDecoration.underline))),
            const SizedBox(height: 10),
            InkWell(
                onTap: () {
                  ref.watch(PageProvider.pageProvider.notifier).setPage('settings');

                  Navigator.pushNamed(context, '/main');
                },
                child: const Text('Go to Settings',
                    style: TextStyle(decoration: TextDecoration.underline))),
            const SizedBox(height: 10),
            EmailWidget()
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
