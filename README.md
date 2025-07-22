

# 🎬 Flutter Movie App - Version 1

A Flutter project focused on **web and desktop platforms**, designed to explore Flutter's differences compared to other web frameworks. This version includes:

- ✅ Login Page  
- ✅ Signup Page  
- ✅ Profile Page  
- ✅ Select Profile Page  

> This is **Version 1**. The next version will include:  
> 🏠 Home Page, 🎞️ Movie Detail Page, and ▶️ Movie Playing Page.

## 📸 Screenshots


### 🔐 Login Page  
<img src="https://i.ibb.co/FqDqp143/image.png" alt="Login" width="80%" />


### 📝 Signup Page  
<img src="https://i.ibb.co/Jwzwk2Bx/image.png" alt="Signup" width="80%" />


### 👤 Profile Page  
<img src="https://i.ibb.co/3mdrwxk4/image.png" alt="Profile" width="80%" />


### 🔄 Select Profile Page  
<img src="https://i.ibb.co/TFRwSRc/image.png" alt="Select Profile" width="80%" />



## 🛠️ Technologies & Architecture

- **Flutter** for Desktop and Web
- **Native Flutter State Management**: `ValueNotifier` and `ListenableBuilder`
- **Custom Theming with Light & Dark Modes**
- **Reusable Custom UI Components**:
  - `filled_btn_custom.dart`
  - `outlined_btn_custom.dart`
  - `switch_decoration.dart`
  - `textfied_decoration.dart`

## 🎨 Styling Focus

The project has a strong focus on UI styling:
- Global `AppColors` for consistent color usage
- `TextStyleDefault` for typography
- ThemeData organized for both light and dark themes

## 🎞️ Page Animations

All pages and widgets use smooth entrance animations, implemented via **custom mixins**.  
Example animation mixin used across widgets:

```dart
mixin SlideFadeAnimationMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  late AnimationController slideController;
  late AnimationController fadeController;

  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  Duration get slideDuration => AppUtils.slow;
  Duration get fadeDuration => AppUtils.normal;

  bool _hasTriggered = false;

  void setupSlideFadeAnimation() {
    slideController = AnimationController(vsync: this, duration: slideDuration);
    fadeController = AnimationController(vsync: this, duration: fadeDuration);

    slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.easeOut,
          ),
        );

    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    );

    triggerSlideFadeTransition();
  }

  void triggerSlideFadeTransition() {
    if (_hasTriggered) return;
    _hasTriggered = true;

    slideController.forward().whenComplete(() {
      fadeController.forward();
    });
  }

  @mustCallSuper
  @override
  void dispose() {
    slideController.dispose();
    fadeController.dispose();
    super.dispose();
  }
}
```

## 📦 Getting Started

1. Clone the repository  
2. Run `flutter pub get`  
3. Execute with `flutter run -d chrome` or use your desktop device

> 💡 Recommended for developers wanting to understand Flutter Web & Desktop differences.

---

## 🚧 Roadmap

- [x] Auth Screens (Login, Signup)
- [x] Profile Management
- [ ] Home Page
- [ ] Movie Detail Page
- [ ] Movie Playing Page

---

## 🧑‍💻 Author 

**Dev Renan Volpe**

Project created as a learning experience with Flutter for Web/Desktop.  
Feel free to fork, contribute, or give feedback!

[![GitHub](https://img.shields.io/badge/GitHub-renanvolpe-181717?logo=github)](https://github.com/renanvolpe)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-renanvolpe-0A66C2?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/renanvolpe/)


