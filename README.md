# Blog Explorer App

## Introduction

The Blog Explorer app is a Flutter mobile application that allows users to explore a list of blogs from the internet. It provides features such as viewing blog details, checking for an internet connection, caching limited data to local storage when internet is available, and managing favorite blogs using Hive local storage. The app uses Riverpod for state management.

## Features

### Home Screen

- Displays a list of blogs fetched from the internet.
- Provides a pull-to-refresh functionality to reload data.
- Checks for an internet connection and displays a Snackbar if not available.

### Blog Details Screen

- Shows detailed information about a selected blog.

### Favourites Screen

- Displays a list of favorite blogs stored in Hive local storage.
- Allows users to add or remove blogs from their favorites.

## Dependencies

- `flutter_riverpod` for state management.
- `hive` for local storage.
- `connectivity_plus` and `internet_connection_checker` for checking internet connectivity.
- `flutter_cache_manager` for caching network images.
- `cached_network_image` for displaying cached images.

## Implementation Details

### Riverpod Providers

```dart
// Define your Riverpod providers here

