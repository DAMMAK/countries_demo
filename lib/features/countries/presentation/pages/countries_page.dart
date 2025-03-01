import 'package:cubex_demo/features/countries/presentation/widgets/error_widget.dart';
import 'package:cubex_demo/injection.dart';
import 'package:cubex_demo/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/country.dart';
import '../bloc/countries/countries_bloc.dart';
import '../widgets/country_list/countries_list_loading.dart';
import '../widgets/country_list/country_item.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  List<Country> countries = [];

  @override
  void initState() {
    loadCountries();
    super.initState();
  }

  void loadCountries() {
    ioc<CountriesBloc>().add(LoadCountries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocConsumer<CountriesBloc, CountriesState>(
          bloc: ioc.get<CountriesBloc>(),
          listener: (context, state) {
            if (state is CountriesLoaded) {
              countries = state.countries;
            }
          },
          builder: (context, state) {
            if (state is CountriesLoading) {
              return const CountriesListLoadingWidget();
            }
            if (state is CountriesError) {
              return AppErrorWidget(
                onRetry: loadCountries,
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                loadCountries();
              },
              child: ListView.builder(
                itemCount: countries.length,
                padding: EdgeInsets.only(bottom: 30.h),
                itemBuilder: (context, index) {
                  return CountryItemWidget(
                    country: countries[index],
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.detail,
                          arguments: {"country": countries[index]});
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
