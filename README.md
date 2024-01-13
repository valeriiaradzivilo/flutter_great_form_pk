# Great Form
This is a custom Form Widget that allows to spend less time on creating the same forms all over the app.
Adds an automatic validation and gaps between fields.

## Features


## Getting started

Run in terminal to add package to pubspec.yaml

```dart
flutter pub add great_form
```

## Usage

```dart
GreatForm(
fields:[
        GreatFormField(
        hintText: 'Email',
        validator: Validator.email,
    ),
    GreatFormField(
        hintText: 'Password',
        validator: Validator.password,
    ),
    GreatFormField(),
]
)
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

