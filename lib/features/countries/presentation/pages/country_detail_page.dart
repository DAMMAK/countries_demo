import 'package:cubex_demo/features/countries/domain/entities/country.dart';
import 'package:cubex_demo/features/countries/domain/entities/country_detail.dart';
import 'package:cubex_demo/features/countries/presentation/bloc/country_detail/country_detail_bloc.dart';
import 'package:cubex_demo/features/countries/presentation/widgets/error_widget.dart';
import 'package:cubex_demo/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/country_detail/banner.dart';
import '../widgets/country_detail/country_detail_page_loading.dart';
import '../widgets/country_detail/detail_content.dart';

class CountryDetailPage extends StatefulWidget {
  final Country country;
  const CountryDetailPage({super.key, required this.country});

  @override
  State<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  CountryDetail? detail;

  @override
  void initState() {
    loadDetail();
    super.initState();
  }

  void loadDetail() {
    ioc
        .get<CountryDetailBloc>()
        .add(LoadCountryDetail(name: widget.country.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<CountryDetailBloc, CountryDetailState>(
        bloc: ioc.get<CountryDetailBloc>(),
        listener: (context, state) {
          if (state is CountryDetailLoaded) {
            detail = state.country;
          }
        },
        builder: (context, state) {
          if (state is CountryDetailLoading) {
            return CountryDetailPageLoading(
              flagUrl: widget.country.flagUrl,
            );
          }
          if (state is CountryDetailError) {
            return AppErrorWidget(
              onRetry: loadDetail,
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                DetailBanner(
                  flagUrl: detail?.flag ?? "",
                ),
                SizedBox(
                  height: 450.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        20.verticalSpace,
                        DetailPrimaryContentWidget(detail: detail),
                        20.verticalSpace,
                        DetailSecondaryContentWidget(detail: detail),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (detail?.mapUrl != null) {
            if (!await launchUrl(Uri.parse(detail!.mapUrl))) {
              throw Exception('Could not launch ${detail!.mapUrl}');
            }
          }
        },
        child: const Icon(Icons.map_outlined),
      ),
    );
  }
}
