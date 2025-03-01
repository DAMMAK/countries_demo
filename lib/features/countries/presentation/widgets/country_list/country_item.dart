import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubex_demo/features/countries/domain/entities/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryItemWidget extends StatelessWidget {
  final Country country;
  final VoidCallback? onTap;
  const CountryItemWidget({super.key, required this.country, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: 80.h,
        padding: EdgeInsets.only(left: 16.w),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            CachedNetworkImage(
              height: 70.h,
              width: 70.w,
              imageUrl: country.flagUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  country.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text("Language: ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        )),
                    Text(
                      country.languages.take(2).join(","),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text("Capital: ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        )),
                    Text(
                      country.capital,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
