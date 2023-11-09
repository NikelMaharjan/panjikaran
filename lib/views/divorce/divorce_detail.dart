

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/divorce/divorce.dart';

class DivorceDetailPage extends StatelessWidget {

  final Divorce divorce;

  DivorceDetailPage({required this.divorce});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Divorce Detail"),

      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Court Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
          ),


          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'Court Type',
                  style: TextStyle(),
                ),
              ),
              DataColumn(
                label: Text(
                    divorce.court_type
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: "Court Decision No",
                  description: divorce.court_decission_no
              ),

              _buildDataRow(
                  title: "Court Decision Date",
                  description: divorce.court_decission_date
              ),



              _buildDataRow(
                  title: "Married Registration No",
                  description: divorce.married_registration_no
              ),


              _buildDataRow(
                  title: "Married Date (NP)",
                  description: divorce.married_date_bs
              ),

              _buildDataRow(
                  title: "Married Date (AD)",
                  description: divorce.married_date_ad
              ),


              _buildDataRow(
                  title: "Children With",
                  description: divorce.children_with
              ),

              _buildDataRow(
                  title: "Province",
                  description: divorce.office_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: divorce.office_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: divorce.office_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: divorce.office_ward.id.toString()
              ),







            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Husband Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
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
                    divorce.husband_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Full Name (NP)',
                  description: divorce.husband_full_name_np
              ),


              _buildDataRow(
                  title: "Birth Date",
                  description: divorce.husband_birth_date
              ),


              _buildDataRow(
                  title: "Birth Registration No",
                  description: divorce.husband_birth_registration_no
              ),


              _buildDataRow(
                  title: "Religion",
                  description: divorce.husband_religion
              ),


              _buildDataRow(
                  title: "Birth Country",
                  description: divorce.husband_birth_country
              ),

              _buildDataRow(
                  title: "Citizenship No",
                  description: divorce.husband_citizenship_no
              ),


              _buildDataRow(
                  title: "Citizenship Date",
                  description: divorce.husband_citizenship_date
              ),

              _buildDataRow(
                  title: "Issued Data",
                  description: divorce.husband_issued_date
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: divorce.husband_citizenship_country
              ),


              _buildDataRow(
                  title: "Street Name",
                  description: divorce.husband_street_name
              ),

              _buildDataRow(
                  title: "House No",
                  description: divorce.husband_house_no
              ),

              _buildDataRow(
                  title: "Education Status",
                  description: divorce.husband_education_status
              ),

              _buildDataRow(
                  title: "Mother Tongue",
                  description: divorce.husband_mother_tongue
              ),

              _buildDataRow(
                  title: "Grandfather Name (EN)",
                  description: divorce.husband_grand_father_en
              ),

              _buildDataRow(
                  title: "Grandfather Name (NP)",
                  description: divorce.husband_grand_father_np
              ),

              _buildDataRow(
                  title: "Father Name (EN)",
                  description: divorce.husband_father_name_en
              ),

              _buildDataRow(
                  title: "Father Name (NP)",
                  description: divorce.husband_father_name_np
              ),

              _buildDataRow(
                  title: "Mother Name (EN)",
                  description: divorce.husband_mother_name_en
              ),

              _buildDataRow(
                  title: "Mother Name (NP)",
                  description: divorce.husband_mother_name_np
              ),

              _buildDataRow(
                  title: "Address",
                  description: divorce.husband_address
              ),

              _buildDataRow(
                  title: "Province",
                  description: divorce.husband_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: divorce.husband_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: divorce.husband_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: divorce.husband_ward.id.toString()
              ),
















            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Wife Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
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
                    divorce.wife_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Full Name (NP)',
                  description: divorce.wife_full_name_np
              ),


              _buildDataRow(
                  title: "Birth Date",
                  description: divorce.wife_birth_date
              ),


              _buildDataRow(
                  title: "Education Status",
                  description: divorce.wife_education_status
              ),


              _buildDataRow(
                  title: "Religion",
                  description: divorce.wife_religion
              ),


              _buildDataRow(
                  title: "Mother Tongue",
                  description: divorce.wife_mother_tongue
              ),

              _buildDataRow(
                  title: "Street",
                  description: divorce.wife_street_name
              ),



              _buildDataRow(
                  title: "Tole",
                  description: divorce.wife_tole
              ),


              _buildDataRow(
                  title: "House No",
                  description: divorce.wife_house_no
              ),


              _buildDataRow(
                  title: "Birth Country",
                  description: divorce.wife_birth_country
              ),


              _buildDataRow(
                  title: "Citizenship Country",
                  description: divorce.wife_citizenship_country
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: divorce.wife_citizenship_no
              ),

              _buildDataRow(
                  title: "Citizenship Date",
                  description: divorce.wife_citizenship_date
              ),
              _buildDataRow(
                  title: "Address",
                  description: divorce.wife_address
              ),

              _buildDataRow(
                  title: "GrandFather Name (EN)",
                  description: divorce.wife_grand_father_en
              ),

              _buildDataRow(
                  title: "GrandFather Name (NP)",
                  description: divorce.wife_grand_father_np
              ),

              _buildDataRow(
                  title: "Father Name (EN)",
                  description: divorce.wife_father_name_en
              ),

              _buildDataRow(
                  title: "Father Name (NP)",
                  description: divorce.wife_father_name_np
              ),
              _buildDataRow(
                  title: "Mother Name (EN)",
                  description: divorce.wife_mother_name_en
              ),

              _buildDataRow(
                  title: "Mother Name (NP)",
                  description: divorce.wife_mother_name_np
              ),


              _buildDataRow(
                  title: "Province",
                  description: divorce.wife_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: divorce.wife_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: divorce.wife_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: divorce.wife_ward.id.toString()
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
                    divorce.witness_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Full Name (NP)',
                  description: divorce.witness_full_name_np
              ),


              _buildDataRow(
                  title: "Birth Date",
                  description: divorce.wife_birth_date
              ),


              _buildDataRow(
                  title: "Education Status",
                  description: divorce.wife_education_status
              ),


              _buildDataRow(
                  title: "Mother Tongue",
                  description: divorce.wife_mother_tongue
              ),

              _buildDataRow(
                  title: "Street",
                  description: divorce.witness_street_name
              ),



              _buildDataRow(
                  title: "Tole",
                  description: divorce.witness_tole
              ),


              _buildDataRow(
                  title: "House No",
                  description: divorce.witness_house_no
              ),


              _buildDataRow(
                  title: "Birth Country",
                  description: divorce.witness_birth_country
              ),


              _buildDataRow(
                  title: "Citizenship Country",
                  description: divorce.witness_citizenship_country
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: divorce.witness_citizenship_no
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: divorce.witness_citizenship_date
              ),


              _buildDataRow(
                  title: "Province",
                  description: divorce.witness_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: divorce.witness_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: divorce.witness_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: divorce.witness_ward.id.toString()
              ),













            ],
          ),

          // CachedNetworkImage(
          //   imageUrl: divorce.witness_photo,
          //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // )

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
