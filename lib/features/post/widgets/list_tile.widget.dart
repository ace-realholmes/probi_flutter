import 'package:flutter/material.dart';

ListTile buildListTile({
  Widget? leadingWidget,
  required String titleTile,
  required String subTile,
  Widget? trailingWidget,
  
}) =>
    ListTile(
      leading: leadingWidget,
      title: Text(
        titleTile,
        style: const TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        subTile,
        style: const TextStyle(overflow: TextOverflow.ellipsis),
      ),
      trailing: trailingWidget,
    );
