class Users{
    String? firstname;
    String? middle;
    String? lastname;
    String? gender;
    String? address;
    String? email;
    // String? contact_number;
    String? uid;


  Users({
    required this.firstname,
    required this.middle,
    required this.lastname,
    required this.gender,
    required this.address,
    required this.email,
    // required this.contact_number,
    required this.uid});

   Users.fromJson(Map<String, dynamic>json){
    firstname = json['firstname'];
    middle = json['middlename'];
    lastname = json['lastname'];
    gender =json['gender'];
    address = json['address'];
    email = json['email'];
    // contact_number = json['contactnum'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    return {
      "First Name":firstname,
      "Middle":middle,
      "Last Name":lastname,
      "Gender": gender,
      "Address":address,
      "email":email,
      // "contact number":contact_number,
      "uid":uid,
    };


  }}

