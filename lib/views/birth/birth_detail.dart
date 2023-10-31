

import 'package:flutter/material.dart';
import 'package:model/models/birth/birth.dart';

class BirthDetailPage extends StatelessWidget {

  final Birth birth;

  BirthDetailPage({required this.birth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birth Detail"),

      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Personal Details", style: TextStyle(fontSize: 20, letterSpacing: 2),),
          ),


          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'Name (EN)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  birth.name_en
                ),
              ),

            ],
            rows: [

              _buildDataRow(
                  title: "Name (NP)",
                  description: birth.name_np
              ),


              _buildDataRow(
                  title: "Birth Date (EN)",
                  description: birth.birth_date_en
              ),


              _buildDataRow(
                  title: "Birth Date (NP)",
                  description: birth.birth_date_np
              ),


              _buildDataRow(
                  title: "Birth Place",
                  description: birth.birth_place
              ),


              _buildDataRow(
                  title: "Birth Assistant",
                  description: birth.birth_assistant
              ),


              _buildDataRow(
                  title: "Gender",
                  description: birth.gender
              ),

              _buildDataRow(
                  title: "Ethinicity",
                  description: birth.ethnicity
              ),


              _buildDataRow(
                  title: "Birth Type",
                  description: birth.birth_type
              ),

              _buildDataRow(
                  title: "Disability",
                  description: birth.is_disable.toString()
              ),

              _buildDataRow(
                  title: "Detail Disability",
                  description: birth.details_disability.toString()
              ),

              _buildDataRow(
                  title: "Province",
                  description: birth.ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: birth.ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: birth.ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: birth.ward.id.toString()
              ),




              _buildDataRow(
                  title: "Foreign Address (NP)",
                  description: birth.foreign_address_en
              ),

              _buildDataRow(
                  title: "Foreign Address (EN)",
                  description: birth.foreign_address_en
              ),

              _buildDataRow(
                  title: "GrandFather First Name",
                  description: birth.grandfather_first_name
              ),

              _buildDataRow(
                  title: "GrandFather Middle Name",
                  description: birth.grandfather_middle_name.toString()
              ),

              _buildDataRow(
                  title: "GrandFather Last Name",
                  description: birth.grandfather_last_name
              ),
              
              






            ],
          ),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text("Father Details", style: TextStyle(fontSize: 20, letterSpacing: 2),),
          ),

          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'First Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                    birth.father_first_name
                ),
              ),

            ],
            rows: [


              _buildDataRow(
                  title: "Middle Name",
                  description: birth.father_middle_name.toString()
              ),
              _buildDataRow(
                  title: "Last Name",
                  description: birth.father_last_name
              ),



              _buildDataRow(
                  title: "Province",
                  description: birth.father_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: birth.father_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: birth.father_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: birth.father_ward.id.toString()
              ),





              _buildDataRow(
                  title: "Street Name",
                  description: birth.father_street_name
              ),

              _buildDataRow(
                  title: "Father tole",
                  description: birth.father_tole
              ),

              _buildDataRow(
                  title: "House Number",
                  description: birth.father_house_no
              ),
              _buildDataRow(
                  title: "Age",
                  description: birth.father_age
              ),
              _buildDataRow(
                  title: "Birth Country",
                  description: birth.father_birth_country
              ),
              _buildDataRow(
                  title: "CitizenShip Country",
                  description: birth.father_citizenship_country
              ),
              _buildDataRow(
                  title: "CitizenShip Number",
                  description: birth.father_citizenship_no
              ),

              _buildDataRow(
                  title: "CitizenShip Date",
                  description: birth.father_citizenship_date
              ),
              _buildDataRow(
                  title: "Passport",
                  description: birth.father_passport
              ),
              _buildDataRow(
                  title: "Education",
                  description: birth.father_education_status
              ),
              _buildDataRow(
                  title: "Occupation",
                  description: birth.father_occupation
              ),
              _buildDataRow(
                  title: "Religion",
                  description: birth.father_religion
              ),
              _buildDataRow(
                  title: "Mother Tongue",
                  description: birth.father_mothertongue
              ),



















            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text("Mother Details", style: TextStyle(fontSize: 20, letterSpacing: 2),),
          ),

          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'First Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                    birth.mother_first_name
                ),
              ),

            ],
            rows: [


              _buildDataRow(
                  title: "Middle Name",
                  description: birth.mother_middle_name.toString()
              ),
              _buildDataRow(
                  title: "Last Name",
                  description: birth.mother_last_name
              ),



              _buildDataRow(
                  title: "Province",
                  description: birth.mother_ward.municipality.district.province.np_name
              ),
              _buildDataRow(
                  title: "District",
                  description: birth.mother_ward.municipality.district.np_name
              ),
              _buildDataRow(
                  title: "Municipality",
                  description: birth.mother_ward.municipality.name_np
              ),

              _buildDataRow(
                  title: "Ward",
                  description: birth.mother_ward.id.toString()
              ),





              _buildDataRow(
                  title: "Street Name",
                  description: birth.mother_street_name
              ),

              _buildDataRow(
                  title: "Father tole",
                  description: birth.mother_tole
              ),

              _buildDataRow(
                  title: "House Number",
                  description: birth.mother_house_no
              ),
              _buildDataRow(
                  title: "Age",
                  description: birth.mother_age
              ),
              _buildDataRow(
                  title: "Birth Country",
                  description: birth.mother_birth_country
              ),
              _buildDataRow(
                  title: "CitizenShip Country",
                  description: birth.mother_citizenship_country
              ),
              _buildDataRow(
                  title: "CitizenShip Number",
                  description: birth.mother_citizenship_no
              ),

              _buildDataRow(
                  title: "CitizenShip Date",
                  description: birth.mother_citizenship_date
              ),
              _buildDataRow(
                  title: "Passport",
                  description: birth.mother_passport
              ),
              _buildDataRow(
                  title: "Education",
                  description: birth.mother_education_status
              ),
              _buildDataRow(
                  title: "Occupation",
                  description: birth.mother_occupation
              ),
              _buildDataRow(
                  title: "Religion",
                  description: birth.mother_religion
              ),
              _buildDataRow(
                  title: "Mother Tongue",
                  description: birth.mother_mothertongue
              ),

              _buildDataRow(
                  title: "Married Registration Number",
                  description: birth.married_registration_no
              ),


              _buildDataRow(
                  title: "Married Date (EN)",
                  description: birth.married_date_ad
              ),

              _buildDataRow(
                  title: "Married Date (NP)",
                  description: birth.married_date_bs
              ),

              _buildDataRow(
                  title: "Total Birth Child",
                  description: birth.total_birth_child.toString()
              ),

              _buildDataRow(
                  title: "Total Alive Child",
                  description: birth.total_alive_child.toString()
              ),





            ],
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text("Witness Details", style: TextStyle(fontSize: 20, letterSpacing: 2),),
          ),

          DataTable(
            columns:  [

              DataColumn(
                label: Text(
                  'Name (EN)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                    birth.witness_full_name_en
                ),
              ),

            ],
            rows: [


              _buildDataRow(
                  title: "Name (NP)",
                  description: birth.witness_full_name_np
              ),



              _buildDataRow(
                  title: "Ward",
                  description: birth.witness_ward.toString()
              ),



              _buildDataRow(
                  title: "Street Name",
                  description: birth.witness_street_name
              ),

              _buildDataRow(
                  title: "Father tole",
                  description: birth.witness_tole
              ),

              _buildDataRow(
                  title: "House Number",
                  description: birth.witness_house_no
              ),
              _buildDataRow(
                  title: "Age",
                  description: birth.witness_birth_country
              ),
              _buildDataRow(
                  title: "Birth Country",
                  description: birth.witness_citizenship_country
              ),
              _buildDataRow(
                  title: "Citizenship Country",
                  description: birth.witness_citizenship_country
              ),
              _buildDataRow(
                  title: "Citizenship Number",
                  description: birth.witness_citizenship_no
              ),

              _buildDataRow(
                  title: "Citizenship Number",
                  description: birth.witness_citizenship_date
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
                DataCell(Text(title, style: TextStyle(fontWeight: FontWeight.bold),)),
                DataCell(Container(child: Text(description))),
              ],
            );
  }
}
