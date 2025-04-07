import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/note_page.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
    url: "https://saubxtipbpdmbgestgtg.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNhdWJ4dGlwYnBkbWJnZXN0Z3RnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQwMjE4NDIsImV4cCI6MjA1OTU5Nzg0Mn0.WH2Ih1d5CNjQJjqduHcvodbGUx6pQl3M7Yi3eNmIsbM",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NotePage());
  }
}
