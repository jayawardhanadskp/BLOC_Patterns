# Flutter BLoC 

This repository contains various examples of Flutter applications using the BLoC (Business Logic Component) pattern to manage state. The examples include a weather application, a simple counter application, and an authentication example.

## Prerequisites

- Flutter SDK (version 2.0 or higher)
- Dart SDK
- A code editor like Visual Studio Code or Android Studio

# BLoC Pattern Explanation

- ### Events:
  Events are inputs that trigger state changes in the BLoC. These are typically user actions, such as button presses or lifecycle events.
- ### States:
  States represent the current condition or UI state of the app after the event has been processed. States can be in different conditions like loading, success, or failure.
- ### BLoC:
  The BLoC (Business Logic Component) listens for incoming events, processes them, and emits new states. The main BLoC class typically extends `Bloc<Event, State>`.


## Example Apps

### Weather App
In the weather app, the `WeatherBloc` listens for the `WeatherFetched` event and fetches weather data from a repository. The state includes `WeatherLoading`, `WeatherSuccess`, and `WeatherFailure`.

### Counter App
The counter app uses a simple counter that is increased or decreased with `IncrementEvent` and `DecrementEvent`. The state is represented by `CounterState`, which holds the current value of the counter.

### Authentication App
The authentication app includes login and logout functionality. The `AuthBloc` processes `AuthLogInRequested` and `AuthLogOutRequested` events, handling success, failure, and loading states. It also includes basic email and password validation.




