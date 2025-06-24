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

import '../../../features/mobile_app/auth/delete_account/data/data_source/remote/delete_account_remote_data_source.dart'
    as _i140;
import '../../../features/mobile_app/auth/delete_account/data/data_source/remote/delete_account_remote_data_source_impl.dart'
    as _i954;
import '../../../features/mobile_app/auth/delete_account/data/repos/delete_account_repo_impl.dart'
    as _i864;
import '../../../features/mobile_app/auth/delete_account/domain/repos/delete_account_repo.dart'
    as _i1043;
import '../../../features/mobile_app/auth/delete_account/domain/use_cases/delete_account_use_case.dart'
    as _i361;
import '../../../features/mobile_app/auth/login/data/data_sources/remote/login_remote_data_source.dart'
    as _i229;
import '../../../features/mobile_app/auth/login/data/data_sources/remote/login_remote_data_source_impl.dart'
    as _i842;
import '../../../features/mobile_app/auth/login/data/repos/login_repo_impl.dart'
    as _i431;
import '../../../features/mobile_app/auth/login/domain/repos/login_repo.dart'
    as _i769;
import '../../../features/mobile_app/auth/login/domain/usecases/login_use_case.dart'
    as _i155;
import '../../../features/mobile_app/auth/register/data/repos/register_repo_impl.dart'
    as _i900;
import '../../../features/mobile_app/auth/register/data/source/register_remote_data_source.dart'
    as _i487;
import '../../../features/mobile_app/auth/register/data/source/register_remote_data_source_impl.dart'
    as _i461;
import '../../../features/mobile_app/auth/register/domain/repos/register_domain_repo.dart'
    as _i573;
import '../../../features/mobile_app/auth/register/domain/usecases/register_domain_usecase.dart'
    as _i408;
import '../../../features/mobile_app/edit_profile/data/data_source/remote/edit_profile_remote_data_source.dart'
    as _i133;
import '../../../features/mobile_app/edit_profile/data/data_source/remote/edit_profile_remote_data_source_impl.dart'
    as _i982;
import '../../../features/mobile_app/edit_profile/data/repos/edit_profile_repo_impl.dart'
    as _i98;
import '../../../features/mobile_app/edit_profile/domain/repos/edit_profile_repo.dart'
    as _i961;
import '../../../features/mobile_app/edit_profile/domain/use_case/edit_profile_use_case.dart'
    as _i154;
import '../../../features/mobile_app/home/data/repos/home_repo_impl.dart'
    as _i898;
import '../../../features/mobile_app/home/data/sources/local/local_data_source.dart'
    as _i267;
import '../../../features/mobile_app/home/data/sources/local/local_data_source_impl.dart'
    as _i1036;
import '../../../features/mobile_app/home/data/sources/remote/home_remote_data_source.dart'
    as _i524;
import '../../../features/mobile_app/home/data/sources/remote/home_remote_data_source_impl.dart'
    as _i918;
import '../../../features/mobile_app/home/domain/repos/home_domain_repo.dart'
    as _i811;
import '../../../features/mobile_app/home/domain/usecases/add_comment.dart'
    as _i435;
import '../../../features/mobile_app/home/domain/usecases/add_post.dart'
    as _i542;
import '../../../features/mobile_app/home/domain/usecases/delete_post.dart'
    as _i763;
import '../../../features/mobile_app/home/domain/usecases/dislike_post.dart'
    as _i816;
import '../../../features/mobile_app/home/domain/usecases/get_comments_id.dart'
    as _i127;
import '../../../features/mobile_app/home/domain/usecases/get_posts.dart'
    as _i511;
import '../../../features/mobile_app/home/domain/usecases/get_posts_likes.dart'
    as _i1064;
import '../../../features/mobile_app/home/domain/usecases/get_user_cached%20_data.dart'
    as _i806;
import '../../../features/mobile_app/home/domain/usecases/like_post.dart'
    as _i1067;
import '../api/api_services.dart' as _i124;
import '../cache_manager/i_cache_manager.dart' as _i18;
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
    gh.factory<_i229.LoginRemoteDataSource>(
        () => _i842.LoginRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i267.GetUserLocalDataSource>(
        () => _i1036.GetUserDataSourceImpl(gh<_i18.ICacheManager>()));
    gh.factory<_i769.LoginDomainRepository>(
        () => _i431.LoginRepositoryImpl(gh<_i229.LoginRemoteDataSource>()));
    gh.factory<_i155.LoginUseCase>(
        () => _i155.LoginUseCase(gh<_i769.LoginDomainRepository>()));
    gh.factory<_i487.RegisterRemoteDataSource>(
        () => _i461.RegisterRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i140.DeleteAccountRemoteDataSource>(
        () => _i954.DeleteAccountRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i524.RemoteDataSource>(
        () => _i918.RemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i133.EditProfileRemoteDataSource>(
        () => _i982.EditProfileRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i573.RegisterDomainRepository>(() =>
        _i900.RegisterRepositoryImpl(gh<_i487.RegisterRemoteDataSource>()));
    gh.factory<_i1043.DeleteAccountRepo>(() =>
        _i864.DeleteAccountRepoImpl(gh<_i140.DeleteAccountRemoteDataSource>()));
    gh.factory<_i811.HomeDomainRepository>(() => _i898.HomeRepositoryImpl(
          gh<_i524.RemoteDataSource>(),
          gh<_i267.GetUserLocalDataSource>(),
        ));
    gh.factory<_i961.EditProfileRepo>(() => _i98.EditProfileRepositoryImpl(
        gh<_i133.EditProfileRemoteDataSource>()));
    gh.factory<_i435.AddCommentUseCase>(
        () => _i435.AddCommentUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i542.AddPostUseCase>(
        () => _i542.AddPostUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i763.DeletePostUseCase>(
        () => _i763.DeletePostUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i816.UnLikePostUseCase>(
        () => _i816.UnLikePostUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i127.GetPostCommentsUseCase>(
        () => _i127.GetPostCommentsUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i511.GetPostsUseCase>(
        () => _i511.GetPostsUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i1064.GetPostLikesUseCase>(
        () => _i1064.GetPostLikesUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i1067.LikePostUseCase>(
        () => _i1067.LikePostUseCase(gh<_i811.HomeDomainRepository>()));
    gh.factory<_i361.DeleteAccountUseCase>(
        () => _i361.DeleteAccountUseCase(gh<_i1043.DeleteAccountRepo>()));
    gh.factory<_i154.EditProfileUseCase>(
        () => _i154.EditProfileUseCase(gh<_i961.EditProfileRepo>()));
    gh.factory<_i408.RegisterUseCase>(
        () => _i408.RegisterUseCase(gh<_i573.RegisterDomainRepository>()));
    gh.factory<_i806.GetUserDataUseCase>(
        () => _i806.GetUserDataUseCase(gh<_i811.HomeDomainRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i809.RegisterModule {}
