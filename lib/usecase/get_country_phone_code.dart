import 'package:great_form/base/either.dart';
import 'package:great_form/base/failure.dart';
import 'package:great_form/base/usecase.dart';
import 'package:great_form/model/country_code.dart';
import 'package:great_form/repository/country_repository.dart';
import 'package:great_form/repository/country_repository_impl.dart';

class GetCountryPhoneUseCase implements UseCase<List<CountryCode>, int?> {
  final CountryRepository repository = CountryRepositoryImpl();

  GetCountryPhoneUseCase();

  @override
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Future<Either<Failure, List<CountryCode>>> call(int? _) async {
    return await repository.getCountryPhone();
  }
}
