import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchLaterScreen extends StatefulWidget {
  const WatchLaterScreen({Key? key}) : super(key: key);

  @override
  State<WatchLaterScreen> createState() => _WatchLaterScreenState();
}

class _WatchLaterScreenState extends State<WatchLaterScreen> {
  final List<Map<String, dynamic>> watchLaterList = [
    {
      'title': 'ألعاب الحب',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 7.8,
      'type': 'مسلسل',
      'addedDate': '2024-08-20',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المشاهدة لاحقاً'),
        backgroundColor: const Color(0xFF1a1a2e),
        elevation: 0,
      ),
      body: watchLaterList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 80.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'لا توجد أعمال مضافة',
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
              itemCount: watchLaterList.length,
              itemBuilder: (context, index) {
                final work = watchLaterList[index];
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          work['type'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'تم الإضافة: ${work['addedDate']}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          watchLaterList.removeAt(index);
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                                'تم الإزالة من قائمة المشاهدة'),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 16.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
