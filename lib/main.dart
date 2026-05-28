import 'package:flutter/material.dart';
import 'chocho_app.dart';
import 'core/utils/sys_init/sys_init.dart';

void main() async {
  await SysInit.startDaemons();
  runApp(const ChochoApp());
}
