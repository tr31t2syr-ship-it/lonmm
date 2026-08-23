import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;
  bool isWatchLater = false;
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    final work = Get.arguments as Map<String, dynamic>?;

    if (work == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('التفاصيل'),
        ),
        body: const Center(
          child: Text('لا توجد بيانات'),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
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
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20.r),
                      ),
                      child: Image.network(
                        work['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF16213e),
                            child: const Center(
                              child: Icon(Icons.image, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: EdgeInsets.all(8.w),
                                child: const Icon(Icons.arrow_back,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              work['title'] ?? '',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(Icons.share,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              work['title'],
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              work['type'],
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.white, size: 16),
                            SizedBox(width: 4.w),
                            Text(
                              work['rating'].toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            Get.snackbar(
                              'تم',
                              isFavorite
                                  ? 'تمت إضافته للمفضلة'
                                  : 'تمت إزالته من المفضلة',
                              colorText: Colors.white,
                            );
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          label: const Text('المفضلة'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFavorite
                                ? Colors.red
                                : const Color(0xFF16213e),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isWatchLater = !isWatchLater;
                            });
                            Get.snackbar(
                              'تم',
                              isWatchLater
                                  ? 'تمت إضافته للمشاهدة لاحقاً'
                                  : 'تمت إزالته من المشاهدة لاحقاً',
                              colorText: Colors.white,
                            );
                          },
                          icon: Icon(
                            isWatchLater
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                          label: const Text('مشاهدة لاحقاً'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isWatchLater
                                ? Colors.blue
                                : const Color(0xFF16213e),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Rating
                  Text(
                    'هل أعجبك العمل؟',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: index < rating
                              ? Colors.amber
                              : Colors.grey,
                          size: 32.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Description
                  Text(
                    'الوصف',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'هذا العمل يحتوي على قصة مشوقة وممتعة تجمع بين الحب والإثارة والمغامرة. يعتبر من أفضل الأعمال في فئته.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Play Button
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed('/player');
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('شغل الآن'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
