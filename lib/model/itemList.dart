// import 'package:json_annotation/json_annotation.dart';
//
// @JsonSerializable()
// class Item {
//   @JsonKey(name:'id')
//   String? id;
//
//   @JsonKey(name: 'first_name')
//   String? firstName;
//
//   @JsonKey(name: 'last_name')
//   String? lastName;
//
//   @JsonKey(name: 'email')
//   String? email;
//
//   @JsonKey(name: 'user_image')
//   String? userImage;
//
//   User(
//       {required this.firstName,
//         this.lastName,
//         required this.phoneNumber,
//         this.email,
//         this.authToken,this.passWord,
//         this.countryName,
//         this.countryCode});
//
//   factory User.fromJson(Map<dynamic, dynamic> json) => _$UserFromJson(json);
//
//   copyParams(User user) {
//     this.firstName = user.firstName;
//     this.lastName = user.lastName ?? this.lastName;
//     this.email = user.email ?? this.email;
//     this.countryName = user.countryName ?? this.countryName;
//   }
//
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
