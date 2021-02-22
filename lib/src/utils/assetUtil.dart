import 'package:flutter/material.dart';

Image flagImage(String countryCode) {
  return Image.asset(
    'icons/flags/png/$countryCode.png',
    package: 'country_icons',
    scale: 3,
  );
}