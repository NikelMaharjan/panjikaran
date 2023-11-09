


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/constants/sizes.dart';
import 'package:model/models/dashboard/birth_count.dart';
import 'package:model/models/test.dart';
import 'package:model/provider/auth_provider.dart';
import 'package:model/services/dashboard_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowDashBoard extends ConsumerWidget {


  @override
  Widget build(BuildContext context, ref) {


    final dashboardData = ref.watch(dashboardProvider(ref.watch(authProvider).user!.token));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Dashboard"),
      ),
      body: dashboardData.when(
          data: (data){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,


              children: [

                // DataTable(
                //   columns:  [
                //
                //     DataColumn(
                //       label: Text(
                //         'Birth Count',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     DataColumn(
                //       label: Text(
                //          data.birth_count.toString()
                //       ),
                //     ),
                //
                //   ],
                //   rows: [
                //
                //     _buildDataRow(
                //         title: "Death Count",
                //         description: data.death_count.toString()
                //     ),
                //
                //     _buildDataRow(
                //         title: "Marriage Count",
                //         description: data.marriage_count.toString()
                //     ),
                //
                //
                //     _buildDataRow(
                //         title: "Divorce Count",
                //         description: data.divorce_count.toString()
                //     ),
                //
                //
                //
                //
                //   ],
                // ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child:  Container(
                              height: 140,
                              child: Card(
                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.center,


                                  children: [
                                    Text(data.verified_birth_count.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    gapH10,
                                    Text("Birth Count")
                                  ],
                                ),
                              ),

                            ),
                          ),

                          Expanded(
                            child:  Container(
                              height: 140,
                              child: Card(
                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.center,


                                  children: [
                                    Text(data.death_count.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    gapH10,
                                    Text("Death Count")
                                  ],
                                ),
                              ),

                            ),
                          ),

                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child:  Container(
                              height: 140,
                              child: Card(
                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.center,


                                  children: [
                                    Text(data.marriage_count.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    gapH10,
                                    Text("Marriage Count")
                                  ],
                                ),
                              ),

                            ),
                          ),

                          Expanded(
                            child:  Container(
                              height: 140,
                              child: Card(
                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.center,


                                  children: [
                                    Text(data.divorce_count.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    gapH10,
                                    Text("Divorce Count")
                                  ],
                                ),
                              ),

                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),






                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Birth Registration Timeline", style: TextStyle(fontWeight: FontWeight.bold),),
                ),

                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <LineSeries<BirthCount, String>>[
                    LineSeries<BirthCount, String>(
                      dataSource: data.birth_count_monthwise,
                      xValueMapper: (BirthCount report, _) => report.month,
                      yValueMapper: (BirthCount report, _) => report.count,
                      dataLabelSettings: DataLabelSettings(isVisible: false),

                      width: 8 ,
                     // borderRadius: BorderRadius.only(topRight: Radius.circular(4.0), bottomRight: Radius.circular(4.0)),
                    ),
                  ],
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    header: '',
                    format: 'point.x : point.y',
                  ),
                ),






                







              ],
            );
          },
          error: (e, s) => Center(child: Text(e.toString()),),
          loading: () => Center(child: CircularProgressIndicator(),)
      ),
    );
  }


  DataRow _buildDataRow({required String title, required String description}) {
    return DataRow(
      cells: [
        DataCell(Text(title, style: TextStyle(fontWeight: FontWeight.bold),)),
        DataCell(Container(child: Text(description))),
      ],
    );
  }
}
