import 'package:alefk/features/edit_profile/domain/entity/edit_profile_entity.dart';

class EditProfileModel extends EditProfileEntity {
  const EditProfileModel({
    required super.id,
    required super.email,
    required super.userName,
    required super.phone,
    required super.image,
    required super.password,
    required super.country,
    required super.city,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'userName': userName,
        'phone': phone,
        'image': image,
        'password': password,
        'country': country,
        'city': city,
      };
  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      id: json['id'] as int? ?? 0, // Assuming id can be null, default to 0
      email: json['email'] as String,
      userName: json['userName'] as String,
      phone: json['phone'] as int,
      image: json['image'] as String,
      password: json['password'] as String? ?? '',
      country: json['country'] as String? ?? '',
      city: json['city'] as String? ?? '',
    );
  }
  EditProfileModel.fromEntity(EditProfileEntity entity)
      : super(
          id: entity.id,
          email: entity.email,
          userName: entity.userName,
          phone: entity.phone,
          image: entity.image,
          password: entity.password,
          country: entity.country,
          city: entity.city,
        );
  EditProfileEntity toEntity(EditProfileModel model) {
    return EditProfileEntity(
      id: model.id,
      email: model.email,
      userName: model.userName,
      phone: model.phone,
      image: model.image,
      password: model.password,
      country: model.country,
      city: model.city,
    );
  }

  EditProfileModel copyWith({
    int? id,
    String? email,
    String? password,
    String? userName,
    int? phone,
    String? country,
    String? city,
    String? image,
  }) {
    return EditProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      password: password ?? this.password,
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }
}
