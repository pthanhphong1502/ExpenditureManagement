import 'package:expenditure_management/constants/list.dart';
import 'package:expenditure_management/models/spending.dart';
import 'package:expenditure_management/page/edit_spending/edit_spending_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Widget itemSpendingDay(List<Spending> spendingList) {
  var numberFormat = NumberFormat.currency(locale: "vi_VI");

  spendingList.sort(
    (a, b) => b.dateTime.compareTo(a.dateTime),
  );

  var listDate = spendingList
      .map((e) => DateTime(e.dateTime.year, e.dateTime.month, e.dateTime.day))
      .toList()
      .toSet()
      .toList();

  return ListView.builder(
    itemCount: listDate.length,
    itemBuilder: (context, index) {
      var list = spendingList
          .where((element) => isSameDay(element.dateTime, listDate[index]))
          .toList();

      return Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "${listDate[index].day}",
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat("EEEE").format(listDate[index]),
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(DateFormat("MMMM, yyyy").format(listDate[index]))
                      ],
                    ),
                    const Spacer(),
                    Text(
                      numberFormat.format(list
                          .map((e) => e.money)
                          .reduce((value, element) => value + element)),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 2,
                color: Colors.black,
                endIndent: 10,
                indent: 10,
              ),
              Column(
                children: List.generate(
                  list.length,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditSpendingPage(spending: list[index]),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            listType[spendingList[0].type]["image"]!,
                            width: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            listType[spendingList[0].type]["title"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            numberFormat.format(list[index].money),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
