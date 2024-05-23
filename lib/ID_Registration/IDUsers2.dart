class ID_RegUsers {
  String? applicationtype;
  String? surname;
  String? firstname;
  String? middle;
  String? address;
  String? yearsofresidence;
  String? birthplace;
  String? dateofbirth;
  String? sex;
  String? nationality;
  String? age;
  String? brgy;
  String? zone;
  String? district;
  String? status;
  String? phonenum;
  String? pension;
  String? salary;
  String? work;
  String? id;
  String? email;


  ID_RegUsers({
    required this.applicationtype,
    required this.surname,
    required this.firstname,
    required this.middle,
    required this.address,
    required this.yearsofresidence,
    required this.birthplace,
    required this.dateofbirth,
    required this.sex,
    required this.nationality,
    required this.age,
    required this.brgy,
    required this.zone,
    required this.district,
    required this.id,
    required this.status,
    required this.phonenum,
    required this.pension,
    required this.salary,
    required this.work,
    required this.email,
  });

  ID_RegUsers.fromJson(Map<String, dynamic>json){
    applicationtype = json['applicationtype'];
    surname = json['applicationtype'];
    firstname = json['firstname'];
    middle = json['middle'];
    address = json['address'];
    yearsofresidence = json['yearsofresidence'];
    birthplace = json['birthplace'];
    dateofbirth = json['dateofbirth'];
    sex = json['sex'];
    nationality = json['nationality'];
    age = json['age'];
    brgy = json['brgy'];
    zone = json['zone'];
    district = json['district'];
    id = json['id'];
    status = json['status'];
    phonenum = json['phonenum'];
    pension = json['pension'];
    salary = json['salary'];
    work = json['work'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      // "First Name":firstname,
      // "Middle":middle,
      // "Last Name":surname,
      // "Sex": sex,
      // "Address":address,
      // "email":email,
      // // "contact number":contact_number,
      // "uid":uid,
      "TypeofApplication": applicationtype,
      "SurName": surname,
      "FirstName": firstname,
      "Middle": middle,
      "Address": address,
      "YrsofResidenceInManila": yearsofresidence,
      "BirthPlace": birthplace,
      "Gender": sex,
      "Nationality": nationality,
      "Age": age,
      "Barangay": brgy,
      "Zone": zone,
      "District": district,
      "ValidIdPresented": id,
      "CivilStatus": status,
      "CellPhoneNumber": phonenum,
      "Pension": pension,
      "Salary": salary,
      "PresentWork": work,
      "Email": email
    };
  }
}


