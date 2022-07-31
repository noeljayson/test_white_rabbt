import 'package:flutter/material.dart';
import 'package:new_machine_test/config/theme.dart';

Widget showCircleProgress({double size = 30}) => Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          backgroundColor: AppColors.Blue,
          valueColor:  AlwaysStoppedAnimation<Color>(AppColors.loginbgcolor),
        ),
      ),
    );
