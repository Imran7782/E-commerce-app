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
| Localization | `esay_localization`, `.arb` files |
| Backend/Database | Firebase () |
| State Management | [Providerd] |

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
```
![Screenshot 2025-05-10 173022](https://github.com/user-attachments/assets/7cf99d2e-d1d8-4cdd-8bc2-95b5489cc625)
![Screenshot 2025-05-10 172953](https://github.com/user-attachments/assets/f63ad593-e78f-4165-a417-5bbe4367b8fe)
![Screenshot 2025-05-10 172925](https://github.com/user-attachments/assets/66702800-0426-415e-b9ed-d288475e7a37)
![Screenshot 2025-05-10 173859](https://github.com/user-attachments/assets/05c12d2a-a286-4d4c-882f-65b1c5d6fcae)
![Screenshot 2025-05-10 173607](https://github.com/user-attachments/assets/02763d57-2429-4a1b-a74b-99c93f5150f7)
![Screenshot 2025-05-10 173535](https://github.com/user-attachments/assets/dfa64c37-fed9-4dea-8a28-e09de1808b96)
![Screenshot 2025-05-10 173508](https://github.com/user-attachments/assets/62c9c889-6edf-4fb4-962a-ae397fa462f4)
![Screenshot 2025-05-10 173423](https://github.com/user-attachments/assets/2ba8a190-04d7-4bfa-9d6d-3b222574a1c6)
![Screenshot 2025-05-10 173403](https://github.com/user-attachments/assets/ed2af9e7-1cee-4dcd-8310-8d1fb1cdf75d)
![Screenshot 2025-05-10 173344](https://github.com/user-attachments/assets/eb22eae6-9912-4251-9f5b-851f93c5215a)
![Screenshot 2025-05-10 173309](https://github.com/user-attachments/assets/3f066593-3f30-43bc-8bd4-9b419edd63bd)
![Screenshot 2025-05-10 173252](https://github.com/user-attachments/assets/cdd93361-f40e-4f8a-8619-a6ab10c5c0c8)
![Screenshot 2025-05-10 173229](https://github.com/user-attachments/assets/cbe6b518-70e9-4009-8767-d10ca832fb7b)
![Screenshot 2025-05-10 173118](https://github.com/user-attachments/assets/1c8b1d9e-dba8-474b-afcb-0de3b9e2113b)
![Screenshot 2025-05-10 173051](https://github.com/user-attachments/assets/7f1900ad-b7ac-42b7-b0f6-66cbd99bbead)


🧑‍💻 Author
Imran7782
Mobile Developer (Flutter/Dart)
GitHub: https://github.com/Imran7782
