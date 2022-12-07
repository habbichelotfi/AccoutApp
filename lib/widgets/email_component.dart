import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/email_provider.dart';

//to display the email in the first screen ,not necessary but i was learned how to use riverpod with consumerwidget

class EmailWidget extends ConsumerWidget{
  const EmailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountController=ref.watch(EmailProvider.provider);
    return Text(accountController);

  }

}