class Users{
    String? firstname;
    String? middle;
    String? surname;
    String? sex;
    String? address;
    String? email;
    // String? contact_number;
    String? uid;


  Users({
    required this.firstname,
    required this.middle,
    required this.surname,
    required this.sex,
    required this.address,
    required this.email,
    // required this.contact_number,
    required this.uid});

   Users.fromJson(Map<String, dynamic>json){
    firstname = json['firstname'];
    middle = json['middlename'];
    surname = json['surname'];
    sex =json['gender'];
    address = json['address'];
    email = json['email'];
    // contact_number = json['contactnum'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    return {
      "First Name":firstname,
      "Middle":middle,
      "Last Name":surname,
      "Sex": sex,
      "Address":address,
      "email":email,
      // "contact number":contact_number,
      "uid":uid,
    };


  }}

