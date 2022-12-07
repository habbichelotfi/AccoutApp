import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app2/constants.dart';
import 'package:test_app2/providers/email_provider.dart';

//the account screen

class AccountView extends ConsumerStatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends ConsumerState<AccountView> {
  @override
  Widget build(BuildContext context) {
    final accountController = ref.watch(EmailProvider.provider);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tName,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 20)),
          const SizedBox(height: 10),
          const Text('Quentin', style: TextStyle(fontSize: 17)),
          const SizedBox(height: 20),
          InkWell(
              onTap: () {},
              child:const Text(tChangeName, style: TextStyle(color: Colors.blue))),
          const SizedBox(height: 25),
          Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.55,
              color: Colors.grey.shade400),
          const SizedBox(height: 25),
          Text(tEmail,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 20)),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) =>
                      input!.isValidEmail() ? null : errorEmail,
                  initialValue: accountController,
                  onFieldSubmitted: (email) {
                    ref
                        .read(EmailProvider.provider.notifier)
                        .setEmail(email);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration:const  InputDecoration(
                      border: InputBorder.none,
                      labelText: labelEmail))),
          const SizedBox(height: 25),
          Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.55,
              color: Colors.grey.shade400),
          const SizedBox(height: 25),
          Text(tPassword,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 20)),
          const SizedBox(height: 10),
          InkWell(
              onTap: () {},
              child:const Text(tChangePassword,
                  style: TextStyle(color: Colors.blue))),
          const SizedBox(height: 25),
          Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.55,
              color: Colors.grey.shade400),
          const SizedBox(height: 25),
          Text(tAccount,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 20)),
          const SizedBox(height: 15),
          InkWell(
              onTap: () {},
              child:
                 const Text(tDeleteAccount, style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
