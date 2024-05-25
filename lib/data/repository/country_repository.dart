import 'package:great_form/data/base/either.dart';
import 'package:great_form/data/base/failure.dart';
import 'package:great_form/data/model/country_code.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountryCode>>> getCountryPhone();
}
