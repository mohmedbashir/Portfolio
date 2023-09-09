import 'package:flutter/Material.dart';
import 'package:weather/widgets/widgets.dart';

Container searchFloatinButton(BuildContext context) {
  return Container(
    constraints: const BoxConstraints(minHeight: 60, minWidth: 230),
    child: FloatingActionButton.extended(
        backgroundColor: Colors.black.withOpacity(.6),
        label: Row(
          children: const [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Text(
              'Search',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                  color: Colors.white),
            ),
          ],
        ),
        onPressed: () {
          searchBottmSheet(context);
        }),
  );
}
