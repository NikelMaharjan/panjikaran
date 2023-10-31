

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/count.dart';
import 'package:model/home_page.dart';
import 'package:model/models/user.dart';
import 'package:model/status_page.dart';

import 'firebase_options.dart';

final box = Provider<User?>((ref) => null);



Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  await Hive.initFlutter();
  await Hive.openBox<String?>('user');
  final user = Hive.box<String?>('user');
  final userData  = user.get('userInfo');

  await Hive.openBox<String?>('fcm_token');

  final fcm_token = Hive.box<String?>('fcm_token');

  await Hive.openBox<String?>('token');



  await Hive.openBox<String?>('phone_number');




  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _firebaseMessaging.getToken().then((token){
    fcm_token.put('fcm_token', token);
  });




  runApp(ProviderScope(
      overrides: [

        box.overrideWithValue(userData == null ? null : User.fromJson(jsonDecode(userData))),

      ],
      child: Main()
  )
  );
}






class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final height =    MediaQuery.of(context).size.height;
    final width =    MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      designSize:  Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return GetMaterialApp(
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'Poppins',
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,

                    ))
            ),
            debugShowCheckedModeBanner: false,
            home: StatusPage()
        );
      },
    );
  }
}
