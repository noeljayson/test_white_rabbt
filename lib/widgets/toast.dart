import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_machine_test/config/theme.dart';

showToast({msg}) {
  Fluttertoast.showToast(
    backgroundColor: AppColors.Blue,
    textColor: Colors.white,
    msg: msg ?? '',
    toastLength: Toast.LENGTH_LONG,
  );
}
