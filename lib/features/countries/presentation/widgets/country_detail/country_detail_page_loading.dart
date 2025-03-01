import 'package:cubex_demo/features/countries/presentation/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'banner.dart';

class CountryDetailPageLoading extends StatelessWidget {
  final String flagUrl;
  const CountryDetailPageLoading({super.key, required this.flagUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetailBanner(
              flagUrl: flagUrl,
            ),
            20.verticalSpace,
            loadingSegment(),
            20.verticalSpace,
            loadingSegment(),
          ],
        ),
      ),
    );
  }

  Widget itemWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          LoadingShimmer(
              height: 20.h,
              width: 20.w,
              child: Container(
                height: 20.h,
                width: 20.w,
                color: Colors.black,
              )),
          5.horizontalSpace,
          LoadingShimmer(
              height: 20.h,
              width: 100.w,
              child: Container(
                height: 20.h,
                width: 20.w,
                color: Colors.black,
              )),
          5.horizontalSpace,
          LoadingShimmer(
              height: 20.h,
              width: 150.w,
              child: Container(
                height: 20.h,
                width: 20.w,
                color: Colors.black,
              ))
        ],
      ),
    );
  }

  Widget loadingSegment() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          itemWidget(),
          itemWidget(),
          itemWidget(),
          itemWidget(),
          itemWidget(),
          itemWidget(),
          itemWidget(),
        ],
      ),
    );
  }
}
