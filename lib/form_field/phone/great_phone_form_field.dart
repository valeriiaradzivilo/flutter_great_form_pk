import 'package:flutter/material.dart';
import 'package:great_form/model/country_code.dart';
import 'package:great_form/usecase/get_country_phone_code.dart';

class GreatPhoneFormField extends StatefulWidget {
  const GreatPhoneFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<GreatPhoneFormField> createState() => _GreatPhoneFormFieldState();
}

class _GreatPhoneFormFieldState extends State<GreatPhoneFormField> {
  List<CountryCode> _countryCody = [];
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
          return _countryCody = getCountriesResult.asRight();
        }
        return [];
      }),
      initialData: const [],
      builder: (context, snapshot) => Row(
        children: [
          InkWell(
            onTap: () => showModalBottomSheet(
                context: context,
                builder: (_) => _PhonePickerModalSheet(
                      countryCody: _countryCody,
                    )),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(chosenCode ?? 'Select country'),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
            ),
          )
        ],
      ),
    );
  }
}

class _PhonePickerModalSheet extends StatelessWidget {
  const _PhonePickerModalSheet({required this.countryCody});
  final List<CountryCode> countryCody;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Text('Country + code'),
        for (final country in countryCody)
          for (final phone in country.phoneCode.suffixes)
            _CountryCodeWidget(countryCode: country, phoneCode: country.phoneCode.root + phone)
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
      leading: Image.network(countryCode.svgFlag ?? ''),
      title: Text(phoneCode),
      subtitle: Text(countryCode.name.common),
    );
  }
}
