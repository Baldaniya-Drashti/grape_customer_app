// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:grape_customer_app/application/account/change_password/change_password_cubit.dart'
    as _i17;
import 'package:grape_customer_app/application/account/get_account/account_cubit.dart'
    as _i15;
import 'package:grape_customer_app/application/account/update_account/update_account_bloc.dart'
    as _i14;
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart'
    as _i16;
import 'package:grape_customer_app/application/auth/forgot_password/forgot_password_cubit.dart'
    as _i18;
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart'
    as _i10;
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart'
    as _i13;
import 'package:grape_customer_app/application/main/favourite/favourite_bloc.dart'
    as _i4;
import 'package:grape_customer_app/application/main/home/home_bloc.dart' as _i5;
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart'
    as _i11;
import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart'
    as _i12;
import 'package:grape_customer_app/domain/account/i_account_repository.dart'
    as _i6;
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart' as _i8;
import 'package:grape_customer_app/infrastructure/account/account_repository.dart'
    as _i7;
import 'package:grape_customer_app/infrastructure/auth/auth_facade.dart' as _i9;
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart'
    as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiService>(() => _i3.ApiService());
    gh.factory<_i4.FavouriteBloc>(() => _i4.FavouriteBloc());
    gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc());
    gh.lazySingleton<_i6.IAccountRepository>(
        () => _i7.AccountRepository(gh<_i3.ApiService>()));
    gh.lazySingleton<_i8.IAuthFacade>(
        () => _i9.AuthFacade(gh<_i3.ApiService>()));
    gh.factory<_i10.LoginFormBloc>(
        () => _i10.LoginFormBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i11.MainTabBloc>(() => _i11.MainTabBloc());
    gh.factory<_i12.OnboardingBloc>(() => _i12.OnboardingBloc());
    gh.factory<_i13.RegisterFormBloc>(
        () => _i13.RegisterFormBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i14.UpdateAccountBloc>(
        () => _i14.UpdateAccountBloc(gh<_i6.IAccountRepository>()));
    gh.factory<_i15.AccountCubit>(
        () => _i15.AccountCubit(gh<_i6.IAccountRepository>()));
    gh.factory<_i16.AuthStatusBloc>(
        () => _i16.AuthStatusBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i17.ChangePasswordCubit>(
        () => _i17.ChangePasswordCubit(gh<_i8.IAuthFacade>()));
    gh.factory<_i18.ForgotPasswordCubit>(
        () => _i18.ForgotPasswordCubit(gh<_i8.IAuthFacade>()));
    return this;
  }
}
