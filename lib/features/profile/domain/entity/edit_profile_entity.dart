import 'package:equatable/equatable.dart';

class EditProfileEntity extends Equatable{
  final int id ;
  final String userName;
  final String country;
  final String city;
  final String phone;
  final String image;
  final int age;
  final String gender;
  final String address;
  final String idImage;


  const EditProfileEntity({

    required this.userName,
    required this.phone,

    required this.country,
    required this.city,
    required this.image,
    required this.id,
    required this.age,
    required this.gender,
    required this.address,
    required this.idImage,


  });

  @override
  List<Object?> get props => [id, userName,city,country, phone, image, age, address, gender,
  idImage];
}
