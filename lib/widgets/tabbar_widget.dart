

import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        ListTile(
          title: Text("सम्माननीय राष्ट्रपति ज्यूको व्यक्तिगत घटना दर्ता सप्ताह सम्बन्धी शुभकामना सन्देश",
          style: TextStyle(
            fontSize: 14
          ),
          ),
          subtitle: Text("1/1/2080", style: TextStyle(color: Colors.grey),),
        ),

        ListTile(
          title: Text("सम्माननीय राष्ट्रपति ज्यूको व्यक्तिगत घटना दर्ता सप्ताह सम्बन्धी शुभकामना सन्देश",
            style: TextStyle(
                fontSize: 14
            ),
          ),
          subtitle: Text("1/1/2080", style: TextStyle(color: Colors.grey),),
        ),

        ListTile(
          title: Text("सम्माननीय राष्ट्रपति ज्यूको व्यक्तिगत घटना दर्ता सप्ताह सम्बन्धी शुभकामना सन्देश",
            style: TextStyle(
                fontSize: 14
            ),
          ),
          subtitle: Text("1/1/2080", style: TextStyle(color: Colors.grey),),
        ),
        ListTile(
          title: Text("सम्माननीय राष्ट्रपति ज्यूको व्यक्तिगत घटना दर्ता सप्ताह सम्बन्धी शुभकामना सन्देश",
            style: TextStyle(
                fontSize: 14
            ),
          ),
          subtitle: Text("1/1/2080", style: TextStyle(color: Colors.grey),),
        ),


      ],
    );
  }
}
