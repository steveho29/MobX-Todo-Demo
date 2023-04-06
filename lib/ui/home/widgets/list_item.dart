import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Function()? onClick;
  final int? insideItemsCount;

  const ListItem(
      {Key? key,
      required this.title,
      this.icon,
      this.onClick,
      this.insideItemsCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              insideItemsCount?.toString() ?? "0",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.blueGrey
              ),
            )
          ],
        ),
      ),
    );
  }
}
