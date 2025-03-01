import 'package:flutter/material.dart';

import 'features/countries/domain/entities/country.dart';
import 'features/countries/presentation/pages/countries_page.dart';
import 'features/countries/presentation/pages/country_detail_page.dart';

var routes = (RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => CountriesPage());
    case AppRoutes.detail:
      return MaterialPageRoute(
          builder: (context) => CountryDetailPage(
                country: (settings.arguments as Map)['country'] as Country,
              ));
  }

  return null;
};

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';
}
