

import 'package:flutter/material.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/death/death.dart';

class DeathDetailPage extends StatelessWidget {

  final Death death;

  DeathDetailPage({required this.death});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Death Detail"),

      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Personal Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
          ),


          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'Name (EN)',
                  style: TextStyle(),
                ),
              ),
              DataColumn(
                label: Text(
                    death.death_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: "Name (NP)",
                  description: death.death_full_name_np
              ),

              _buildDataRow(
                  title: "Birth Registration",
                  description: death.birth_registration_no
              ),



              _buildDataRow(
                  title: "Birth Date (EN)",
                  description: death.birth_date_ad
              ),


              _buildDataRow(
                  title: "Birth Date (NP)",
                  description: death.birth_date_bs
              ),

              _buildDataRow(
                  title: "Death Date (EN)",
                  description: death.dead_date_bs
              ),


              _buildDataRow(
                  title: "Death Date (NP)",
                  description: death.dead_date_ad
              ),


              _buildDataRow(
                  title: "Death Place",
                  description: death.dead_place
              ),

              _buildDataRow(
                  title: "Death Reason",
                  description: death.dead_reason
              ),


              _buildDataRow(
                  title: "Address",
                  description: death.address
              ),


              _buildDataRow(
                  title: "House No",
                  description: death.house_no
              ),

              _buildDataRow(
                  title: "Tole",
                  description: death.tole
              ),


              _buildDataRow(
                  title: "Citizenship No",
                  description: death.citizenship_no
              ),

              _buildDataRow(
                  title: "Married",
                  description: death.is_married.toString()
              ),

              _buildDataRow(
                  title: "Religion",
                  description: death.religion
              ),


              _buildDataRow(
                  title: "Cast",
                  description: death.cast
              ),

              _buildDataRow(
                  title: "Mother Tongue",
                  description: death.mother_tongue
              ),











            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Parents Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
          ),


          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'GrandFather Name (EN)',
                  style: TextStyle(),
                ),
              ),
              DataColumn(
                label: Text(
                    death.grandfather_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'GrandFather Name (NP)',
                  description: death.grandfather_full_name_np
              ),

              _buildDataRow(
                  title: "Father Name (EN)",
                  description: death.father_full_name_en
              ),



              _buildDataRow(
                  title: "Father Name (NP)",
                  description: death.father_full_name_np
              ),


              _buildDataRow(
                  title: "Mother Name (EN)",
                  description: death.mother_full_name_en
              ),

              _buildDataRow(
                  title: "Mother Name (NP)",
                  description: death.mother_full_name_np
              ),


              _buildDataRow(
                  title: "Death Date (NP)",
                  description: death.dead_date_ad
              ),


              _buildDataRow(
                  title: "Death Place",
                  description: death.dead_place
              ),


              _buildDataRow(
                  title: "Address",
                  description: death.address
              ),


              _buildDataRow(
                  title: "House No",
                  description: death.house_no
              ),

              _buildDataRow(
                  title: "Tole",
                  description: death.tole
              ),


              _buildDataRow(
                  title: "Citizenship No",
                  description: death.citizenship_no
              ),

              _buildDataRow(
                  title: "Married",
                  description: death.is_married.toString()
              ),

              _buildDataRow(
                  title: "Religion",
                  description: death.religion
              ),


              _buildDataRow(
                  title: "Cast",
                  description: death.cast
              ),

              _buildDataRow(
                  title: "Mother Tongue",
                  description: death.mother_tongue
              ),











            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Witness Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
          ),


          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'Full Name (EN)',
                  style: TextStyle(),
                ),
              ),
              DataColumn(
                label: Text(
                    death.witness_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Full Name (NP)',
                  description: death.witness_full_name_np
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: death.witness_citizenship_country
              ),



              _buildDataRow(
                  title: "Citizenship No",
                  description: death.witness_citizenship_no
              ),


              _buildDataRow(
                  title: "Citizenship Data",
                  description: death.witness_citizenship_date
              ),

              _buildDataRow(
                  title: 'Province',
                  description: death.witness_ward.municipality.district.en_name
              ),


              _buildDataRow(
                  title: 'District',
                  description: death.witness_ward.municipality.district.en_name
              ),

              _buildDataRow(
                  title: "Municipality",
                  description: death.witness_ward.municipality.name_en
              ),



              _buildDataRow(
                  title: "Ward",
                  description: death.witness_ward.id.toString()
              ),







            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Office Location", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
          ),


          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'Office Province',
                  style: TextStyle(),
                ),
              ),
              DataColumn(
                label: Text(
                    death.office_ward.municipality.district.province.en_names
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Office District',
                  description: death.office_ward.municipality.district.en_name
              ),

              _buildDataRow(
                  title: "Office Municipality",
                  description: death.office_ward.municipality.name_en
              ),



              _buildDataRow(
                  title: "Office Ward",
                  description: death.office_ward.id.toString()
              ),






            ],
          ),















        ],
      ),
    );
  }

  DataRow _buildDataRow({required String title, required String description}) {
    return DataRow(
      cells: [
        DataCell(Text(title, style: TextStyle(),)),
        DataCell(Container(child: Text(description))),
      ],
    );
  }
}
