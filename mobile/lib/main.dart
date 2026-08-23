import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LonmApp());
}

class LonmApp extends StatelessWidget {
  const LonmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Lonm',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF1a1a2e),
            scaffoldBackgroundColor: const Color(0xFF0f0f1e),
            useMaterial3: true,
            fontFamily: 'Cairo',
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          home: const LonmHomePage(),
          locale: const Locale('ar', 'SA'),
          fallbackLocale: const Locale('en', 'US'),
        );
      },
    );
  }
}

class LonmHomePage extends StatefulWidget {
  const LonmHomePage({Key? key}) : super(key: key);

  @override
  State<LonmHomePage> createState() => _LonmHomePageState();
}

class _LonmHomePageState extends State<LonmHomePage> {
  late GoogleSignIn _googleSignIn;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🎬 Lonm',
              style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'تطبيق الأفلام والمسلسلات',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 40.h),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  final user = await _googleSignIn.signIn();
                  if (user != null) {
                    Get.snackbar(
                      'مرحبا',
                      'تم تسجيل الدخول بنجاح: ${user.email}',
                      colorText: Colors.white,
                    );
                  }
                } catch (e) {
                  Get.snackbar(
                    'خطأ',
                    'فشل تسجيل الدخول',
                    colorText: Colors.white,
                  );
                }
              },
              icon: const Icon(Icons.login),
              label: Text('تسجيل الدخول عبر Google', style: TextStyle(fontSize: 14.sp)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF1a1a2e),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'بحث',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الحساب',
          ),
        ],
      ),
    );
  }
}
