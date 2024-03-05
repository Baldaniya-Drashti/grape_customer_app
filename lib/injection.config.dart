// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart'
    as _i20;
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart'
    as _i13;
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart'
    as _i17;
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart'
    as _i4;
import 'package:grape_customer_app/application/main/favourite/favourite_bloc.dart'
    as _i5;
import 'package:grape_customer_app/application/main/home/home_bloc.dart'
    as _i22;
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart'
    as _i16;
import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart'
    as _i21;
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart'
    as _i19;
import 'package:grape_customer_app/application/main/profile/language/language_bloc.dart'
    as _i12;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart'
    as _i18;
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart'
    as _i14;
import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart'
    as _i15;
import 'package:grape_customer_app/domain/account/i_account_repository.dart'
    as _i6;
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart' as _i8;
import 'package:grape_customer_app/domain/main/i_main_facade.dart' as _i10;
import 'package:grape_customer_app/infrastructure/account/account_repository.dart'
    as _i7;
import 'package:grape_customer_app/infrastructure/auth/auth_facade.dart' as _i9;
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart'
    as _i3;
import 'package:grape_customer_app/infrastructure/main/main_facade.dart'
    as _i11;
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
    gh.lazySingleton<_i6.IAccountRepository>(
        () => _i7.AccountRepository(gh<_i3.ApiService>()));
    gh.lazySingleton<_i8.IAuthFacade>(
        () => _i9.AuthFacade(gh<_i3.ApiService>()));
    gh.lazySingleton<_i10.IMainFacade>(
        () => _i11.MainFacade(apiService: gh<_i3.ApiService>()));
    gh.factory<_i12.LanguageBloc>(() => _i12.LanguageBloc());
    gh.factory<_i13.LoginFormBloc>(
        () => _i13.LoginFormBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i14.MainTabBloc>(() => _i14.MainTabBloc(
          gh<_i8.IAuthFacade>(),
          gh<_i6.IAccountRepository>(),
        ));
    gh.factory<_i15.OnboardingBloc>(() => _i15.OnboardingBloc());
    gh.factory<_i16.ProductDetailBloc>(
        () => _i16.ProductDetailBloc(gh<_i10.IMainFacade>()));
    gh.factory<_i17.RegisterFormBloc>(
        () => _i17.RegisterFormBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i18.ShippingAddressesBloc>(() => _i18.ShippingAddressesBloc());
    gh.factory<_i19.AccountCubit>(
        () => _i19.AccountCubit(gh<_i6.IAccountRepository>()));
    gh.factory<_i20.AuthStatusBloc>(
        () => _i20.AuthStatusBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i21.EditProfileBloc>(() => _i21.EditProfileBloc(
          gh<_i6.IAccountRepository>(),
          gh<_i8.IAuthFacade>(),
        ));
    gh.factory<_i22.HomeBloc>(() => _i22.HomeBloc(gh<_i10.IMainFacade>()));
    return this;
  }
}
