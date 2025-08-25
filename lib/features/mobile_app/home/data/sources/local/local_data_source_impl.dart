import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/features/mobile_app/auth/register/data/models/register_model.dart';
import 'package:injectable/injectable.dart';

import 'local_data_source.dart';

@Injectable(as: GetUserLocalDataSource)
class GetUserDataSourceImpl extends GetUserLocalDataSource {
  final ICacheManager _cacheManager;

  GetUserDataSourceImpl(this._cacheManager);

  @override
  RegisterModel getUserData() {
    return _cacheManager.getUserData()!;
  }
}
