import 'package:flutter/material.dart';

AppBar appBarWidget({
  Widget? leading,
  required String appBarTitle,
  List<Widget>? actionWidgets,
}) => AppBar(
  leading: leading ?? const SizedBox(),
  title: Text(appBarTitle),
  automaticallyImplyLeading: false,
  centerTitle: true,
  actions: actionWidgets ?? [],
);