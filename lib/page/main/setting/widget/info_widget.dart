import 'dart:math';

import 'package:expenditure_management/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingInfo({required double width, required double height}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

Widget infoWidget({User? user}) {
  var numberFormat = NumberFormat.currency(locale: "vi_VI");

  return Column(
    children: [
      Material(
        elevation: 2,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: user != null
                ? Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : loadingInfo(width: Random().nextInt(50) + 150, height: 30),
          ),
        ),
      ),
      const SizedBox(height: 10),
      ClipOval(
        child: user != null
            ? Image.network(
                user.avatar,
                width: 150,
                fit: BoxFit.cover,
              )
            : loadingInfo(width: 150, height: 150),
      ),
      const SizedBox(height: 20),
      const Text("Tiền hàng tháng", style: TextStyle(fontSize: 16)),
      const SizedBox(height: 10),
      user != null
          ? Text(
              numberFormat.format(user.money),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          : loadingInfo(width: Random().nextInt(50) + 150, height: 30),
    ],
  );
}