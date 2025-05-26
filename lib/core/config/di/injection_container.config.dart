// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/home/data/repos/home_repo_impl.dart' as _i1022;
import '../../../features/home/data/sources/remote/home_remote_data_source.dart'
    as _i794;
import '../../../features/home/data/sources/remote/home_remote_data_source_impl.dart'
    as _i299;
import '../../../features/home/domain/repos/home_domain_repo.dart' as _i89;
import '../../../features/home/domain/usecases/add_comment.dart' as _i621;
import '../../../features/home/domain/usecases/add_post.dart' as _i627;
import '../../../features/home/domain/usecases/delete_post.dart' as _i343;
import '../../../features/home/domain/usecases/get_comments.dart' as _i772;
import '../../../features/home/domain/usecases/get_posts.dart' as _i673;
import '../api/api_services.dart' as _i124;
import 'injection_container.dart' as _i809;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i124.ApiService>(() => _i124.ApiService(gh<_i361.Dio>()));
    gh.factory<_i794.RemoteDataSource>(
        () => _i299.RemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i89.HomeDomainRepository>(
        () => _i1022.HomeRepositoryImpl(gh<_i794.RemoteDataSource>()));
    gh.factory<_i621.AddCommentUseCase>(
        () => _i621.AddCommentUseCase(gh<_i89.HomeDomainRepository>()));
    gh.factory<_i627.AddPostUseCase>(
        () => _i627.AddPostUseCase(gh<_i89.HomeDomainRepository>()));
    gh.factory<_i343.DeletePostUseCase>(
        () => _i343.DeletePostUseCase(gh<_i89.HomeDomainRepository>()));
    gh.factory<_i772.GetCommentsUseCase>(
        () => _i772.GetCommentsUseCase(gh<_i89.HomeDomainRepository>()));
    gh.factory<_i673.GetPostsUseCase>(
        () => _i673.GetPostsUseCase(gh<_i89.HomeDomainRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i809.RegisterModule {}
