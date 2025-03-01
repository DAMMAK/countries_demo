import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../loading_shimmer.dart';

class CountriesListLoadingWidget extends StatelessWidget {
  const CountriesListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return const _CountriesItemLoadingWidget();
      },
    );
  }
}

class _CountriesItemLoadingWidget extends StatelessWidget {
  const _CountriesItemLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 16.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          LoadingShimmer(
            height: 70.h,
            width: 70.w,
            child: Container(
                height: 70.h,
                width: 70.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                )),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingShimmer(
                height: 10.h,
                width: 70.w,
                child: Container(
                  height: 10.h,
                  width: 70.w,
                  color: Colors.black,
                ),
              ),
              4.verticalSpace,
              Row(
                children: [
                  LoadingShimmer(
                    height: 10.h,
                    width: 70.w,
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      color: Colors.black,
                    ),
                  ),
                  5.horizontalSpace,
                  LoadingShimmer(
                    height: 10.h,
                    width: 120.w,
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              4.verticalSpace,
              Row(
                children: [
                  LoadingShimmer(
                    height: 10.h,
                    width: 70.w,
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      color: Colors.black,
                    ),
                  ),
                  5.horizontalSpace,
                  LoadingShimmer(
                    height: 10.h,
                    width: 70.w,
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
