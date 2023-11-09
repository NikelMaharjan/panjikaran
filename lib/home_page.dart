

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:model/constants/sizes.dart';
import 'package:model/data.dart';
import 'package:model/models/images.dart';
import 'package:model/models/notice.dart';
import 'package:model/views/darta_main_page.dart';
import 'package:model/widgets/detail_page.dart';
import 'package:model/widgets/tabbar_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset("assets/images/logo.png"),
        ),
        title: Text("Home Page"),
      ),

      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                CarouselSlider(

                  options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      viewportFraction: 0.8,

                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn

                  ),
                  items: imageList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.asset(i.image),
                        );
                      },
                    );
                  }).toList(),
                ),

                gapH16,



                Text("नेपाल सरकार", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

                gapH7,
                Text("ग्रीह मन्त्राल्य ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),


                gapH7,



                Text("परिचयपत्र राष्ट्रिय तथा पञ्जीकरण बिभाग", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

                gapH16,

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child:   Text.rich(
                    TextSpan(
                      children: [

                        TextSpan(
                          text: "मिति २०७५/०६/२८ मा स्थापित यस राष्ट्रिय परिचयपत्र तथा पञ्जिकरण विभागले पहिलो कानुनी अधिकार स्थापना गर्ने “व्यक्तिगत घटनादर्ता” कार्य साथै नेपाल सरकारका अत्यन्त लोकप्रिय दुई ठूला कार्यक्रमहरु; सामाजिक सुरक्षाअन्तर्गत “नगद प्रवाह” र व्यक्तिहरुको डिजिटल पहिचान (Digital Identity) स्थापना गर्ने बहुउपयोगी “राष्ट्रिय परिचयपत्र” वितरण कार्यको जिम्मेवारी सम्हाल्दै आएको छ ।",
                        ),

                        TextSpan(

                          text: ' थप हर्नुहोस',
                          style: TextStyle(
                            color: Colors.green,
                            fontStyle: FontStyle.italic
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => DetailPage(), transition: Transition.leftToRight),
                        ),
                      ],
                    ),
                  ),
                ),

                gapH24,



                Text("सुचना", style: TextStyle(fontWeight: FontWeight.bold),),


                CarouselSlider(
                  options: CarouselOptions(
                      height: 90.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      viewportFraction: 0.8,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn
                  ),
                  items: noticeList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          child: Container(
                            width: 400,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(i.text),
                              )
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                gapH24,
                
                TabBar(
                  tabs: [
                    Tab(
                      text: "सुचना",
                    ),
                    Tab(
                      text: "प्रकाशन",
                    ),

                      Tab(
                         text: "प्रेस",
                       ),

                    Tab(
                      text: "निर्देशन",
                    ),
                  ],
                ),

                Card(
                  child: Container(
                    
                    height: 340,
                    child: TabBarView(children: [
                      TabBarWidget(),
                      TabBarWidget(),
                      TabBarWidget(),
                      TabBarWidget(),

                    ]
                    ),
                  ),
                ),

                gapH10,

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1.9,
                          crossAxisSpacing: 6,
                          childAspectRatio: 3 / 3.2
                      ),
                      itemCount: dataList.length,
                      itemBuilder: (context, index){

                        return Card(
                          child: Container(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  Text(dataList[index].count, style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),),
                                  Text(dataList[index].desc, style: TextStyle(
                                    fontSize: 14
                                  ),),

                                ],
                              ),
                            ),

                          ),
                        );

                      }
                  ),
                ),




            ],

            ),
          ),
        ),
      ),
    );
  }
}
