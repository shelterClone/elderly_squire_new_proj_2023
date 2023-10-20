class IDUsers {
  String? applicationtype;
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


  IDUsers({
    required this.applicationtype,
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


// Users.fromJson(Map<String, dynamic>json){
//   firstname = json['firstname'];
//   middle = json['middlename'];
//   surname = json['surname'];
//   sex =json['gender'];
//   address = json['address'];
//   email = json['email'];
//   // contact_number = json['contactnum'];
//   uid = json['uid'];
// }
//
// Map<String, dynamic> toJson() {
//   return {
//     "First Name":firstname,
//     "Middle":middle,
//     "Last Name":surname,
//     "Sex": sex,
//     "Address":address,
//     "email":email,
//     // "contact number":contact_number,
//     "uid":uid,
//   };


}