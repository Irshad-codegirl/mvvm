import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm/utilis/routes.dart';
import 'package:mvvm/utilis/routes_name.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <-- Important
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 890), // Match your design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => UserViewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoutes,
          ),
        );
      },
    );
  }
}
