




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/divorce/divorce.dart';
import 'package:model/models/marriage/marriage.dart';
import 'package:model/views/marriage/marriage_detail_page.dart';
import 'package:model/views/marriage/marriage_detail_page.dart';

class MarriageDetailPage extends StatelessWidget {

  final Marriage marriage;

  MarriageDetailPage({required this.marriage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Marriage Detail"),

      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Marriage Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
          ),


          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'Social Tradition Marriage',
                  style: TextStyle(),
                ),
              ),
              DataColumn(
                label: Text(
                    marriage.is_social_tradtion.toString()
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: "Law Marriage",
                  description: marriage.is_law.toString()
              ),

              _buildDataRow(
                  title: "Married Date (EN)",
                  description: marriage.married_date_ad
              ),



              _buildDataRow(
                  title: "Married Date (BS)",
                  description: marriage.married_date_bs
              ),


              _buildDataRow(
                  title: "Married Street",
                  description: marriage.married_street_name
              ),

              _buildDataRow(
                  title: "Married Tole",
                  description: marriage.married_tole
              ),


              _buildDataRow(
                  title: "Married House No",
                  description: marriage.married_house_no
              ),
              _buildDataRow(
                  title: "Married Address (EN)",
                  description: marriage.married_address_np
              ),
              _buildDataRow(
                  title: "Married Address (NP)",
                  description: marriage.married_address_en
              ),

              _buildDataRow(
                  title: "Office Province",
                  description: marriage.office_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "Office District",
                  description: marriage.office_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Office Municipality",
                  description: marriage.office_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Office Ward",
                  description: marriage.office_ward.id.toString()
              ),







            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Groom Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
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
                    marriage.groom_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Full Name (NP)',
                  description: marriage.groom_full_name_np
              ),


              _buildDataRow(
                  title: "Birth Date",
                  description: marriage.groom_birth_date
              ),


              _buildDataRow(
                  title: "Groom Marriage",
                  description: marriage.is_groom_married.toString()
              ),

              _buildDataRow(
                  title: "Education Status",
                  description: marriage.groom_education_status
              ),


              _buildDataRow(
                  title: "Occupation",
                  description: marriage.groom_occupation
              ),





              _buildDataRow(
                  title: "Religion",
                  description: marriage.groom_religion
              ),



              _buildDataRow(
                  title: "Street Name",
                  description: marriage.groom_street_name
              ),


              _buildDataRow(
                  title: "Tole",
                  description: marriage.groom_tole
              ),


              _buildDataRow(
                  title: "House No",
                  description: marriage.groom_house_no
              ),


              _buildDataRow(
                  title: "House No",
                  description: marriage.groom_house_no
              ),




              _buildDataRow(
                  title: "Birth Country",
                  description: marriage.groom_birth_country
              ),


              _buildDataRow(
                  title: "Citizenship Country",
                  description: marriage.groom_citizenship_country
              ),
              _buildDataRow(
                  title: "Citizenship No",
                  description: marriage.groom_citizenship_no
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: marriage.groom_citizenship_country
              ),

              _buildDataRow(
                  title: "Citizenship Date",
                  description: marriage.groom_citizenship_date
              ),

              _buildDataRow(
                  title: "Address",
                  description: marriage.groom_address
              ),






              _buildDataRow(
                  title: "Mother Tongue",
                  description: marriage.groom_mother_tongue
              ),

              _buildDataRow(
                  title: "Grandfather Name (EN)",
                  description: marriage.groom_grand_father_en
              ),

              _buildDataRow(
                  title: "Grandfather Name (NP)",
                  description: marriage.groom_grand_father_np
              ),

              _buildDataRow(
                  title: "Father Name (EN)",
                  description: marriage.groom_father_name_en
              ),

              _buildDataRow(
                  title: "Father Name (NP)",
                  description: marriage.groom_father_name_en
              ),

              _buildDataRow(
                  title: "Mother Name (EN)",
                  description: marriage.groom_mother_name_en
              ),

              _buildDataRow(
                  title: "Mother Name (NP)",
                  description: marriage.groom_mother_name_np
              ),



              _buildDataRow(
                  title: "Province",
                  description: marriage.groom_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: marriage.groom_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: marriage.groom_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: marriage.groom_ward.id.toString()
              ),



            ],
          ),


          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Bride Details", style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),),
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
                    marriage.bride_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Full Name (NP)',
                  description: marriage.bride_full_name_np
              ),


              _buildDataRow(
                  title: "Birth Date",
                  description: marriage.bride_birth_date
              ),


              _buildDataRow(
                  title: "Groom Marriage",
                  description: marriage.is_bride_married.toString()
              ),

              _buildDataRow(
                  title: "Education Status",
                  description: marriage.bride_education_status
              ),


              _buildDataRow(
                  title: "Occupation",
                  description: marriage.bride_occupation
              ),





              _buildDataRow(
                  title: "Religion",
                  description: marriage.bride_religion
              ),



              _buildDataRow(
                  title: "Street Name",
                  description: marriage.bride_street_name
              ),


              _buildDataRow(
                  title: "Tole",
                  description: marriage.bride_tole
              ),


              _buildDataRow(
                  title: "House No",
                  description: marriage.bride_house_no
              ),


              _buildDataRow(
                  title: "House No",
                  description: marriage.bride_birth_country
              ),




              _buildDataRow(
                  title: "Birth Country",
                  description: marriage.bride_citizenship_country
              ),


              _buildDataRow(
                  title: "Citizenship Country",
                  description: marriage.bride_citizenship_no
              ),
              _buildDataRow(
                  title: "Citizenship No",
                  description: marriage.groom_citizenship_no
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: marriage.groom_citizenship_country
              ),

              _buildDataRow(
                  title: "Citizenship Date",
                  description: marriage.bride_citizenship_date
              ),

              _buildDataRow(
                  title: "Address",
                  description: marriage.bride_address
              ),






              _buildDataRow(
                  title: "Mother Tongue",
                  description: marriage.bride_mother_tongue
              ),

              _buildDataRow(
                  title: "Grandfather Name (EN)",
                  description: marriage.bride_grand_father_en
              ),

              _buildDataRow(
                  title: "Grandfather Name (NP)",
                  description: marriage.bride_grand_father_np
              ),

              _buildDataRow(
                  title: "Father Name (EN)",
                  description: marriage.bride_father_name_en
              ),

              _buildDataRow(
                  title: "Father Name (NP)",
                  description: marriage.bride_father_name_np
              ),

              _buildDataRow(
                  title: "Mother Name (EN)",
                  description: marriage.bride_mother_name_en
              ),

              _buildDataRow(
                  title: "Mother Name (NP)",
                  description: marriage.bride_mother_name_np
              ),



              _buildDataRow(
                  title: "Province",
                  description: marriage.bride_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: marriage.bride_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: marriage.bride_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: marriage.bride_ward.id.toString()
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
                    marriage.witness_full_name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: 'Full Name (NP)',
                  description: marriage.witness_full_name_np
              ),


              _buildDataRow(
                  title: "Birth Date",
                  description: marriage.witness_citizenship_date
              ),





              _buildDataRow(
                  title: "Street",
                  description: marriage.witness_street_name
              ),



              _buildDataRow(
                  title: "Tole",
                  description: marriage.witness_tole
              ),


              _buildDataRow(
                  title: "House No",
                  description: marriage.witness_house_no
              ),


              _buildDataRow(
                  title: "Birth Country",
                  description: marriage.witness_birth_country
              ),


              _buildDataRow(
                  title: "Citizenship Country",
                  description: marriage.witness_citizenship_country
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: marriage.witness_citizenship_no
              ),

              _buildDataRow(
                  title: "Citizenship Country",
                  description: marriage.witness_citizenship_date
              ),


              _buildDataRow(
                  title: "Province",
                  description: marriage.witness_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: marriage.witness_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: marriage.witness_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: marriage.witness_ward.id.toString()
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
