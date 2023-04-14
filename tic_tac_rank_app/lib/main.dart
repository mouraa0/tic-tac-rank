import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  // await Supabase.initialize(
  //   url: 'YOUR_SUPABASE_URL',
  //   anonKey: 'YOUR_SUPABASE_ANON_KEY',
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Rank!',
      initialRoute: '/login',
      getPages: AppRouter.returnPages(),
    );
  }
}
