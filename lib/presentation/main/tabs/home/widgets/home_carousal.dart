import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';

class HomeDiscountCarousalWidget extends StatelessWidget {
  const HomeDiscountCarousalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CarouselSlider.builder(
          itemCount: context.read<HomeBloc>().imgList.length,
          itemBuilder: (context, index, realIndex) => Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(18)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(getSize(10)),
              child: CachedNetworkImage(
                imageUrl: context.read<HomeBloc>().imgList[index],
                fit: BoxFit.cover,
                width: MediaQueryData.fromView(View.of(context)).size.width,
              ),
            ),
          ),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 1,
            height: getSize(130),
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              context.read<HomeBloc>().add(HomeEvent.carousalChange(index));
              // controller.currentIndex.value = index;
            },
          ),
        );
      },
    );
  }
}
