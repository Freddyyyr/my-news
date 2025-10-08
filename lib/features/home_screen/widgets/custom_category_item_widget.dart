import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  final String title;
  final Function() onTap;

  const CustomCategoryItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: OutlinedButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 24.h, vertical: 6.h),
          ),
          side: WidgetStateProperty.all(
            const BorderSide(color: Color(0xffE9EEFA), width: 1),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(56.r)),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed) ||
                states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused)) {
              return const Color(0xffE9EEFA);
            }
            return null;
          }),
        ),
        child: Text(title, style: AppTextStyles.black14Semibold),
      ),
    );
  }
}
