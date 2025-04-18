# News App

A modern, cross-platform News App built with Flutter that delivers the latest headlines and personalized news feeds. This app fetches news data from a REST API and supports search functionality.


![App Preview](https://themindstudios.com/blog/content/images/2019/08/Breaking-News.jpg)
---

## Features

- **Latest News Feed**: Browse trending headlines from various categories
- **Search Functionality**: Find articles by keywords or topics.
- **Responsive UI**: Optimized for various screen sizes

---

## Tech Stack
- **Flutter (Dart)**: Cross-platform UI framework.
- **Bloc/Cubit**: State management for clean architecture.
- **REST API**: Fetch real-time news data.
- **Firebase**: Authentication for login and register.
- **Dependency Injection**: provide a service locator using get_it
- **MVVM (Model-View-ViewModel)**: Clean code and well structure

---

## Setup & Installation

Follow these steps to get the app up and running on your machine:

1. **Clone the repository**
    ```sh
    git clone https://github.com/hemahawas/news_app.git
    ```

2. **Navigate to the project directory**
    ```sh
    cd news_app
    ```
    
3. **Install dependencies**
    ```sh
    flutter pub get
    ```

4. **Run the app**
    ```sh
    flutter run
    ```
---

## Directory Structure

```plaintext
lib/
├── core/        
|    ├── api
|    ├── config
|    ├── constants
|    ├── errors
|    ├── shared_widgets
|    ├── utils
|
├── faetures/
|    ├── auth
|        ├── data
|            ├── model
|            ├── repo
|        ├── presentation
|            ├── view
|            ├── view_model
|    ├── home
|        ├── data
|            ├── model
|            ├── repo
|        ├── presentation
|            ├── view
|            ├── view_model
```
----

## 📌 Live Demo: 
[Watch it here!](https://drive.google.com/file/d/10nI4QEg1oPR3rMgM-jJsA_ogaQmNmfep/view?usp=drive_link)
