import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/count.dart';
import 'package:model/dashboard.dart';
import 'package:model/auth_page.dart';

import 'provider/auth_provider.dart';






class StatusPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer(
            builder: (context, ref, child) {
              final authData = ref.watch(authProvider);
              return authData.user == null ? AuthPage() : DashBoardPage();
            }
        )
    );
  }
}