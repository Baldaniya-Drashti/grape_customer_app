import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grape_customer_app/application/onboarding/onboarding_bloc.dart';
import 'package:grape_customer_app/domain/core/color_constant.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/domain/core/string_constant.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/onboarding/widgets/onboarding_model.dart';
import 'package:intl/intl.dart';

@RoutePage(name: 'onboarding')
class OnBoardingPage extends StatelessWidget {
  final pageController = PageController();
  final onboardingList = <OnBoardingModel>[
    OnBoardingModel(
      title: 'Welcome to grape company',
      backgroundImage: PngImageConstants.onboarding_background_1,
      description:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, to',
      image: PngImageConstants.onboarding_1,
    ),
    OnBoardingModel(
      title: 'Explore many products',
      backgroundImage: PngImageConstants.onboarding_background_2,
      description:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, toSed ut perspiciatis unde omnis iste natus error sit voluptat accusantium doloremque laudantium.',
      image: PngImageConstants.onboarding_2,
    ),
    OnBoardingModel(
      title: 'Choose and checkout',
      backgroundImage: PngImageConstants.onboarding_background_3,
      description:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, tout perspiciatis unde omnis iste natus error sit voluptat.',
      image: PngImageConstants.onboarding_3,
    ),
  ];
  OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    onboardingList[state.currentPage].backgroundImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: getSize(50),
                  ),
                  getSkipText(context),
                  Spacer(),
                  getImageView(state, context),
                  Spacer(),
                  Center(
                    child: BaseText(
                      text: onboardingList[state.currentPage].title,
                      fontSize: 22,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      textColor: Color(0xFF32353A),
                    ),
                  ),
                  SizedBox(
                    height: getSize(15),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(30)),
                    child: BaseText(
                      text: onboardingList[state.currentPage].description,
                      textColor: ColorConstants.black.withOpacity(0.5),
                      textAlign: TextAlign.center,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: CommonButton(
                        onPressed: () {
                          // if (state.currentPage == 2) {
                          // } else {
                          //   pageController.nextPage(
                          //     duration: Duration(milliseconds: 800),
                          //     curve: Curves.easeInOut,
                          //   );
                          // }
                        },
                        buttonText: state.currentPage == 2
                            ? 'Let’s Go Shopping!'
                            : 'Next'),
                  ),
                  getNextButtonAndDotIndicatorView(state),
                  SizedBox(
                    height: getSize(12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  getSkipText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getSize(24)),
      child: GestureDetector(
        onTap: () {},
        child: BaseText(
          text: AppLocalizations.of(context).skip,
          textColor: ColorConstants.black.withOpacity(0.5),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }

  Expanded getNextButtonAndDotIndicatorView(OnboardingState state) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          3,
          (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: getSize(5)),
            height: getSize(6),
            width: getSize(6),
            decoration: BoxDecoration(
              color: state.currentPage == index
                  ? Color(0xFF464646)
                  : ColorConstants.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  getImageView(OnboardingState state, BuildContext context) {
    return Expanded(
      flex: 10,
      child: PageView.builder(
        controller: pageController,
        itemCount: onboardingList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getSize(
              index == 0
                  ? getSize(57)
                  : index == 1
                      ? getSize(39)
                      : getSize(24),
            ),
          ),
          child: Image.asset(
            onboardingList[index].image,
          ),
        ),
        onPageChanged: (value) {
          context.read<OnboardingBloc>().add(OnboardingEvent.nextPage(value));
        },
      ),
    );
  }
}
