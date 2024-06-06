# probi_flutter
- Sample project for skills assesment

## What to do?
- Sample project: Blog creation APP (API provided by JSON Placeholder)
- Create a simple blog posting app using flutter

### requirements

#### Packages

- Routing with Auto Route
- Http request handling with Dio
- Class/Model creation with Freezed
- State management with Provider
- UI Creation with any package you'd like to use.


#### Expected output

- User can list, view, create, update and delete posts
    - Each operation must have it's own screen
        - Ex: list - post list screen

- Post drafting
    - Create a draft system where users can save their drafts on their local storage

- Favourite Listing
    - Have a screen for favourite post list
    - when user mark a post as favourite from post view screen, it must be added to favourite list screen.

- Simple theme switcher
    - Create 2 set of app theme
    - Make the app switch theme when a button is tapped.

- UI design
    - 2 by 2 grid system for post listing
        - include an image (any image will do)
    - Provide a way to paginate posts (5 per load)

- Follow folder structure below.
- Follow file naming style below.

## Folder Structure and File naming
- Create folders if necessary, don't if it would not contain any files.
```
lib/
|-- features/
|   |-- [feature_name]/
|   |   |-- models/
|   |   |   |-- [model_name]/
|   |   |   |   |-- [model_name].dart 
|   |   |   |   |-- [model_name].g.dart (auto generated)
|   |   |   |   |-- [model_name].freeze.dart (auto generated)
|   |   |-- screens/
|   |   |   |   |-- [screen_name].screen.dart
|   |   |-- services/
|   |   |   |-- [service_name].service.dart
|   |   |-- providers/
|   |   |   |   |-- [provider_name].provider.dart
|   |   |-- widgets/
|   |   |   |   |-- [widget_name].widget.dart
|-- themes/
|   |-- default.theme.dart
|   |-- [theme_name].theme.dart
|-- routing/
|   |-- app.router.dart
|   |-- app.router.g.dart (auto generated)
```

### Features
- Directory for each app feature (ex. auth/sign-in)
- Each feature should contain the following sub directory (if necessary):
  - models : models used for this feature (we will be using freezed packaged for models management).
  - screens : necessary screens for this feature implementation.
  - services : necessary services specifically created for this feature.
  - providers : necessary providers specifically created for this feature.
  - widgets : widgets user specifically for this feature.

### Theme
- Contains app-wide theme data.

---

## DEPENDENCIES / PACKAGES

### List of dependencies and their use cases
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) - Secured local storage.
- [auto_route](https://pub.dev/packages/auto_route) - Route management.
- [freezed](https://pub.dev/packages/freezed) - Class/Model generation.
- [dio](https://pub.dev/packages/dio) - Http Request handler.

### API
- [JSON Placeholder](https://jsonplaceholder.typicode.com/) - test API provider.
