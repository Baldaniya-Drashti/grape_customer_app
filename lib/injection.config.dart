// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart'
    as _i19;
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart'
    as _i12;
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart'
    as _i16;
import 'package:grape_customer_app/application/main/cart/cart_bloc.dart'
    as _i20;
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart'
    as _i4;
import 'package:grape_customer_app/application/main/favourite/favourite_bloc.dart'
    as _i22;
import 'package:grape_customer_app/application/main/home/home_bloc.dart'
    as _i23;
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart'
    as _i15;
import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart'
    as _i21;
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart'
    as _i18;
import 'package:grape_customer_app/application/main/profile/language/language_bloc.dart'
    as _i11;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart'
    as _i17;
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart'
    as _i13;
import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart'
    as _i14;
import 'package:grape_customer_app/domain/account/i_account_repository.dart'
    as _i5;
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart' as _i7;
import 'package:grape_customer_app/domain/main/i_main_facade.dart' as _i9;
import 'package:grape_customer_app/infrastructure/account/account_repository.dart'
    as _i6;
import 'package:grape_customer_app/infrastructure/auth/auth_facade.dart' as _i8;
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart'
    as _i3;
import 'package:grape_customer_app/infrastructure/main/main_facade.dart'
    as _i10;
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
    gh.lazySingleton<_i5.IAccountRepository>(
        () => _i6.AccountRepository(gh<_i3.ApiService>()));
    gh.lazySingleton<_i7.IAuthFacade>(
        () => _i8.AuthFacade(gh<_i3.ApiService>()));
    gh.lazySingleton<_i9.IMainFacade>(
        () => _i10.MainFacade(apiService: gh<_i3.ApiService>()));
    gh.factory<_i11.LanguageBloc>(() => _i11.LanguageBloc());
    gh.factory<_i12.LoginFormBloc>(
        () => _i12.LoginFormBloc(gh<_i7.IAuthFacade>()));
    gh.factory<_i13.MainTabBloc>(() => _i13.MainTabBloc(
          gh<_i7.IAuthFacade>(),
          gh<_i5.IAccountRepository>(),
        ));
    gh.factory<_i14.OnboardingBloc>(() => _i14.OnboardingBloc());
    gh.factory<_i15.ProductDetailBloc>(
        () => _i15.ProductDetailBloc(gh<_i9.IMainFacade>()));
    gh.factory<_i16.RegisterFormBloc>(
        () => _i16.RegisterFormBloc(gh<_i7.IAuthFacade>()));
    gh.factory<_i17.ShippingAddressesBloc>(() => _i17.ShippingAddressesBloc());
    gh.factory<_i18.AccountCubit>(
        () => _i18.AccountCubit(gh<_i5.IAccountRepository>()));
    gh.factory<_i19.AuthStatusBloc>(
        () => _i19.AuthStatusBloc(gh<_i7.IAuthFacade>()));
    gh.factory<_i20.CartBloc>(() => _i20.CartBloc(gh<_i9.IMainFacade>()));
    gh.factory<_i21.EditProfileBloc>(() => _i21.EditProfileBloc(
          gh<_i5.IAccountRepository>(),
          gh<_i7.IAuthFacade>(),
        ));
    gh.factory<_i22.FavouriteBloc>(
        () => _i22.FavouriteBloc(gh<_i9.IMainFacade>()));
    gh.factory<_i23.HomeBloc>(() => _i23.HomeBloc(gh<_i9.IMainFacade>()));
    return this;
  }
}
