

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


  @override
  String toString() => en_names;

}

class District {

  final int id;
  final String np_name;
  final String en_name;

  District({required this.id, required this.en_name, required this.np_name});

  factory District.fromJson (Map<String, dynamic> json){
    return District(
        id: json['id'],
        np_name: json['np_name'],
        en_name: json['en_name'],
    );
  }


  @override
  String toString() => en_name;



}


class Municipality {

  final int id;
  final String name_en;
  final String name_np;

  Municipality({required this.id, required this.name_en, required this.name_np});

  factory Municipality.fromJson (Map<String, dynamic> json){
    return Municipality(
      id: json['id'],
      name_en: json['name_en'],
      name_np: json['name_np'],
    );
  }

  @override
  String toString() => name_en;



}



class Ward {

  final int id;
  final String address;

  Ward({required this.id, required this.address});

  factory Ward.fromJson (Map<String, dynamic> json){
    return Ward(
      id: json['id'],
      address: json['address'],
    );
  }

  @override
  String toString() => address;



}


