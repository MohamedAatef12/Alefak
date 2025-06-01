// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alefk/features/auth/login/data/data_sources/login_remote_data_source.dart' as _i747;
import 'package:alefk/features/auth/login/data/data_sources/login_remote_data_source_impl.dart' as _i657;
import 'package:alefk/features/auth/login/data/repos/login_repo_impl.dart' as _i719;
import 'package:alefk/features/auth/login/domain/repos/login_repo.dart' as _i596;
import 'package:alefk/features/auth/login/domain/usecases/login_use_case.dart' as _i62;
import 'package:alefk/features/auth/register/data/repos/register_repo_impl.dart' as _i956;
import 'package:alefk/features/auth/register/data/source/register_remote_data_source.dart' as _i1040;
import 'package:alefk/features/auth/register/data/source/register_remote_data_source_impl.dart' as _i991;
import 'package:alefk/features/auth/register/domain/repos/register_domain_repo.dart' as _i192;
import 'package:alefk/features/auth/register/domain/usecases/register_domain_usecase.dart' as _i596;
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
    gh.factory<_i747.LoginRemoteDataSource>(
        () => _i657.LoginRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i794.RemoteDataSource>(
        () => _i299.RemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i1040.RegisterRemoteDataSource>(
        () => _i991.RegisterRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i596.LoginDomainRepository>(
        () => _i719.LoginRepositoryImpl(gh<_i747.LoginRemoteDataSource>()));
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
    gh.factory<_i192.RegisterDomainRepository>(() =>
        _i956.RegisterRepositoryImpl(gh<_i1040.RegisterRemoteDataSource>()));
    gh.factory<_i62.LoginUseCase>(
        () => _i62.LoginUseCase(gh<_i596.LoginDomainRepository>()));
    gh.factory<_i596.RegisterUseCase>(
        () => _i596.RegisterUseCase(gh<_i192.RegisterDomainRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i809.RegisterModule {}
