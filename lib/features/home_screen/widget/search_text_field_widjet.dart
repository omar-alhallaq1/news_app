import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            ? CustomTextField(width: 200.w, hintText: "search".tr())
            : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showtextfromfield = !showtextfromfield;
            });
          },
          icon: const Icon(Icons.search, color: Color(0xff231F20)),
        ),
      ],
    );
  }
}
