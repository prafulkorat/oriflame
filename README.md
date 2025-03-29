# 📱 Flutter Project

## 📌 Project Overview
This Flutter project follows a modular architecture with GetX for state management. It is structured in a way that ensures maintainability and scalability.

---

## 🏗 Project Architecture
```
lib/
│── app/
│   ├── modules/
│   │   ├── edit_caption/
│   │   │   ├── bindings/
│   │   │   │   ├── edit_caption_binding.dart
│   │   │   ├── controllers/
│   │   │   │   ├── edit_caption_controller.dart
│   │   │   ├── views/
│   │   │   │   ├── edit_caption_view.dart
│   │   ├── home_screen/
│   │   │   ├── bindings/
│   │   │   │   ├── home_binding.dart
│   │   │   ├── controllers/
│   │   │   │   ├── home_controller.dart
│   │   │   ├── views/
│   │   │   │   ├── home_view.dart
│   │   ├── splash_screen/
│   │   │   ├── bindings/
│   │   │   │   ├── splash_binding.dart
│   │   │   ├── controller/
│   │   │   │   ├── splash_controller.dart
│   │   │   ├── view/
│   │   │   │   ├── splash_view.dart
│   ├── routes/
│   │   ├── app_pages.dart
│   │   ├── app_routes.dart
│   ├── utils/
│   │   ├── colors.dart
│   │   ├── common_text.dart
│   │   ├── img_icons.dart
│   │   ├── strings.dart
│── main.dart
```

---

## 🚀 How to Run the Project

### Prerequisites
Ensure you have the following installed:
- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (Included with Flutter)
- **Android Studio** or **Visual Studio Code**
- **An Android/iOS emulator** or a physical device

### Steps to Run
1. **Clone the repository**
   ```sh
   git clone https://github.com/prafulkorat/oriflame.git
   cd <your-project-folder>
   ```

2. **Install dependencies**
   ```sh
   flutter pub get
   ```

3. **Run the project**
   ```sh
   flutter run
   ```
    - If using an emulator, ensure it is running.
    - If using a physical device, enable USB debugging.

