import 'package:flutter_test/flutter_test.dart';
import 'package:great_form/data_source/country_data_source_impl.dart';
import 'package:great_form/model/country_code.dart';

void main() {
  group('CountryDataSourceImpl', () {
    // Create an instance of CountryDataSourceImpl
    late final CountryDataSourceImpl dataSource;

    setUp(() {
      dataSource = CountryDataSourceImpl();
    });

    test('getCountryPhone returns a list of CountryCode on success', () async {
      // Act
      final result = await dataSource.getCountryPhone();

      // Assert
      expect(result, isA<List<CountryCode>>());
      expect(result.length, isNot(0));
    });
  });
}
