import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback? onRetry;
  const AppErrorWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff232323),
      padding: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          200.verticalSpace,
          SvgPicture.asset("assets/images/x-circle.svg"),
          20.verticalSpace,
          SizedBox(
            width: 200.w,
            child: Text("Something went wrong, Let's try again",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                )),
          ),
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.resolveWith<double>((states) => 0),
              fixedSize: WidgetStateProperty.resolveWith<Size>(
                (states) => Size(342.w, 52.h),
              ),
              shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  side: const BorderSide(width: 2),
                );
              }),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  return const Color(0xffF0F2F5);
                },
              ),
            ),
            onPressed: onRetry,
            child: Text("Try Again",
                style: TextStyle(
                  color: const Color(0xff232323),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                )),
          )
        ],
      ),
    );
  }
}
