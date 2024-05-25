import 'package:great_form/data/base/either.dart';
import 'package:great_form/data/base/failure.dart';
import 'package:great_form/data/model/country_code.dart';

/// Abstract class for country repository
abstract class CountryRepository {
  /// Get countries phone codes
  Future<Either<Failure, List<CountryCode>>> getCountryPhone();
}
