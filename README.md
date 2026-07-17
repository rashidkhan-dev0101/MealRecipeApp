# MealRecipeApp
<div align="center">

# 🍽️ Recipe App

### A modern Recipe Application built with **SwiftUI**, **MVVM**, **Firebase Authentication**, and **TheMealDB API**

Discover thousands of delicious recipes, explore meal categories, search your favorite dishes, and save meals you love.

![Swift](https://img.shields.io/badge/Swift-6-orange?style=for-the-badge&logo=swift)
![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS-blue?style=for-the-badge)
![Firebase](https://img.shields.io/badge/Firebase-Authentication-yellow?style=for-the-badge&logo=firebase)
![MVVM](https://img.shields.io/badge/Architecture-MVVM-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</div>

---

# ✨ Features

- 🔐 Firebase Authentication
- 👤 User Registration & Login
- 🍽️ Browse Meal Categories
- 🔍 Search Meals
- 📖 View Complete Recipe Details
- 🥩 Ingredients & Measurements
- 👨‍🍳 Cooking Instructions
- 🎲 Random Meal Generator
- ❤️ Save Favorite Recipes
- 🌙 Dark Mode Support
- ⚡ Async/Await Networking
- 📱 Fully Responsive SwiftUI Interface
- 🧩 Clean MVVM Architecture
- 🔄 Pull to Refresh
- 💾 Local Data Persistence

---

# 📱 Screenshots

| Login | Home | Details |
|-------|------|---------|
| Add Screenshot | Add Screenshot | Add Screenshot |

> Replace these placeholders with screenshots of your application.

---

# 🏗️ Architecture

This project follows the **Model–View–ViewModel (MVVM)** architecture.

```
RecipeApp
│
├── App
│
├── Models
│
├── Views
│   ├── Authentication
│   ├── Home
│   ├── Search
│   ├── Categories
│   ├── Details
│   ├── Favorites
│   └── Profile
│
├── ViewModels
│
├── Services
│   ├── API
│   ├── Authentication
│   └── Storage
│
├── Components
│
├── Utilities
│
└── Resources
```

---

# 🚀 Tech Stack

| Technology | Purpose |
|------------|----------|
| SwiftUI | User Interface |
| MVVM | Architecture |
| Firebase Authentication | User Authentication |
| URLSession | Networking |
| Async/Await | Concurrency |
| Codable | JSON Parsing |
| TheMealDB API | Recipe Data |
| Swift Package Manager | Dependency Management |

---

# 🌐 API

This application uses **TheMealDB API** to fetch recipe information.

### Endpoints Used

- Search Meals
- Categories
- Meal Details
- Random Meal
- Filter by Category
- Filter by Area
- Filter by Ingredient

Documentation:

https://www.themealdb.com/api.php

---

# 📂 Folder Structure

```
RecipeApp
│
├── App
├── Core
├── Models
├── Services
├── Networking
├── ViewModels
├── Views
├── Components
├── Extensions
├── Utilities
└── Resources
```

---

# 🎨 App Flow

```
Splash
     │
     ▼
Authentication
     │
     ├── Login
     └── Register
             │
             ▼
          Home
             │
 ┌───────────┼────────────┐
 ▼           ▼            ▼
Categories Search Favorites
             │
             ▼
        Meal Details
             │
             ▼
         Profile
```

---

# 🔥 Authentication

The application uses **Firebase Authentication**.

Supported methods:

- Email & Password Authentication
- User Registration
- Secure Login
- Logout
- Session Persistence

---

# 🍽️ Meal Features

- Browse Categories
- Search Meals
- Random Meal
- Recipe Instructions
- Ingredients List
- Measurements
- Meal Thumbnail
- YouTube Video
- Source URL
- Favorite Meals

---

# 📸 Future Improvements

- ✅ Offline Caching
- ✅ Recipe Sharing
- ✅ Meal Planner
- ✅ Shopping List
- ✅ AI Recipe Suggestions
- ✅ Nutrition Information
- ✅ Voice Search
- ✅ Multiple Languages

---

# 🚀 Getting Started

## Clone Repository

```bash
git clone https://github.com/yourusername/RecipeApp.git
```

Open the project in **Xcode**.

---

## Configure Firebase

1. Create a Firebase project.
2. Enable Email & Password Authentication.
3. Download `GoogleService-Info.plist`.
4. Add it to the Xcode project.

---

## Run

```bash
⌘ + R
```

Requires:

- Xcode 16+
- iOS 17+
- Swift 6

---

# 📚 What You'll Learn

This project demonstrates:

- SwiftUI Best Practices
- MVVM Architecture
- Firebase Authentication
- REST API Integration
- Async/Await
- Codable
- Reusable Components
- State Management
- NavigationStack
- Modern iOS UI Design
- Clean Code Principles

---

# 🤝 Contributing

Contributions are welcome!

If you'd like to improve the project:

1. Fork the repository
2. Create a new branch
3. Commit your changes
4. Open a Pull Request

---

# 📄 License

This project is licensed under the MIT License.

---

# 👨‍💻 Author

**Rashid Khan**

iOS Developer • SwiftUI Enthusiast • Flutter Developer

- GitHub: https://github.com/yourusername
- LinkedIn: https://linkedin.com/in/yourprofile

---

<div align="center">

### ⭐ If you like this project, don't forget to star the repository!

Made with ❤️ using SwiftUI

</div>
