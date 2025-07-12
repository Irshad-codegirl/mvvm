import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm/resources/component/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50.h,
        width: 200.w,
        decoration: BoxDecoration(
          color: AppColors.btnColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
