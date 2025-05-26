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
![image8](https://github.com/user-attachments/assets/634d4b0f-1ac7-440c-9b9e-709935bdd8a6)
![image9](https://github.com/user-attachments/assets/3334318d-42f2-4097-b402-4dc35e807bf4)
![image11](https://github.com/user-attachments/assets/ee14d8bf-de91-43af-ac09-44da330ce88a)
![image13](https://github.com/user-attachments/assets/d39ba59a-14e9-432d-974f-c127ce41d4a8)
![image14](https://github.com/user-attachments/assets/6072f4c5-93d9-4cc3-a34e-b28039fb084c)
![image15](https://github.com/user-attachments/assets/22b190d6-1d62-4cce-ba44-c91b37b5ef2d)
![image12](https://github.com/user-attachments/assets/bafe079d-24c2-4a78-8aad-5faad57fd6a8)
![image1-left](https://github.com/user-attachments/assets/8164813c-79fb-4e02-86b1-39429a820dad)
![image2-portrait](https://github.com/user-attachments/assets/39e51ac0-8cec-432f-99d3-49ce9e1abdd8)
![image4-portrait](https://github.com/user-attachments/assets/cbd97677-3a60-4c22-bcd1-959f49683550)
![image1-portrait](https://github.com/user-attachments/assets/1e10d921-a645-4774-aca1-29c3720fcffe)
![image7-portrait](https://github.com/user-attachments/assets/bb6c88dd-5a59-4b58-87d2-d3e327a86940)
![image6-portrait](https://github.com/user-attachments/assets/fddf74e9-391c-4d32-8a3c-4c286febf6f2)
![image5-portrait](https://github.com/user-attachments/assets/734658d4-4352-4a6b-84fd-be50e99c78df)


🧑‍💻 Author
Imran7782
Mobile Developer (Flutter/Dart)
GitHub: https://github.com/Imran7782
