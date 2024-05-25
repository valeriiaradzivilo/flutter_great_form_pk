import 'package:flutter/material.dart';
import 'package:great_form/data/model/country_code.dart';
import 'package:great_form/data/usecase/get_country_phone_code.dart';
import 'package:logger/web.dart';

/// Great phone form field
class GreatPhoneFormField extends StatefulWidget {
  /// Great phone form field constructor
  const GreatPhoneFormField({super.key, required this.formField, required this.constraints});

  /// [formField] is the form field widget
  final Widget formField;

  /// [constraints] is the constraints of the form field
  final BoxConstraints constraints;

  @override
  State<GreatPhoneFormField> createState() => _GreatPhoneFormFieldState();
}

class _GreatPhoneFormFieldState extends State<GreatPhoneFormField> {
  String? chosenCode;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryCode>>(
        future: Future(() async {
          final GetCountryPhoneUseCase getCountryPhoneUseCase = GetCountryPhoneUseCase();
          final getCountriesResult = await getCountryPhoneUseCase(null);
          if (getCountriesResult.isRight) {
            return getCountriesResult.asRight();
          }
          return [];
        }),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              leading: InkWell(
                onTap: () async {
                  final code = await showModalBottomSheet<String>(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      showDragHandle: true,
                      builder: (_) => _PhonePickerModalSheet(
                            countryCode: snapshot.requireData,
                          ));

                  setState(() => chosenCode = code);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(chosenCode ?? 'Select country'),
                ),
              ),
              title: ConstrainedBox(constraints: widget.constraints, child: widget.formField),
            );
          } else {
            return const Text('No data found in the api.');
          }
        });
  }
}

class _PhonePickerModalSheet extends StatelessWidget {
  const _PhonePickerModalSheet({required this.countryCode});
  final List<CountryCode> countryCode;

  @override
  Widget build(BuildContext context) {
    final extendedCountryCodes =
        countryCode.expand((country) => country.phoneCode.suffixes.map((phone) => (country, phone))).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const Text(
          'Country + code',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => _CountryCodeWidget(
                countryCode: extendedCountryCodes[index].$1,
                phoneCode: extendedCountryCodes[index].$1.phoneCode.root + extendedCountryCodes[index].$2),
            itemCount: extendedCountryCodes.length,
          ),
        )
      ]),
    );
  }
}

class _CountryCodeWidget extends StatelessWidget {
  const _CountryCodeWidget({required this.countryCode, required this.phoneCode});
  final CountryCode countryCode;
  final String phoneCode;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: countryCode.flagLink != null
          ? Image.network(
              countryCode.flagLink!,
              errorBuilder: (context, error, stackTrace) {
                Logger logger = Logger();
                logger.e('Image load failed: $error');
                return const Icon(Icons.flag_rounded);
              },
              width: 50,
              height: 100,
            )
          : null,
      title: Text(phoneCode),
      subtitle: Text(
        countryCode.name.common,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => Navigator.of(context).pop(phoneCode),
    );
  }
}
