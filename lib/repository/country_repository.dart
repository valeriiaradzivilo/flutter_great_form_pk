import 'package:great_form/base/either.dart';
import 'package:great_form/base/failure.dart';
import 'package:great_form/model/country_code.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountryCode>>> getCountryPhone();
}
