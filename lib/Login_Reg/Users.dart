class Users{
    String? firstname;
    String? middle;
    String? surname;
    String? sex;
    String? address;
    String? email;
    // String? username;
    String? password;
    // String? contact_number;
    String? uid;


  Users({
    required this.firstname,
    required this.middle,
    required this.surname,
    required this.sex,
    required this.address,
    required this.email,
    // required this.username,
    required this.password,

    // required this.contact_number,
    required this.uid});

   Users.fromJson(Map<String, dynamic>json){
    firstname = json['firstname'];
    middle = json['middlename'];
    surname = json['surname'];
    sex =json['gender'];
    address = json['address'];
    email = json['email'];
    // username = json['username'];
    password = json['password'];
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
      // "username":username,
      "password":password,
      // "contact number":contact_number,
      "uid":uid,
    };


  }}

