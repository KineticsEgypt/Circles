
import 'enums/user_types.dart';

class User{
  String id;
  String name;
  String password;
  String email;
  String phoneNumber;
  UsersTypes userType;
  String description;
  String image;
  String token;
  String firebaseToken;
  double rate;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.userType = UsersTypes.customer,
    this.description,
    this.image,
    this.token,
    this.rate,
    this.firebaseToken,
  });

  Future<Map<String, String>> toLoginJson() async {
    //if(FirebaseNotificationManger.token == null) await FirebaseNotificationManger.getToken();
    return {
      "email":email,
      "pass":password,
      //"firebase_token":FirebaseNotificationManger.token,
    };
  }

  Future<Map<String, String>> toRegisterJson() async {
    //if(FirebaseNotificationManger.token == null) await FirebaseNotificationManger.getToken();
    return {
      "name": name,
      "email":email,
      "phone":phoneNumber,
      "pass":password,
      //"firebase_token":FirebaseNotificationManger.token,
    };
  }

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "name": name,
      "desc": description,
      "email":email,
      "phone":phoneNumber,
      "password":password,
      "user_type":userType.index.toString(),
      "image":image,
      "user_token":token,
      "firebase_token": firebaseToken,
    };
  }

  fromUser(User newUser){
    id = newUser.id;
    name = newUser.name;
    description = newUser.description;
    email = newUser.email;
    phoneNumber = newUser.phoneNumber;
    userType = newUser.userType;
    image = newUser.image;
    rate = newUser.rate;
    firebaseToken = newUser.firebaseToken;
  }

  factory User.fromJson(Map<String,dynamic> parsedJson){
    return User(
      id: parsedJson["id"],
      name: parsedJson["name"] ??  parsedJson["title"],
      email: parsedJson["email"],
      password: parsedJson["pass"],
      image: parsedJson["image"],
      phoneNumber: parsedJson["phone"] ?? parsedJson["phone_no"],
      token: parsedJson["user_token"],
      userType: UsersTypes.values[int.tryParse(parsedJson['user_type'].toString() ?? "2") ?? 2],
      description: parsedJson['desc'],
      firebaseToken: parsedJson['firebase_token'],
      rate: double.tryParse( parsedJson['rating'] ?? "-1.0") ?? -1.0,
    );
  }
}