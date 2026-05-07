import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/widget/custom_text_field.dart';

class SearchTextFieldWidjet extends StatefulWidget {
  const SearchTextFieldWidjet({super.key});

  @override
  State<SearchTextFieldWidjet> createState() => _SearchTextFieldWidjetState();
}

class _SearchTextFieldWidjetState extends State<SearchTextFieldWidjet> {
  bool showtextfromfield = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showtextfromfield
            ? CustomTextField(
                width: 200.w,
                hintText: "search".tr(),
                onFieldSubmitted: (value) {
                  // الانتقال لصفحة النتائج عند الضغط على Enter
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.searchResultscreen, extra: value);
                },
              )
            : const SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              // تبديل الحالة بين إظهار وإخفاء الحقل
              showtextfromfield = !showtextfromfield;
            });
          },
          icon: const Icon(Icons.search, color: Color(0xff231F20)),
        ),
      ],
    );
  }
}
