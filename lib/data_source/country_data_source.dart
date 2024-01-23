import 'package:great_form/model/country_code.dart';

abstract class CountryDataSource {
  Future<List<CountryCode>> getCountryPhone();
}
