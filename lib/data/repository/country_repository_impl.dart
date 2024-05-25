import 'package:great_form/data/base/either.dart';
import 'package:great_form/data/base/failure.dart';
import 'package:great_form/data/data_source/country_data_source.dart';
import 'package:great_form/data/data_source/country_data_source_impl.dart';
import 'package:great_form/data/model/country_code.dart';
import 'package:great_form/data/repository/country_repository.dart';

/// Country repository implementation
class CountryRepositoryImpl implements CountryRepository {
  final CountryDataSource _dataSource = CountryDataSourceImpl();

  @override
  Future<Either<Failure, List<CountryCode>>> getCountryPhone() async {
    try {
      return Right(await _dataSource.getCountryPhone());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
