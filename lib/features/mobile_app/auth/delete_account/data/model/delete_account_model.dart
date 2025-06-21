import '../../domain/entity/delete_account_entity.dart';

class DeleteAccountModel extends DeleteAccountEntity {
  const DeleteAccountModel({
    required super.userId,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
      };

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountModel(
      userId: json['userId'] ?? '',
    );
  }
  DeleteAccountModel.fromEntity(DeleteAccountEntity entity)
      : super(
          userId: entity.userId,
        );
  DeleteAccountEntity toEntity(DeleteAccountModel model) {
    return DeleteAccountEntity(
      userId: model.userId,
    );
  }
}
