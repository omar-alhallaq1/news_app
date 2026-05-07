import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/modles/top_headlines_modle.dart';

class ArticalDetailsScreen extends StatelessWidget {
  final Article article;

  const ArticalDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          /// ================= IMAGE APP BAR =================
          SliverAppBar(
            expandedHeight: 350.h,
            pinned: true,
            stretch: true,
            elevation: 0,
            backgroundColor: Colors.white,

            leading: Padding(
              padding: EdgeInsets.all(8.r),
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],

              background:
                  article.urlToImage != null && article.urlToImage!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: article.urlToImage!,
                      fit: BoxFit.cover,

                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),

                      errorWidget: (context, url, error) => Image.network(
                        "https://via.placeholder.com/400",
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.network(
                      "https://via.placeholder.com/400",
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          /// ================= CONTENT =================
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: Offset(0, -30.h),

              child: Container(
                width: double.infinity,

                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// TITLE
                    Text(
                      article.title ?? "No Title",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    /// AUTHOR & DATE
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: 18,
                        ),

                        SizedBox(width: 6.w),

                        Expanded(
                          child: Text(
                            article.author ?? "Unknown Author",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 18,
                        ),

                        SizedBox(width: 6.w),

                        Text(
                          article.publishedAt?.toString() ?? "Recently",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    /// DESCRIPTION
                    if (article.description != null)
                      Text(
                        article.description!,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.7,
                          color: Colors.black87,
                        ),
                      ),

                    SizedBox(height: 20.h),

                    /// CONTENT
                    Text(
                      article.content ??
                          article.description ??
                          "No Content Available",
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.9,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 120.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
