import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_rank_app/core/general/binder/general_binding.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Rank',
      initialRoute: '/',
      initialBinding: GeneralBinding(),
      getPages: AppRouter.returnPages(),
    );
  }
}
