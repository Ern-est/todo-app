ToDo App with Supabase & Flutter
This Flutter app is a simple ToDo list application integrated with Supabase for managing tasks. Users can add, update, and delete tasks in real-time using Supabase's database features.

Features:

Create, read, update, and delete tasks.

Real-time task management with Supabase.

Simple and intuitive UI for managing your ToDo tasks.

Setup:
Create a Supabase project:

Go to Supabase and create a new project.

Configure your Supabase instance:

In your Supabase project, set up a tasks table with necessary columns like id, title, and completed.

Replace the placeholder values in main.dart with your Supabase URL and API key.

Install dependencies: Run the following command to install necessary dependencies:

bash
Copy
Edit
flutter pub get

Run the app: Use the following command to launch the app:

bash
Copy
Edit
flutter run
Project Structure:
lib/: Contains all Dart files for the app.

main.dart: Entry point of the app, where the Supabase initialization and authentication are handled.


Notes:
Ensure your Supabase API keys and URLs are correctly set in the main.dart file.

The app uses real-time updates for task data via Supabase's real-time subscriptions.

![Screenshot_1744049754](https://github.com/user-attachments/assets/9b433e0f-7768-45f5-be7d-74e7c28e5dea)
![Screenshot_1744049464](https://github.com/user-attachments/assets/eedcef70-2549-4972-bfaf-5d5ec5db7811)
