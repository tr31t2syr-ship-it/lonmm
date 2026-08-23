import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> favorites = [
    {
      'title': 'الشيء',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 8.5,
      'type': 'فيلم',
    },
    {
      'title': 'ناروتو',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 9.0,
      'type': 'أنمي',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المفضلة'),
        backgroundColor: const Color(0xFF1a1a2e),
        elevation: 0,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'لا توجد أعمال مفضلة',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final work = favorites[index];
                return Card(
                  color: const Color(0xFF16213e),
                  child: ListTile(
                    leading: Container(
                      width: 60.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.grey,
                      ),
                      child: Image.network(
                        work['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image);
                        },
                      ),
                    ),
                    title: Text(
                      work['title'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      work['type'],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blue,
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 14),
                            SizedBox(width: 4.w),
                            Text(
                              work['rating'].toString(),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              favorites.removeAt(index);
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'تم إزالته من المفضلة'),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
