# PS Digital Task

A Flutter application for managing digital tasks with a clean and intuitive user interface.

## 📱 Features

- **Profile Management**: View and edit user profile information
- **Menu Navigation**: Intuitive category-based menu system
- **Responsive Design**: Works on multiple screen sizes
- **Modern UI**: Clean and professional user interface

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter plugins
- Android Emulator or physical device for testing

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ps_digital_task.git
   cd ps_digital_task
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## 🏗 Project Structure

```
lib/
├── config/           # App configuration
│   ├── dependency_injection/
│   ├── routes/
│   └── theme/
├── core/             # Core functionality
│   ├── api/
│   ├── errors/
│   └── extensions/
└── features/         # Feature modules
    ├── main_screen/
    ├── menu_screen/
    └── profile_screen/
```

## 🎨 UI Components

The app uses a clean, modern design with custom widgets including:
- Profile card with user information
- Category-based menu system
- Custom buttons and input fields
- Responsive layouts

## 📝 Dependencies

Key packages used in this project:
- `flutter_bloc`: State management
- `get_it`: Dependency injection
- `dio`: HTTP client
- `shared_preferences`: Local storage
- `intl`: Internationalization

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📬 Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/ps_digital_task](https://github.com/yourusername/ps_digital_task)
