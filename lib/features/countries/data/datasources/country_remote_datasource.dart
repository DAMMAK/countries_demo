import 'package:cubex_demo/core/constants/app_constant.dart';
import 'package:cubex_demo/core/errors/exceptions.dart';
import 'package:cubex_demo/core/network/dio_client.dart';
import 'package:cubex_demo/features/countries/data/models/country_detail_model.dart';
import 'package:dio/dio.dart';

import '../models/country_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> fetchCountries();
  Future<CountryDetailModel> fetchCountryDetail(String name);
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final DioClient client;
  CountryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CountryModel>> fetchCountries() async {
    try {
      final response = await client.get(
        AppURLs.listCountriesUrl,
        queryParameters: {
          'status': 'true',
          'fields': AppURLs.listCountriesUrlFields,
        },
      );
      if (response.statusCode == 200) {
        List data = response.data as List;
        return data.map((json) => CountryModel.fromJson(json)).toList();
      } else {
        throw ServerException(
            'Failed to load countries with status: ${response.statusCode}');
      }
    } on DioException catch (ex) {
      throw ServerException(
          ex.response?.data.toString() ?? "Unknown error occurred");
    } catch (ex) {
      throw ServerException(ex.toString());
    }
  }

  @override
  Future<CountryDetailModel> fetchCountryDetail(String name) async {
    try {
      final response = await client.get('${AppURLs.countryDetailUrl}$name');
      if (response.statusCode == 200) {
        List data = response.data as List;
        return CountryDetailModel.fromJson(data.first);
      } else {
        throw ServerException(
            'Failed to load country details with status: ${response.statusCode}');
      }
    } on DioException catch (ex) {
      throw ServerException(
          ex.response?.data.toString() ?? "Unknown error occurred");
    } catch (ex) {
      throw ServerException('Failed to load country detail');
    }
  }
}
