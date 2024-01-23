import 'package:great_form/base/either.dart';
import 'package:great_form/base/failure.dart';
import 'package:great_form/data_source/country_data_source.dart';
import 'package:great_form/data_source/country_data_source_impl.dart';
import 'package:great_form/model/country_code.dart';
import 'package:great_form/repository/country_repository.dart';

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
