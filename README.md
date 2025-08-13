# Flutter Chat App

A simple real-time chat application built with Flutter and Firebase.  
Users can sign in, send messages, and see messages from others in real-time.

## Features

- Firebase Authentication (Email/Password)
- Real-time chat using Cloud Firestore
- Chat bubbles with different colors for sender/receiver
- Timestamp ordering so newest messages appear at the bottom
- Responsive UI

---

## Tech Stack

- Frontend: Flutter (Dart)
- Backend: Firebase Authentication, Cloud Firestore
- State Management: Stateful Widgets
- UI Components: Material Design

---

## Installation & Setup

### 1. Clone this repository

```bash
git clone https://github.com/lovelyn2001/flutter-chat-app.git
cd flutter-chat-app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/).
2. Create a new Firebase project.
3. Enable Authentication → Email/Password.
4. Create a Cloud Firestore database in Test Mode.
5. Download the `google-services.json` file and place it in:

```
android/app/google-services.json
```

6. Add the following to your `android/build.gradle`:

```gradle
classpath 'com.google.gms:google-services:4.3.15'
```

And in `android/app/build.gradle`:

```gradle
apply plugin: 'com.google.gms.google-services'
```

### 4. Run the app

```bash
flutter run
```

## 🔮 Future Improvements

- ✅ Auto-scroll to latest message
- ✅ Show message timestamps
- ✅ Add profile pictures
- ✅ Typing indicators

## 📜 License

This project is licensed under the MIT License.
