import 'package:dartz/dartz.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_response.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';

abstract class IMainFacade {
  Future<Either<MainFailure, CommonResponse>> getProductListAPI({
    required int page,
     String productId,
  });
  Future<Either<MainFailure, CommonResponse>> searchProductListAPI(
      {required int page, String searchText = ''});
  Future<Either<MainFailure, CommonResponse>> getProductDetailsAPI({
    required String productId,
    required int page,
  });

  Future<Either<MainFailure, String>> addProductToCart({
    required String productId,
  });
  Future<Either<MainFailure, String>> deleteProductFromCart({
    required String productId,
  });

  Future<Either<MainFailure, String>> deleteProductFromFavourite({
    required String productId,
  });
  Future<Either<MainFailure, String>> addProductToFavourite({
    required String productId,
  });
  Future<Either<MainFailure, CommonResponse>> getCartListAPI(
      {required int page});

  Future<Either<MainFailure, CommonResponse>> getFavouriteAPI(
      {required int page});
  Future<Either<MainFailure, List<ShippingAddressDTO>>> getShippingAddressAPI();
  Future<Either<MainFailure, String>> addShippingAddress({
    required Username fullName,
    required MobileNumber mobileNumber,
    required String countryCode,
    required InputEmptyOrNot address,
    required InputEmptyOrNot landMark,
    required InputEmptyOrNot state,
    required InputEmptyOrNot city,
    required InputEmptyOrNot pinCode,
  });

  Future<Either<MainFailure, String>> editShippingAddress({
    required String id,
    required Username fullName,
    required MobileNumber mobileNumber,
    required String countryCode,
    required InputEmptyOrNot address,
    required InputEmptyOrNot landMark,
    required InputEmptyOrNot state,
    required InputEmptyOrNot city,
    required InputEmptyOrNot pinCode,
  });
  Future<Either<MainFailure, String>> deleteShippinAddress(
      {required String id});

  Future<Either<MainFailure, String>> addPaymentMethod({
    required Username cardHoldersName,
    required CardNumber cardNumber,
    required CardDate cardDate,
    required CVV cvv,
  });
  Future<Either<MainFailure, List<ShippingAddressDTO>>> getPaymentMethod();
}
