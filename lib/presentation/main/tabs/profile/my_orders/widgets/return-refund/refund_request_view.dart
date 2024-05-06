import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/order_detail_item.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/return-refund/upload_photo_view.dart';

@RoutePage(name: 'RefundRequestView')
class RefundRequestView extends StatelessWidget {
  final String orderId;
  const RefundRequestView({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyOrdersBloc>()
        ..add(MyOrdersEvent.getOrderDetail(orderId))
        ..add(MyOrdersEvent.getReasonRefundList()),
      child: BlocConsumer<MyOrdersBloc, MyOrdersState>(
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                showError(
                  message: failure.maybeMap(
                    showAPIResponseMessage: (value) => value.message,
                    networkError: (value) =>
                        'Please check your internet connectivity',
                    orElse: () => "Server Error. Try again later.",
                  ),
                ).show(context);
              },
              (r) {
                showSuccess(message: r).show(context).then((value) =>
                    context.router.popUntil((route) => route.isFirst));

                // RestartWidget.restartApp(context);
              },
            ),
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context).orderDetails,
              actions: [helpView(context)],
            ),
            body: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: GestureDetector(
                onTap: () {
                  AppFocus.unfocus(context);
                },
                child: state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      )
                    : ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          vertical: getSize(20),
                        ),
                        //   physics: BouncingScrollPhysics(),
                        children: [
                          OrderDetailItem(
                            showPadding: true,
                          ),
                          SizedBox(
                            height: getSize(30),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: BaseText(
                              text: 'Reason For Return',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: getSize(5),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: BaseText(
                              text:
                                  'Please tell us the correct reason for the return. This information is only to improve our service',
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: getSize(15),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: Divider(
                              color: Colors.black.withOpacity(0.10),
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: getSize(8),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            itemCount: state.refundReasonList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Theme(
                              data: ThemeData(
                                splashFactory: NoSplash.splashFactory,
                                highlightColor: Colors.transparent,
                              ),
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: getSize(5)),
                                splashColor: Colors.transparent,
                                onTap: () {
                                  context.read<MyOrdersBloc>().add(
                                      MyOrdersEvent.changeReturnReason(index));
                                },
                                minVerticalPadding: 0,
                                minLeadingWidth: 0,
                                dense: true,
                                visualDensity: VisualDensity(
                                  vertical: VisualDensity.minimumDensity,
                                  horizontal: VisualDensity.minimumDensity,
                                ),
                                leading: SvgPicture.asset(
                                  state.selectedRefundReason == index
                                      ? SvgImageConstant.emptyRadio
                                      : SvgImageConstant.selectedRadio,
                                ),
                                title: BaseText(
                                  text: state.refundReasonList[index].reason ??
                                      "",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getSize(8),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: Divider(
                              color: Colors.black.withOpacity(0.10),
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: getSize(15),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: BaseText(
                              text: 'Upload Photo',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: getSize(5),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: BaseText(
                              text:
                                  'Please upload the photo of defective product. This information is only to improve our service',
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: getSize(8),
                          ),
                          UploadPhotoView(),
                          SizedBox(
                            height: getSize(8),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: CustomTextField(
                              maxLines: 5,
                              hintText: 'Addition comment',
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              onChanged: (p0) => context
                                  .read<MyOrdersBloc>()
                                  .add(
                                    MyOrdersEvent.additionalCommentChange(p0),
                                  ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                left: getSize(18),
                right: getSize(18),
                top: getSize(18),
                bottom: isFullScreenDevice(context) ? 0 : getSize(18),
              ),
              child: CommonButton(
                isSubmitting: state.isSubmitting,
                onPressed: () async {
                  if (state.selectedRefundReason == -1) {
                    await showError(
                            message:
                                "Please select reason for return your product")
                        .show(context);
                  } else {
                    context
                        .read<MyOrdersBloc>()
                        .add(MyOrdersEvent.submitRefundRequest());
                  }
                },
                buttonText: 'Continue',
              ),
            ),
          );
        },
      ),
    );
  }

  GestureDetector helpView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(PageRouteInfo(HelpView.name));
      },
      child: Padding(
        padding: EdgeInsets.only(right: getSize(18)),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgImageConstant.feedback,
              colorFilter: ColorFilter.mode(
                AppColors.primaryOrange,
                BlendMode.srcATop,
              ),
            ),
            SizedBox(
              width: getSize(6),
            ),
            BaseText(
              text: 'Help',
              fontSize: 12,
              textColor: AppColors.primaryOrange,
            )
          ],
        ),
      ),
    );
  }
}
