

class Provincee {

  final int id;
  final String en_names;
  final String np_name;
  final int province_no;


  Provincee({required this.id, required this.en_names, required this.np_name, required this.province_no});


  factory Provincee.fromJson (Map<String, dynamic> json){
    return Provincee(
        id: json['id'],
        en_names: json['en_names'],
        np_name: json['np_name'],
        province_no: json['province_no']
    );
  }


  @override
  String toString() => en_names;

}

class Districtt {

  final int id;
  final String np_name;
  final String en_name;

  Districtt({required this.id, required this.en_name, required this.np_name});

  factory Districtt.fromJson (Map<String, dynamic> json){
    return Districtt(
        id: json['id'],
        np_name: json['np_name'],
        en_name: json['en_name'],
    );
  }


  @override
  String toString() => en_name;



}


class Municipalityy {

  final int id;
  final String name_en;
  final String name_np;

  Municipalityy({required this.id, required this.name_en, required this.name_np});

  factory Municipalityy.fromJson (Map<String, dynamic> json){
    return Municipalityy(
      id: json['id'],
      name_en: json['name_en'],
      name_np: json['name_np'],
    );
  }

  @override
  String toString() => name_en;



}



class Wardd {

  final int id;
  final String address;

  Wardd({required this.id, required this.address});

  factory Wardd.fromJson (Map<String, dynamic> json){
    return Wardd(
      id: json['id'],
      address: json['address'],
    );
  }

  @override
  String toString() => id.toString();



}


