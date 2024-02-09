// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart'
    as _i18;
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart'
    as _i12;
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart'
    as _i15;
import 'package:grape_customer_app/application/main/favourite/favourite_bloc.dart'
    as _i5;
import 'package:grape_customer_app/application/main/home/home_bloc.dart' as _i6;
import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart'
    as _i19;
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart'
    as _i17;
import 'package:grape_customer_app/application/main/profile/language/language_bloc.dart'
    as _i11;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart'
    as _i16;
import 'package:grape_customer_app/application/main_tab/checkout/checkout_bloc.dart'
    as _i4;
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart'
    as _i13;
import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart'
    as _i14;
import 'package:grape_customer_app/domain/account/i_account_repository.dart'
    as _i7;
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart' as _i9;
import 'package:grape_customer_app/infrastructure/account/account_repository.dart'
    as _i8;
import 'package:grape_customer_app/infrastructure/auth/auth_facade.dart'
    as _i10;
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
    gh.factory<_i4.CheckoutBloc>(() => _i4.CheckoutBloc());
    gh.factory<_i5.FavouriteBloc>(() => _i5.FavouriteBloc());
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.lazySingleton<_i7.IAccountRepository>(
        () => _i8.AccountRepository(gh<_i3.ApiService>()));
    gh.lazySingleton<_i9.IAuthFacade>(
        () => _i10.AuthFacade(gh<_i3.ApiService>()));
    gh.factory<_i11.LanguageBloc>(() => _i11.LanguageBloc());
    gh.factory<_i12.LoginFormBloc>(
        () => _i12.LoginFormBloc(gh<_i9.IAuthFacade>()));
    gh.factory<_i13.MainTabBloc>(() => _i13.MainTabBloc(
          gh<_i9.IAuthFacade>(),
          gh<_i7.IAccountRepository>(),
        ));
    gh.factory<_i14.OnboardingBloc>(() => _i14.OnboardingBloc());
    gh.factory<_i15.RegisterFormBloc>(
        () => _i15.RegisterFormBloc(gh<_i9.IAuthFacade>()));
    gh.factory<_i16.ShippingAddressesBloc>(() => _i16.ShippingAddressesBloc());
    gh.factory<_i17.AccountCubit>(
        () => _i17.AccountCubit(gh<_i7.IAccountRepository>()));
    gh.factory<_i18.AuthStatusBloc>(
        () => _i18.AuthStatusBloc(gh<_i9.IAuthFacade>()));
    gh.factory<_i19.EditProfileBloc>(() => _i19.EditProfileBloc(
          gh<_i7.IAccountRepository>(),
          gh<_i9.IAuthFacade>(),
        ));
    return this;
  }
}
