# 🛒 Kurd Shop — Flutter E-Commerce App

**Kurd Shop** is a modern and elegant cross-platform e-commerce application built using **Flutter** and **Dart**. It provides a smooth online shopping experience with multi-language support and integrated maps. Designed with a clean UI, the app is suitable for both Android and iOS users.

---

## 📦 App Features

- 👋 **Introduction Screen** – Welcomes users with an onboarding experience
- 🔐 **Login & Sign-Up** – Firebase authentication for user accounts
- 🏠 **Home Page** – Displays featured and new products
- 👤 **Profile Page** – User information with editing capabilities
- ❤️ **Favorites Page** – Save products you love
- 🛒 **Cart Page** – Add/remove items, view total price
- 🔍 **Product View Page** – Detailed info about products
- 🗺️ **Map Page** – Integrated with Google Maps and OpenStreetMap
- ☰ **Navigation Drawer** – Quick access to all major screens
- 🌐 **Multi-language Support** – Kurdish, Arabic, and English
- 🎨 **Modern UI** – Clean, responsive, and intuitive design
- 🔄 **Cross-Platform** – Compatible with both Android and iOS

---

## 🛠️ Technologies Used

| Feature | Technology |
|--------|-------------|
| UI Framework | Flutter (Dart) |
| Authentication | Firebase Authentication |
| Map Integration | Google Maps API, OpenStreetMap |
| Localization | `flutter_localizations`, `.arb` files |
| Backend/Database | Firebase (optionally extendable) |
| State Management | [Add if applicable: e.g., Provider, Bloc, Riverpod] |

---

## 🌍 Supported Languages

- 🇰🇼 **Kurdish** (کوردی)
- 🇸🇦 **Arabic** (العربية)
- 🇬🇧 **English**

---

## 🗂️ Folder Structure

lib/
├── main.dart
├── screens/
│ ├── introduction/
│ ├── auth/ # Login & signup pages
│ ├── home/
│ ├── profile/
│ ├── cart/
│ ├── favorites/
│ ├── product_view/
│ └── map/
├── widgets/ # Reusable components
├── localization/ # Multi-language support files
├── models/
└── services/

yaml
Copy
Edit

---

## 🚀 Getting Started

Follow these steps to run Kurd Shop locally:

### 1. 🔁 Clone the Repository
```bash
git clone https://github.com/Imran7782/E-commerce-app.git
cd E-commerce-app
2. 📦 Install Dependencies
Make sure Flutter is installed, then run:

bash
Copy
Edit
flutter pub get
3. 🔑 Set Up Firebase
To use Firebase authentication:

Go to Firebase Console

Create a new project

Download and place your:

google-services.json in android/app/

GoogleService-Info.plist in ios/Runner/

Enable Email/Password Authentication in Firebase

4. 🗺️ Set Up Google Maps API Key
Get an API key from Google Cloud Console

Add it to AndroidManifest.xml and AppDelegate.swift:

xml
Copy
Edit
<!-- android/app/src/main/AndroidManifest.xml -->
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY"/>
swift
Copy
Edit
// ios/Runner/AppDelegate.swift
GMSServices.provideAPIKey("YOUR_API_KEY")
5. ▶️ Run the App
bash
Copy
Edit
flutter run
📸 Screenshots (Optional)
Add screenshots here if you'd like to showcase your UI.

🧑‍💻 Author
Imran7782
Mobile Developer (Flutter/Dart)
GitHub: https://github.com/Imran7782
