import 'dart:developer';

import 'package:great_form/data_source/country_data_source.dart';
import 'package:great_form/model/country_code.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'https://restcountries.com/v3.1/all';

const _fieldName = 'name';
const _fieldIdd = 'idd';
const _fieldFlag = 'flag';

const _fieldSelector = '?fields=';

class CountryDataSourceImpl implements CountryDataSource {
  @override
  Future<List<CountryCode>> getCountryPhone() async {
    final url = Uri.parse('$_baseUrl$_fieldSelector$_fieldName,$_fieldIdd,$_fieldFlag');
    final result = await http.get(url);
    if (result.statusCode == 200) {
      return CountryCode.countryCodesFromJson(result.body);
    } else {
      log('Could not get country codes code ${result.statusCode} message ${result.body}');
      throw Exception('Error while fetching data');
    }
  }
}
