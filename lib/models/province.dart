




class Province {

  final int id;
  final String en_names;
  final String np_name;
  final int province_no;


  Province({required this.id, required this.en_names, required this.np_name, required this.province_no});


  factory Province.fromJson (Map<String, dynamic> json){
    return Province(
        id: json['id'],
        en_names: json['en_names'],
        np_name: json['np_name'],
        province_no: json['province_no']
    );
  }

}