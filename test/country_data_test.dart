import 'package:flutter_test/flutter_test.dart';
import 'package:great_form/data_source/country_data_source_impl.dart';
import 'package:great_form/model/country_code.dart';

void main() {
  group('CountryDataSourceImpl', () {
    // Create an instance of CountryDataSourceImpl
    final CountryDataSourceImpl dataSource = CountryDataSourceImpl();

    test('getCountryPhone returns a list of CountryCode on success', () async {
      // Act
      final result = await dataSource.getCountryPhone();

      // Assert
      expect(result, isA<List<CountryCode>>());
      expect(result.length, isNot(0));
    });
    test('getCountryPhone returns a list with at least one flag', () async {
      // Act
      final result = await dataSource.getCountryPhone();
      final flags = result.where((e) => e.flagLink != null && e.flagLink!.startsWith('https')).map((e) => e.flagLink);

      // Assert
      expect(flags.length, isNot(0));
    });
  });
}
