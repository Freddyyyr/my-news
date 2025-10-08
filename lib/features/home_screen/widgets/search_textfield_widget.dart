import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';

class SearchTextfieldWidget extends StatefulWidget {
  const SearchTextfieldWidget({super.key});

  @override
  State<SearchTextfieldWidget> createState() => _SearchTextfieldWidgetState();
}

class _SearchTextfieldWidgetState extends State<SearchTextfieldWidget> {
  bool showTextFormField = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextFormField
            ? CustomTextField(
                width: 200.w,
                hintText: "search".tr(),
                onFieldSubmitted: (value) {
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.searchResultScreen, extra: value);
                },
              )
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                showTextFormField = !showTextFormField;
              });
            },
            icon: const Icon(Icons.search),
            color: Color(0xff231F20),
          ),
        ),
      ],
    );
  }
}
