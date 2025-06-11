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

import '../../../features/auth/login/data/data_sources/remote/login_remote_data_source.dart'
    as _i309;
import '../../../features/auth/login/data/data_sources/remote/login_remote_data_source_impl.dart'
    as _i20;
import '../../../features/auth/login/data/repos/login_repo_impl.dart' as _i226;
import '../../../features/auth/login/domain/repos/login_repo.dart' as _i142;
import '../../../features/auth/login/domain/usecases/login_use_case.dart'
    as _i416;
import '../../../features/auth/register/data/repos/register_repo_impl.dart'
    as _i727;
import '../../../features/auth/register/data/source/register_remote_data_source.dart'
    as _i116;
import '../../../features/auth/register/data/source/register_remote_data_source_impl.dart'
    as _i692;
import '../../../features/auth/register/domain/repos/register_domain_repo.dart'
    as _i726;
import '../../../features/auth/register/domain/usecases/register_domain_usecase.dart'
    as _i274;
import '../../../features/edit_profile/data/data_source/remote/edit_profile_remote_data_source.dart'
    as _i908;
import '../../../features/edit_profile/data/data_source/remote/edit_profile_remote_data_source_impl.dart'
    as _i503;
import '../../../features/edit_profile/data/repos/edit_profile_repo_impl.dart'
    as _i202;
import '../../../features/edit_profile/domain/repos/edit_profile_repo.dart'
    as _i485;
import '../../../features/edit_profile/domain/use_case/edit_profile_use_case.dart'
    as _i1071;
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
import '../../../features/home/domain/usecases/get_comments_id.dart' as _i758;
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
    gh.factory<_i908.EditProfileRemoteDataSource>(
        () => _i503.EditProfileRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i116.RegisterRemoteDataSource>(
        () => _i692.RegisterRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i309.LoginRemoteDataSource>(
        () => _i20.LoginRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i142.LoginDomainRepository>(
        () => _i226.LoginRepositoryImpl(gh<_i309.LoginRemoteDataSource>()));
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
    gh.factory<_i758.GetPostCommentsUseCase>(
        () => _i758.GetPostCommentsUseCase(gh<_i89.HomeDomainRepository>()));
    gh.factory<_i673.GetPostsUseCase>(
        () => _i673.GetPostsUseCase(gh<_i89.HomeDomainRepository>()));
    gh.factory<_i758.GetPostCommentsUseCase>(
        () => _i758.GetPostCommentsUseCase(gh<_i89.HomeDomainRepository>()));
    gh.factory<_i726.RegisterDomainRepository>(() =>
        _i727.RegisterRepositoryImpl(gh<_i116.RegisterRemoteDataSource>()));
    gh.factory<_i485.EditProfileRepo>(() => _i202.EditProfileRepositoryImpl(
        gh<_i908.EditProfileRemoteDataSource>()));
    gh.factory<_i274.RegisterUseCase>(
        () => _i274.RegisterUseCase(gh<_i726.RegisterDomainRepository>()));
    gh.factory<_i416.LoginUseCase>(
        () => _i416.LoginUseCase(gh<_i142.LoginDomainRepository>()));
    gh.factory<_i1071.EditProfileUseCase>(
        () => _i1071.EditProfileUseCase(gh<_i485.EditProfileRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i809.RegisterModule {}
