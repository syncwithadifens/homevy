import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xffFCA311);
Color secondaryColor = const Color(0xff14213D);
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color lightGreyColor = const Color(0xffF1F0F5);
Color greyColor = const Color(0xffA2A6AE);
Color bgColor = const Color(0xffF3F3F3);

TextStyle titleStyle = GoogleFonts.concertOne(
  fontSize: 20,
  color: primaryColor,
);
TextStyle subtitleStyle = GoogleFonts.nunito(fontSize: 16);
TextStyle taglineStyle =
    GoogleFonts.pacifico(fontSize: 18, color: secondaryColor);

TextStyle blackTextStyle = GoogleFonts.nunito(
  color: blackColor,
);
TextStyle whiteTextStyle = GoogleFonts.nunito(
  color: whiteColor,
);
TextStyle yellowTextStyle = GoogleFonts.nunito(
  color: primaryColor,
);
TextStyle greyTextStyle = GoogleFonts.nunito(
  color: greyColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semobold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
