

final ehthnic_groups = [
  "क्षेत्री",
  "ब्राह्मण",
  "मगर",
  "थारु",
  "तामाङ",
  "नेवार",
  "यादव",
  "राई",
  "गुरुङ",
  "ठकुरी",
  "लिम्बु",
  "अन्य"
];


final literacy_types = [
  'पूर्व-प्राथमिक शिक्षा',
  'आधारभूत शिक्षा (१-८)',
  'माध्यमिक तहको शिक्षा (९-१२)',
  'उच्च शिक्षा',
  'थाहा छैन',
  'अशिक्षित',
  'अन्य'
];

final matri = [
  "नेपाली",
  "हिन्दी",
  "अंग्रेजी",
  "अन्य",
];






final religions = [
  "हिन्दु",
  "बौद्ध",
  "क्रिस्चियन",
  "मुस्लिम",
  "जैन",
  "अन्य"
];

final women_status = [
  ["1", "विवाहीत", "married"],
  ["2", "अविवाहीत", "unmarried"],
  ["3", "विधवा", "Widow"]
];

final nationalities = [
  ["1", "नेपाली", "Nepali"],
  ["2", "अन्य", "Others"]
];

final marriage_status = [
  ["1", "विवाहीत", "married"],
  ["2", "अविवाहीत", "unmarried"]
];

class Nationalities {
  final String id;
  final String label;
  const  Nationalities({required this.id, required this.label});

  @override
  String toString() => label;
}



class WomenStatus {
  final String id;
  final String status;
  const  WomenStatus({required this.id, required this.status});

  @override
  String toString() => status;
}

class MStatus {
  final String id;
  final String status;
  const MStatus({required this.id, required this.status});

  @override
  String toString() => status;
}

class Religion {
  final String id;
  final String religion;
  const Religion({required this.id, required this.religion});

  @override
  String toString() => religion;
}

class Ethinic {
  final String id;
  final String ethinic;
  const Ethinic({required this.id, required this.ethinic});

  @override
  String toString() => ethinic;
}

List<Ethinic> ethinicData = ehthnic_groups.map((e) {
  return Ethinic(id: e[0], ethinic: e[2]);
}).toList();

List<Religion> religionData = religions.map((e) {
  return Religion(id: e[0], religion: e[2]);
}).toList();

List<WomenStatus> womenData = women_status.map((e) {
  return WomenStatus(id: e[0], status: e[2]);
}).toList();

List<MStatus> mStatus = marriage_status.map((e) {
  return MStatus(id: e[0], status: e[2]);
}).toList();

List<Nationalities> nationalData = nationalities.map((e) {
  return Nationalities(id: e[0], label: e[1]);
}).toList();

class Province {
  final int id;
  final String np_name;
  final String en_name;
  const Province({required this.id, required this.en_name, required this.np_name});

  factory Province.fromJson(Map<String, dynamic> json){
    return Province(
        id: json['id'],
        en_name: json['en_name'],
        np_name: json['np_name']
    );
  }
  @override
  String toString() => np_name;
}

class District {
  final int id;
  final String np_name;
  final String en_name;

  const  District({
    required this.id,
    required this.np_name,
    required this.en_name
  });

  factory District.fromJson(Map<String, dynamic> json){
    return District(
      id: json['id'],
      np_name: json['np_name'],
      en_name: json['en_name'],
    );
  }

  @override
  String toString() => np_name;
}

class Municipality {
  final int id;
  final String np_name;
  final String en_name;
  const  Municipality(
      {
        required this.id,
        required this.en_name,
        required this.np_name,
      });

  factory  Municipality.fromJson(Map<String, dynamic> json){
    return  Municipality(
      id: json['id'],
      np_name: json['np_name'],
      en_name: json['en_name'],
    );
  }


  @override
  String toString() => np_name;
}

class Ward {
  final int id;
  final String np_name;
  final String en_name;
  final String number;
  const  Ward(
      {
        required this.id,
        required this.en_name,
        required this.np_name,
        required this.number
      });

  factory  Ward.fromJson(Map<String, dynamic> json){
    return  Ward(
        id: json['id'],
        np_name: json['np_name'],
        en_name: json['en_name'],
        number: '${json['number']}' ?? ''
    );
  }


  @override
  String toString() => number;
}




class GenderTypes {

  final String id;
  final String label;

  const  GenderTypes({
    required this.id,
    required this.label,
  });

  factory GenderTypes.fromJson(Map<String, dynamic> json){
    return GenderTypes(
        id: json['id'],
        label: json['label']
    );
  }

  factory GenderTypes.empty(){
    return GenderTypes(
        id: '',
        label: ''
    );
  }

  @override
  String toString() => label;
}




