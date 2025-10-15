# Daily Pulse App

A simple and elegant Flutter application to track your daily mood.

## Features

- Log your mood with emojis.
- Add notes to your mood entries.
- View your mood history.
- See analytics of your mood patterns.
- Light and Dark theme support.
- Firebase authentication (Email/Password).
- Mood entries are stored in Cloud Firestore.

## Project Structure

The project is structured as follows:

```
lib/
├── app/              # Main application widget and constants
├── firebase/         # Firebase services (Auth, Firestore)
├── models/           # Data models (MoodEntry)
├── pages/            # UI for different screens
├── providers/        # State management using Provider
└── widgets/          # Reusable UI components
```

## State Management

This project uses the `provider` package for state management. The following providers are used:

- `AuthProvider`: Manages user authentication state using Firebase Authentication.
- `MoodProvider`: Manages mood entries, storing them in Cloud Firestore.
- `ThemeProvider`: Manages the application's theme.

## Tech Stack

- **Flutter**: 3.35.6
- **Dart**: 3.9.2
- **Firebase**: 
  - Firebase Authentication
  - Cloud Firestore

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK
- A configured Firebase project with Authentication and Firestore enabled.

### Installation

1.  Install packages
    ```sh
    flutter pub get
    ```
2.  Run the app
    ```sh
    flutter run
    ```