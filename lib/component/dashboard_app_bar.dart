import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'QC Dart',
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Row(
            children: [
              link(context, "Manage", "/dashboard/manage"),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton link(context, text, link) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, link);
      },
      child: Text('$text'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
