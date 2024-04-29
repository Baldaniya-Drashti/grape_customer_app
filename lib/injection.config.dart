// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart'
    as _i24;
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart'
    as _i26;
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart'
    as _i25;
import 'package:grape_customer_app/application/main/cart/cart_bloc.dart'
    as _i19;
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart'
    as _i14;
import 'package:grape_customer_app/application/main/favourite/favourite_bloc.dart'
    as _i20;
import 'package:grape_customer_app/application/main/home/home_bloc.dart'
    as _i12;
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart'
    as _i13;
import 'package:grape_customer_app/application/main/profile/customer_support/contact_support_bloc.dart'
    as _i16;
import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart'
    as _i22;
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart'
    as _i21;
import 'package:grape_customer_app/application/main/profile/language/language_bloc.dart'
    as _i3;
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart'
    as _i18;
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_bloc.dart'
    as _i17;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart'
    as _i15;
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart'
    as _i23;
import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart'
    as _i4;
import 'package:grape_customer_app/domain/account/i_account_repository.dart'
    as _i10;
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart' as _i8;
import 'package:grape_customer_app/domain/main/i_main_facade.dart' as _i6;
import 'package:grape_customer_app/infrastructure/account/account_repository.dart'
    as _i11;
import 'package:grape_customer_app/infrastructure/auth/auth_facade.dart' as _i9;
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart'
    as _i5;
import 'package:grape_customer_app/infrastructure/main/main_facade.dart' as _i7;
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
    gh.factory<_i3.LanguageBloc>(() => _i3.LanguageBloc());
    gh.factory<_i4.OnboardingBloc>(() => _i4.OnboardingBloc());
    gh.lazySingleton<_i5.ApiService>(() => _i5.ApiService());
    gh.lazySingleton<_i6.IMainFacade>(
        () => _i7.MainFacade(apiService: gh<_i5.ApiService>()));
    gh.lazySingleton<_i8.IAuthFacade>(
        () => _i9.AuthFacade(gh<_i5.ApiService>()));
    gh.lazySingleton<_i10.IAccountRepository>(
        () => _i11.AccountRepository(gh<_i5.ApiService>()));
    gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i13.ProductDetailBloc>(
        () => _i13.ProductDetailBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i14.CheckoutBloc>(
        () => _i14.CheckoutBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i15.ShippingAddressesBloc>(
        () => _i15.ShippingAddressesBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i16.CustomerSupportBloc>(
        () => _i16.CustomerSupportBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i17.PaymentMethodBloc>(
        () => _i17.PaymentMethodBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i18.MyOrdersBloc>(
        () => _i18.MyOrdersBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i19.CartBloc>(() => _i19.CartBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i20.FavouriteBloc>(
        () => _i20.FavouriteBloc(gh<_i6.IMainFacade>()));
    gh.factory<_i21.AccountCubit>(
        () => _i21.AccountCubit(gh<_i10.IAccountRepository>()));
    gh.factory<_i22.EditProfileBloc>(() => _i22.EditProfileBloc(
          gh<_i10.IAccountRepository>(),
          gh<_i8.IAuthFacade>(),
        ));
    gh.factory<_i23.MainTabBloc>(() => _i23.MainTabBloc(
          gh<_i8.IAuthFacade>(),
          gh<_i10.IAccountRepository>(),
        ));
    gh.factory<_i24.AuthStatusBloc>(
        () => _i24.AuthStatusBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i25.RegisterFormBloc>(
        () => _i25.RegisterFormBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i26.LoginFormBloc>(
        () => _i26.LoginFormBloc(gh<_i8.IAuthFacade>()));
    return this;
  }
}
