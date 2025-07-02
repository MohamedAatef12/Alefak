
import 'package:alefk/features/profile/domain/entity/edit_profile_entity.dart';

class EditProfileModel extends EditProfileEntity {
  const EditProfileModel({
    required super.id,

    required super.userName,
    required super.phone,
    required super.image,

    required super.country,
    required super.city,
    required super.age,
    required super.gender,
    required super.address,
    required super.idImage,
  });

  Map<String, dynamic> toJson() => {
        'id': id,

        'userName': userName,
        'phone': phone,
        'image': image,

        'country': country,
        'city': city,
        'age': age,
        'gender':gender,
        'address': address,
        'idImage': idImage,
      };
  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      id: json['id'] as int? ?? 0, // Assuming id can be null, default to 0

      userName: json['userName'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,

      country: json['country'] as String? ?? '',
      city: json['city'] as String? ?? '',
      age: json['age'] as int? ?? 0,
      gender: json['gender'] as String? ?? '',
      address: json['address'] as String? ?? '',
      idImage: json['idImage'] as String? ?? '',
    );
  }
  EditProfileModel.fromEntity(EditProfileEntity entity)
      : super(
          id: entity.id,

          userName: entity.userName,
          phone: entity.phone,
          image: entity.image,

          country: entity.country,
          city: entity.city,
          age: entity.age,
          gender: entity.gender,
          address: entity.address,
          idImage: entity.idImage,
        );
  EditProfileEntity toEntity(EditProfileModel model) {
    return EditProfileEntity(
      id: model.id,

      userName: model.userName,
      phone: model.phone,
      image: model.image,

      country: model.country,
      city: model.city,
      age: model.age,
      gender: model.gender,
      address: model.address,
      idImage: model.idImage,
    );
  }

  EditProfileModel copyWith({
    int? id,
    String? email,
    String? password,
    String? userName,
    String? phone,
    String? country,
    String? city,
    String? image,
    int? age,
    String? gender,
    String? address,
    String? idImage,
  }) {
    return EditProfileModel(
      id: id ?? this.id,

      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      image: image ?? this.image,

      country: country ?? this.country,
      city: city ?? this.city,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      idImage: idImage ?? this.idImage,
    );
  }
}
