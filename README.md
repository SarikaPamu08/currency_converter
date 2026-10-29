
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


## Experiment 1: Dart SDK Setup and Basic Dart Program
### Aim
To understand the Dart programming language and write a simple program using basic Dart concepts.

### Objectives
- Understand the basics of Dart programming.
- Learn variables and data types.
- Perform basic arithmetic operations.
- Display output using the `print()` function.

### Program
Created a simple Dart program to demonstrate variables, data types, and arithmetic operations.

### Concepts Covered
- Variables and data types (`int`, `double`, `String`, and `bool`)
- Arithmetic operators (`+`, `-`, `*`, `/`)
- Output using `print()`
- Basic Dart program structure

### Result
Successfully created a basic Dart program demonstrating variables, data types, arithmetic operations, and console output.


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


### Experiment 7: Forms and Input Validation
**Aim:** To create forms with input fields and implement validation and error handling in Flutter.

**Implementation:**
- Created a form using `Form` and `GlobalKey<FormState>`.
- Used `TextFormField` to accept the currency amount.
- Added a dropdown to select the target currency.
- Validated empty, invalid, and non-positive amounts.
- Displayed the converted amount after successful validation.

**Result:** Implemented a currency conversion form with input validation and error handling.


### Experiment 8: Animations in Flutter
**Aim:** To implement animations in Flutter using opacity and movement effects.

**Implementation:**
- Used `AnimatedOpacity` to demonstrate a fade animation.
- Used `AnimatedContainer` to animate widget movement.
- Used `Duration` to control animation timing.
- Used `Curves.easeInOut` for smooth transitions.
- Used `setState()` to toggle the animation states.

**Result:** Implemented fade and slide-like animations for a Currency Converter interface.


### Experiment 9: REST API Integration
**Aim:** To fetch data from a REST API and display it in a Flutter application.

**Implementation:**
- Used the HTTP package to send a GET request.
- Retrieved exchange-rate data from a REST API.
- Parsed the JSON response using `jsonDecode()`.
- Used `FutureBuilder` to handle loading, success, and error states.
- Displayed exchange rates in a list of cards.
- Added a refresh button to fetch updated data.

**Result:** Implemented REST API integration to retrieve and display currency exchange rates in Flutter.


### Experiment 10: Unit Testing and Debugging
**Aim:** To perform unit testing and understand debugging techniques in Flutter.

**Implementation:**
- Created a `CurrencyConverter` class to perform currency calculations.
- Wrote unit tests using the Flutter testing framework.
- Tested normal, zero, and decimal currency conversions.
- Tested error handling for negative amounts.
- Used `expect()` to compare actual results with expected results.

**Result:** Created unit tests to verify currency conversion logic and validate error handling.

## How to Run

1. Install Flutter SDK.
2. Clone this repository.
3. Navigate to the project directory.
4. Run `flutter pub get`.
5. Run `flutter run -d chrome`.

## Note

The exchange rates used in this academic project are illustrative
and are not updated using a live exchange-rate API.
