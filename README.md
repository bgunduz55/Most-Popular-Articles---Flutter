# most_popular_articles_bgunduz

# Most Popular Articles By Burak GUNDUZ


## Introduction
This project is a Flutter-based mobile application that allows users to browse and read news articles from the New York Times Most Popular section.

## Architecture
The project follows the MVVM (Model-View-ViewModel) architecture pattern, which separates the application into three main components:

Model: Represents the data and business logic of the application.
View: Represents the UI components and user interface of the application.
ViewModel: Acts as a bridge between the Model and the View, handling data communication and state management.

## Technical Details
The Flutter News App is built using the Flutter framework, a popular open-source UI software development kit. The application fetches news articles from the New York Times API using the NewsService class. It uses Provider package for state management, allowing seamless communication between the ViewModel and View components.

The app includes the following screens:

ArticleListScreen: Displays a list of most popular news articles fetched from the New York Times API. Users can click on an article to view its details.
ArticleDetailScreen: Shows the detailed view of a selected news article, including the article title, snippet, writer, date, and an image.
The app also includes a search functionality using the ArticleSearchDelegate, allowing users to search for specific topics and articles.

## Screenshots
Include some screenshots of the app in action here.

## Installation
To run the Flutter News App on your device, follow these steps:

Clone the repository to your local machine.
Make sure you have Flutter installed and set up on your machine.
Run flutter pub get to install the required dependencies.
Connect your device or use an emulator.
Run flutter run to launch the app on your device or emulator.
Usage
Upon launching the app, you will see a list of most popular news articles from the New York Times. Clicking on an article will take you to its detailed view, where you can read the full article. Use the search functionality to find specific articles based on your interests.

## Technologies Used
Flutter
Provider (State Management)
New York Times API
Contributing
Contributions to the Flutter News App are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License
The Flutter News App is open-source and available under the MIT License. Feel free to use, modify, and distribute it as per the terms of the license.
