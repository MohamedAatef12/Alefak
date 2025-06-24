import 'package:alefk/features/auth/delete_account/domain/entity/delete_account_entity.dart';

class DeleteAccountModel extends DeleteAccountEntity {
  const DeleteAccountModel({

    required super.password,
  });

  Map<String, dynamic> toJson() => {
        'userpassword' : password,
      };

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountModel(

      password: json['userpassword'] ?? '',
    );
  }
  DeleteAccountModel.fromEntity(DeleteAccountEntity entity)
      : super(

          password: entity.password,
        );
  DeleteAccountEntity toEntity(DeleteAccountModel model) {
    return DeleteAccountEntity(

      password: model.password,
    );
  }
}
