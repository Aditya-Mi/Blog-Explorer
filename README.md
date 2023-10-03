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

## Cloning and Using the App

You can clone the Blog Explorer app repository from GitHub and set it up on your local machine for testing and development. Follow these steps to get started:

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) must be installed on your system.
- Git for cloning the repository.

### Clone the Repository

Open your terminal or command prompt and run the following command to clone the repository:

```
git clone https://github.com/Aditya-Mi/Blog-Explorer.git
```

### Navigate to the Project Directory

Change your current directory to the project folder:

```
cd Blog-Explorer
```

### Install Dependencies

Run the following command to install all the project dependencies:

```
flutter pub get
```

### Running the App

```
flutter run
```

