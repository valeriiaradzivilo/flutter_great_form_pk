import 'package:great_form/data/model/country_code.dart';

/// Abstract class for country data source
abstract class CountryDataSource {
  /// Get countries phone codes
  Future<List<CountryCode>> getCountryPhone();
}
