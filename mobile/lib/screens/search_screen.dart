import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];
  bool isSearching = false;

  final List<Map<String, dynamic>> allWorks = [
    {
      'title': 'الشيء',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 8.5,
      'type': 'فيلم',
    },
    {
      'title': 'ألعاب الحب',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 7.8,
      'type': 'مسلسل',
    },
    {
      'title': 'ناروتو',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 9.0,
      'type': 'أنمي',
    },
    {
      'title': 'أتاك أون تايتان',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 9.2,
      'type': 'أنمي',
    },
    {
      'title': 'ديث نوت',
      'image': 'https://via.placeholder.com/200x300',
      'rating': 8.9,
      'type': 'أنمي',
    },
  ];

  void performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResults = [];
        isSearching = false;
      } else {
        isSearching = true;
        searchResults = allWorks
            .where((work) =>
                work['title']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                work['type']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بحث'),
        backgroundColor: const Color(0xFF1a1a2e),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              controller: searchController,
              onChanged: performSearch,
              decoration: InputDecoration(
                hintText: 'ابحث عن فيلم أو مسلسل أو أنمي...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: searchController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          searchController.clear();
                          performSearch('');
                        },
                        child: const Icon(Icons.close, color: Colors.grey),
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFF16213e),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Results
          Expanded(
            child: isSearching
                ? searchResults.isEmpty
                    ? Center(
                        child: Text(
                          'لم يتم العثور على نتائج',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white70,
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.all(16.w),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          final work = searchResults[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/details',
                                  arguments: work);
                            },
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8.r),
                                    color: const Color(0xFF16213e),
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: Image.network(
                                          work['image'],
                                          fit: BoxFit.cover,
                                          errorBuilder: (context,
                                              error, stackTrace) {
                                            return Container(
                                              color: const Color(
                                                  0xFF16213e),
                                              child: const Center(
                                                child: Icon(
                                                    Icons.image,
                                                    color: Colors
                                                        .grey),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        top: 8.w,
                                        right: 8.w,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(
                                                    4.r),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Colors.white,
                                                  size: 14),
                                              SizedBox(width: 4.w),
                                              Text(
                                                work['rating']
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  work['title'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  work['type'],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 64.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'ابدأ بالبحث عن أفلامك المفضلة',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
