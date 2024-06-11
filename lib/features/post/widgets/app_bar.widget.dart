import 'package:flutter/material.dart';

AppBar buildAppBar({
  required String appBarTitle,
  bool? centerTitle,
  List<Widget>? actionWidgets,
}) => AppBar(
  title: Text(appBarTitle),
  centerTitle: centerTitle ?? true,
  actions: actionWidgets ?? [],
);