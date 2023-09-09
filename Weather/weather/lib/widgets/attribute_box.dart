import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

Widget attributeBox(
    {required IconData icon,
    required String title,
    required String value,
    String? unit}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      constraints: const BoxConstraints(maxWidth: 150, maxHeight: 90),
      padding: const EdgeInsets.all(15),
      color: Colors.white.withOpacity(.6),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                    text: value,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                          text: unit,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400))
                    ]),
              )
            ],
          )
        ],
      ),
    ),
  );
}
