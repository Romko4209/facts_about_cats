# workload

### Generate Localized Strings
````
flutter packages pub run l10n_generator:main -o ./lib/generated
````

### Build generated classes (JSON, Freezed, etc)
````
flutter packages pub run build_runner build --delete-conflicting-outputs
````

### Analyze code

````
flutter analyze .
````
