import 'package:great_form/data/base/either.dart';
import 'package:great_form/data/base/failure.dart';
import 'package:great_form/data/base/usecase.dart';
import 'package:great_form/data/model/country_code.dart';
import 'package:great_form/data/repository/country_repository.dart';
import 'package:great_form/data/repository/country_repository_impl.dart';

/// Get country phone use case
class GetCountryPhoneUseCase implements UseCase<List<CountryCode>, int?> {
  /// Country repository
  final CountryRepository repository = CountryRepositoryImpl();

  @override
  Future<Either<Failure, List<CountryCode>>> call(int? _) async {
    return await repository.getCountryPhone();
  }
}
