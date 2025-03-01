import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/country_detail.dart';

class DetailContentItemWidget extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;
  const DetailContentItemWidget(
      {super.key, required this.icon, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //flag icon
          Icon(icon),
          8.horizontalSpace,
          Text(
            "$name:",
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
          2.horizontalSpace,
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPrimaryContentWidget extends StatelessWidget {
  final CountryDetail? detail;
  const DetailPrimaryContentWidget({super.key, this.detail});

  @override
  Widget build(BuildContext context) {
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
          DetailContentItemWidget(
              name: "Country Name",
              value: detail?.name ?? "",
              icon: Icons.flag_sharp),
          DetailContentItemWidget(
              icon: Icons.public,
              name: "Continent",
              value: detail?.continent ?? ""),
          DetailContentItemWidget(
              icon: Icons.people,
              name: "Population",
              value: detail?.population.toString() ?? ""),
          DetailContentItemWidget(
              icon: Icons.public,
              name: "Area",
              value: detail?.area.toString() ?? ""),
          DetailContentItemWidget(
              icon: Icons.language,
              name: "Languages",
              value: detail?.languages ?? ""),
          DetailContentItemWidget(
              icon: Icons.location_city,
              name: "Capital",
              value: detail?.capital ?? ""),
          DetailContentItemWidget(
              icon: Icons.timelapse,
              name: "Time Zones",
              value: detail?.timezones ?? ""),
        ],
      ),
    );
  }
}

class DetailSecondaryContentWidget extends StatelessWidget {
  final CountryDetail? detail;

  const DetailSecondaryContentWidget({super.key, this.detail});

  @override
  Widget build(BuildContext context) {
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
          DetailContentItemWidget(
              icon: Icons.calendar_month,
              name: "Start of Week",
              value: detail?.startOfWeek ?? ""),
          DetailContentItemWidget(
              icon: Icons.location_on_outlined,
              name: "Capital Coordinate",
              value: detail?.capitalCoordinate.toString() ?? ""),
          DetailContentItemWidget(
              icon: Icons.public,
              name: "Sub Region",
              value: detail?.subRegion.toString() ?? ""),
          DetailContentItemWidget(
              icon: Icons.phone,
              name: "Country Code",
              value: detail?.countryCode ?? ""),
          DetailContentItemWidget(
              icon: Icons.add_location,
              name: "Independent",
              value: detail?.independent ?? ""),
          DetailContentItemWidget(
              icon: Icons.timelapse,
              name: "UN Member",
              value: detail?.unMember ?? ""),
          DetailContentItemWidget(
              icon: Icons.currency_pound_rounded,
              name: "Currency",
              value: detail?.currency ?? ""),
        ],
      ),
    );
  }
}
