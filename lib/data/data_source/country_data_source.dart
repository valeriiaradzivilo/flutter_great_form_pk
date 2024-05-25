import 'package:great_form/data/model/country_code.dart';

abstract class CountryDataSource {
  Future<List<CountryCode>> getCountryPhone();
}
