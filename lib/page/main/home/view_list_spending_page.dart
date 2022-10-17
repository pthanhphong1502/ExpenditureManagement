import 'package:expenditure_management/constants/app_colors.dart';
import 'package:expenditure_management/constants/list.dart';
import 'package:expenditure_management/models/spending.dart';
import 'package:expenditure_management/page/main/home/widget/item_spending_day.dart';
import 'package:flutter/material.dart';

class ViewListSpendingPage extends StatelessWidget {
  const ViewListSpendingPage({Key? key, required this.spendingList})
      : super(key: key);
  final List<Spending> spendingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whisperBackground,
        appBar: AppBar(
          elevation: 2,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            listType[spendingList[0].type]["title"]!,
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          centerTitle: true,
        ),
        body: itemSpendingDay(spendingList));
  }
}
