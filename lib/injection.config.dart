// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart'
    as _i26;
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart'
    as _i28;
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart'
    as _i27;
import 'package:grape_customer_app/application/chat/chat_bloc.dart' as _i9;
import 'package:grape_customer_app/application/main/cart/cart_bloc.dart'
    as _i21;
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart'
    as _i16;
import 'package:grape_customer_app/application/main/favourite/favourite_bloc.dart'
    as _i22;
import 'package:grape_customer_app/application/main/home/home_bloc.dart'
    as _i14;
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart'
    as _i15;
import 'package:grape_customer_app/application/main/profile/customer_support/contact_support_bloc.dart'
    as _i18;
import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart'
    as _i24;
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart'
    as _i23;
import 'package:grape_customer_app/application/main/profile/language/language_bloc.dart'
    as _i3;
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart'
    as _i20;
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_bloc.dart'
    as _i19;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart'
    as _i17;
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart'
    as _i25;
import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart'
    as _i4;
import 'package:grape_customer_app/domain/account/i_account_repository.dart'
    as _i12;
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart' as _i10;
import 'package:grape_customer_app/domain/main/i_main_facade.dart' as _i7;
import 'package:grape_customer_app/infrastructure/account/account_repository.dart'
    as _i13;
import 'package:grape_customer_app/infrastructure/auth/auth_facade.dart'
    as _i11;
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart'
    as _i6;
import 'package:grape_customer_app/infrastructure/main/chat_service/socket_chat_service.dart'
    as _i5;
import 'package:grape_customer_app/infrastructure/main/main_facade.dart' as _i8;
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
    gh.factory<_i5.SocketChatService>(() => _i5.SocketChatService());
    gh.lazySingleton<_i6.ApiService>(() => _i6.ApiService());
    gh.lazySingleton<_i7.IMainFacade>(
        () => _i8.MainFacade(apiService: gh<_i6.ApiService>()));
    gh.factory<_i9.ChatBloc>(() => _i9.ChatBloc(
          gh<_i5.SocketChatService>(),
          gh<_i7.IMainFacade>(),
        ));
    gh.lazySingleton<_i10.IAuthFacade>(
        () => _i11.AuthFacade(gh<_i6.ApiService>()));
    gh.lazySingleton<_i12.IAccountRepository>(
        () => _i13.AccountRepository(gh<_i6.ApiService>()));
    gh.factory<_i14.HomeBloc>(() => _i14.HomeBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i15.ProductDetailBloc>(
        () => _i15.ProductDetailBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i16.CheckoutBloc>(
        () => _i16.CheckoutBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i17.ShippingAddressesBloc>(
        () => _i17.ShippingAddressesBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i18.CustomerSupportBloc>(
        () => _i18.CustomerSupportBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i19.PaymentMethodBloc>(
        () => _i19.PaymentMethodBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i20.MyOrdersBloc>(
        () => _i20.MyOrdersBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i21.CartBloc>(() => _i21.CartBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i22.FavouriteBloc>(
        () => _i22.FavouriteBloc(gh<_i7.IMainFacade>()));
    gh.factory<_i23.AccountCubit>(
        () => _i23.AccountCubit(gh<_i12.IAccountRepository>()));
    gh.factory<_i24.EditProfileBloc>(() => _i24.EditProfileBloc(
          gh<_i12.IAccountRepository>(),
          gh<_i10.IAuthFacade>(),
        ));
    gh.factory<_i25.MainTabBloc>(() => _i25.MainTabBloc(
          gh<_i10.IAuthFacade>(),
          gh<_i12.IAccountRepository>(),
        ));
    gh.factory<_i26.AuthStatusBloc>(
        () => _i26.AuthStatusBloc(gh<_i10.IAuthFacade>()));
    gh.factory<_i27.RegisterFormBloc>(
        () => _i27.RegisterFormBloc(gh<_i10.IAuthFacade>()));
    gh.factory<_i28.LoginFormBloc>(
        () => _i28.LoginFormBloc(gh<_i10.IAuthFacade>()));
    return this;
  }
}
