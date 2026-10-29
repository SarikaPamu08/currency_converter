
# Currency Converter

A responsive Currency Converter application built using Flutter and Dart.

## Features

- Convert between USD, INR, EUR, GBP and JPY
- Select source and target currencies
- Swap currencies easily
- Validate user input
- Display converted amounts
- Responsive interface built with Flutter widgets

## Technologies Used

- Flutter
- Dart
- Material Design
- Git and GitHub

## Application Screenshots

### Home Screen
(screenshots/currency-converter1.png)

## Experiment 2: Flutter Widgets

Explored Text, Container, Icon, Row, Column, ElevatedButton,
Card and ListTile widgets.


### Experiment 3: Responsive UI and Breakpoints

**Aim:** To design a responsive user interface that
adapts to different screen sizes.

**Implementation:**
- Used LayoutBuilder to measure available width.
- Implemented a 600-pixel responsive breakpoint.
- Used a vertical layout for narrow screens.
- Used a horizontal layout for wider screens.
- Applied ConstrainedBox to control maximum content width.

**Result:** Created a responsive Currency Converter
interface suitable for mobile and wider screens.


### Experiment 4: Navigation in Flutter

**Aim:** To implement navigation between screens using
Navigator and named routes.

**Implementation:**
- Created HomeScreen and HistoryScreen.
- Used Navigator.push() with MaterialPageRoute.
- Configured named routes in MaterialApp.
- Used Navigator.pushNamed() to navigate to history.
- Used Navigator.pop() to return to the home screen.

**Result:** Implemented navigation between the Currency
Converter home screen and conversion history screen.


### Experiment 5: Stateful and Stateless Widgets

**Aim:** To understand StatefulWidget, StatelessWidget, setState(), and Provider for state management.

**Implementation:**
- Used StatelessWidget to build the application interface.
- Used StatefulWidget to manage local UI state.
- Implemented setState() to toggle conversion details.
- Used Provider and ChangeNotifier to manage currency conversion data.
- Used notifyListeners() to update the UI when the data changes.

**Result:** Demonstrated local and shared state management in a Currency Converter application.


### Experiment 6: Custom Widgets and Themes

**Aim:** To create reusable custom widgets and apply themes and custom styles in Flutter.

**Implementation:**
- Created a reusable `CurrencyInfoCard` custom widget.
- Used parameters to customize the card title, value, and icon.
- Applied a common application theme using `ThemeData`.
- Customized AppBar and ElevatedButton styles.
- Used theme text styles to maintain consistent UI design.

**Result:** Created reusable currency information cards and applied a consistent theme throughout the application.

## How to Run

1. Install Flutter SDK.
2. Clone this repository.
3. Navigate to the project directory.
4. Run `flutter pub get`.
5. Run `flutter run -d chrome`.

## Note

The exchange rates used in this academic project are illustrative
and are not updated using a live exchange-rate API.
