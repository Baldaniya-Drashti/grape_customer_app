// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:grape_customer_app/application/account/change_password/change_password_cubit.dart'
    as _i14;
import 'package:grape_customer_app/application/account/get_account/account_cubit.dart'
    as _i12;
import 'package:grape_customer_app/application/account/update_account/update_account_bloc.dart'
    as _i11;
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart'
    as _i13;
import 'package:grape_customer_app/application/auth/forgot_password/forgot_password_cubit.dart'
    as _i15;
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart'
    as _i8;
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart'
    as _i10;
import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart'
    as _i9;
import 'package:grape_customer_app/domain/account/i_account_repository.dart'
    as _i4;
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart' as _i6;
import 'package:grape_customer_app/infrastructure/account/account_repository.dart'
    as _i5;
import 'package:grape_customer_app/infrastructure/auth/auth_facade.dart' as _i7;
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
    gh.lazySingleton<_i4.IAccountRepository>(
        () => _i5.AccountRepository(gh<_i3.ApiService>()));
    gh.lazySingleton<_i6.IAuthFacade>(
        () => _i7.AuthFacade(gh<_i3.ApiService>()));
    gh.factory<_i8.LoginFormBloc>(
        () => _i8.LoginFormBloc(gh<_i6.IAuthFacade>()));
    gh.factory<_i9.OnboardingBloc>(() => _i9.OnboardingBloc());
    gh.factory<_i10.RegisterFormBloc>(
        () => _i10.RegisterFormBloc(gh<_i6.IAuthFacade>()));
    gh.factory<_i11.UpdateAccountBloc>(
        () => _i11.UpdateAccountBloc(gh<_i4.IAccountRepository>()));
    gh.factory<_i12.AccountCubit>(
        () => _i12.AccountCubit(gh<_i4.IAccountRepository>()));
    gh.factory<_i13.AuthStatusBloc>(
        () => _i13.AuthStatusBloc(gh<_i6.IAuthFacade>()));
    gh.factory<_i14.ChangePasswordCubit>(
        () => _i14.ChangePasswordCubit(gh<_i6.IAuthFacade>()));
    gh.factory<_i15.ForgotPasswordCubit>(
        () => _i15.ForgotPasswordCubit(gh<_i6.IAuthFacade>()));
    return this;
  }
}
