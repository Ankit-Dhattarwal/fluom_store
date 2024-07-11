# Fluom 💻

A Flutter project with GetX state management and shared preferences for building an application with login, registration, email verification, and password reset functionalities.

## Getting Started 🚀

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Additional Features ✨

### State Management with GetX 🔄

This project utilizes GetX for state management. GetX is a lightweight, fast, and powerful state management library for Flutter.

### Shared Preferences 🔄

Shared preferences are used in this project for persisting user settings and data locally on the device.

### Login and Registration 🔒

The application includes functionality for user login and registration. All necessary validations are implemented to ensure data integrity.

### Email Verification 📧

Users are required to verify their email addresses upon registration. This ensures the security of user accounts and prevents unauthorized access.

### Password Reset 🔑

In case users forget their passwords, a password reset feature is provided. Users can initiate a password reset process, and instructions will be sent to their registered email addresses.

## Stripe Payment Gateway 💳

This project integrates Stripe for handling payments. Users can securely process payments within the app using Stripe's payment gateway. The implementation covers creating a payment intent, initializing the payment sheet, and presenting the payment sheet for the user to complete the transaction.

## Handling Data Fetching in GetX 📡

### Why Use GetX for Data Fetching?

GetX simplifies the state management process by providing reactive programming capabilities. This allows the application to automatically update the UI when data changes, eliminating the need for manual setState calls. It also includes built-in support for dependency injection and route management, making it a comprehensive solution for state management in Flutter.

### How to Handle Data Fetching in GetX

To handle data fetching in GetX, you need to create a controller that will manage the state of your data. The controller will fetch data from your data source (e.g., a remote API or a local database) and store it in reactive variables. These variables will then be observed by the UI, which will update automatically when the data changes.

### How GetX Helps in Data Fetching

- **Reactive State Management:** GetX makes it easy to manage state reactively, ensuring that the UI updates automatically when the data changes.
- **Simplicity:** With GetX, you can manage your state, dependencies, and routes with minimal boilerplate code.
- **Performance:** GetX is known for its performance and efficiency, as it only updates parts of the UI that need to be updated.
- **Dependency Injection:** GetX provides a simple and effective way to manage dependencies, making it easy to fetch and use data from various sources.



## Screenshots 📸

Here are some screenshots of the Fluom app:

- ![Fetch Data] <img width="1372" alt="Screenshot 2024-02-07 at 2 39 54 AM" src="https://github.com/Ankit-Dhattarwal/fluom_store/assets/109728587/9cbd01ee-e925-4f31-bdf4-b48ebf4313a5">

- [ SignIn & SignUp Pages ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 07 02 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/6f2801ee-f2d3-4a0d-9827-863e677c0242">
<img width="1440" alt="Screenshot 2024-07-11 at 11 07 09 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/a6ede49c-8f0e-4df1-83e5-9b3fae97427c">

-[ Splash Screen ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 03 58 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/ed047699-9e31-4692-b8d7-ddd47d16eaab">

- [ Home Page ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 04 11 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/c9822742-0aeb-4893-85ad-f3cf48d86f96">
<img width="1440" alt="Screenshot 2024-07-11 at 11 04 18 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/4f121a40-72cd-46e3-8a71-ce728830c49c">

- [ Cart Page ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 04 25 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/fd828cf6-c359-444c-b31f-e123f7982841">

- [ Store Screen ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 04 33 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/053ad9b5-53ac-4183-9540-6bd41d473802">

- [ Profile Page and Edit Profile Page ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 04 39 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/e2ec18f6-883f-44c0-9a58-df2b31dd45aa">
<img width="1440" alt="Screenshot 2024-07-11 at 11 04 55 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/f5d87df6-1fb2-4e20-985a-6f3e8b5d6c0e">

- [ Product Detials and Review Page ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 05 03 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/81760a59-18a2-40c2-98c3-46343084f051">
<img width="1440" alt="Screenshot 2024-07-11 at 11 05 37 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/5c95131a-6759-4da7-ab84-6afa6b9eb01a">
<img width="1440" alt="Screenshot 2024-07-11 at 11 05 44 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/1e59d09e-99ed-4d32-a230-3d69c8138eae">
<img width="1440" alt="Screenshot 2024-07-11 at 11 05 57 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/9f478f90-2d35-44ff-8676-416a249fa8b9">

- [ Payement, Order Review and Review or Rating Screen ]
<img width="1440" alt="Screenshot 2024-07-11 at 11 06 15 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/66ad63f4-b86b-4b61-b6c3-82a8ca4d19d5">
<img width="1440" alt="Screenshot 2024-07-11 at 11 06 08 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/0efef8aa-bd9b-4a2f-9c4a-9e579bdee41b">
<img width="1440" alt="Screenshot 2024-07-11 at 11 05 21 PM" src="https://github.com/Ankit-Dhattarwal/SnakeGameDesktop/assets/109728587/b86aaadf-7e38-4e29-acdf-eed31dc891b9">

For more information on GetX and shared preferences, refer to the [online documentation](https://docs.getx.dev/) and [shared_preferences package](https://pub.dev/packages/shared_preferences), respectively.
