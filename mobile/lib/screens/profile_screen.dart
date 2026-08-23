import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late GoogleSignIn _googleSignIn;
  String? userEmail;
  String? userName;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
    );
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final user = await _googleSignIn.signInSilently();
    setState(() {
      if (user != null) {
        isLoggedIn = true;
        userEmail = user.email;
        userName = user.displayName;
      }
    });
  }

  Future<void> _logout() async {
    await _googleSignIn.signOut();
    setState(() {
      isLoggedIn = false;
      userEmail = null;
      userName = null;
    });
    Get.snackbar('تم', 'تم تسجيل الخروج بنجاح', colorText: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الحساب'),
        backgroundColor: const Color(0xFF1a1a2e),
        elevation: 0,
      ),
      body: isLoggedIn
          ? SingleChildScrollView(
              child: Column(
                children: [
                  // Profile Header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF1a1a2e),
                          const Color(0xFF16213e),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.person,
                            size: 50.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          userName ?? 'المستخدم',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          userEmail ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Menu Items
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.favorite,
                          title: 'المفضلة',
                          onTap: () => Get.toNamed('/favorites'),
                        ),
                        _buildMenuItem(
                          icon: Icons.bookmark,
                          title: 'المشاهدة لاحقاً',
                          onTap: () => Get.toNamed('/watchlater'),
                        ),
                        _buildMenuItem(
                          icon: Icons.history,
                          title: 'السجل',
                          onTap: () {},
                        ),
                        _buildMenuItem(
                          icon: Icons.settings,
                          title: 'الإعدادات',
                          onTap: () {},
                        ),
                        _buildMenuItem(
                          icon: Icons.help,
                          title: 'المساعدة والدعم',
                          onTap: () {},
                        ),
                        SizedBox(height: 24.h),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: _logout,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text(
                              'تسجيل الخروج',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 80.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'لم تقم بتسجيل الدخول',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'يرجى تسجيل الدخول للوصول إلى حسابك',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        final user = await _googleSignIn.signIn();
                        if (user != null) {
                          setState(() {
                            isLoggedIn = true;
                            userEmail = user.email;
                            userName = user.displayName;
                          });
                          Get.snackbar(
                            'مرحبا',
                            'تم تسجيل الدخول بنجاح',
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
                    label: const Text('تسجيل الدخول عبر Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              color: Colors.grey, size: 16),
          onTap: onTap,
        ),
        Divider(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
      ],
    );
  }
}
