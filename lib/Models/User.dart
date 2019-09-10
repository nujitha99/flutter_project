class User{
  //String userId;
  //String userName;
  //String userContact;
  String userMail;
  String userPassword;
  User({this.userMail,this.userPassword});
  factory User.fromJson(Map<String,dynamic> json){
    return User(
        userMail: json['userMail'],
        userPassword: json['userPassword']
    );
  }
}