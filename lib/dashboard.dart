

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/home_page.dart';
import 'package:model/otp_page.dart';
import 'package:model/profile_page.dart';
import 'package:model/provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoardPage extends ConsumerWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context, ref) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: (){

             showDialog (
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius:
                  BorderRadius.all(Radius.circular(10))),
                  title: const Text('LOG OUT'),
                  content: Text('Are you sure want to logout?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('No', style: TextStyle(color: Colors.green),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Yes', style: TextStyle(color: Colors.green),),
                      onPressed: () {
                        ref.read(authProvider.notifier).userLogOut();
                        Get.offAll(HomePage());

                      },
                    ),
                  ],
                );
              },
            );


           }, icon: Icon(Icons.logout, color: Colors.white,))
        ],
      ),

      body: PersistentTabView(
        backgroundColor: Colors.green, // Default is Colors.white.

        context,
        screens: [

          ProfilePage(),
          Center(child: Text("Nikel Maharjan"),)
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style1,
      ),

    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(


        icon:  const Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon:  const Icon(CupertinoIcons.add_circled),
        title: ("Services"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.white,
      ),


    ];
  }

}
