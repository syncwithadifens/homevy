import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/transaction_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/home_page.dart';
import 'package:homevy/ui/pages/transaction_detail_page.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.put(TransactionController());
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              color: greyColor)
                        ]),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {
                          Get.to(() => const HomePage());
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Text(
                      'My Orders',
                      style: subtitleStyle.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.only(top: 20),
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  tabs: [
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Unpaid",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Delivering",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Delivered",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Canceled"),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Obx(() => transactionController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : transactionController.transactionList!.data!.isEmpty
                      ? const Center(
                          child: Text('No Transaction'),
                        )
                      : TabBarView(children: [
                          ListView.builder(
                            itemCount: transactionController
                                .transactionList!.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: greyColor,
                                          offset: const Offset(0, 5),
                                          blurRadius: 10,
                                          spreadRadius: 1)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Information:',
                                            style: subtitleStyle.copyWith(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            DateFormat('d MMM yyyy').format(
                                                transactionController
                                                    .transactionList!
                                                    .data![index]
                                                    .createdAt),
                                            style: TextStyle(color: greyColor),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3),
                                        child: Text('Address:'),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              transactionController
                                                  .transactionList!
                                                  .data![index]
                                                  .alamat,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text('Total Amount:',
                                                    style: TextStyle(
                                                        color: greyColor)),
                                                Text(
                                                  NumberFormat.currency(
                                                          locale: 'id',
                                                          symbol: 'Rp',
                                                          decimalDigits: 2)
                                                      .format(
                                                          transactionController
                                                              .transactionList!
                                                              .data![index]
                                                              .total),
                                                  style: subtitleStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () => Get.to(
                                                  () => TransactionDetailPage(
                                                        transactionData:
                                                            transactionController
                                                                .transactionList!
                                                                .data![index],
                                                      )),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                    color: secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'Details',
                                                  style: subtitleStyle.copyWith(
                                                      fontSize: 14,
                                                      color: whiteColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              transactionController
                                                      .transactionList!
                                                      .data![index]
                                                      .status
                                                      .capitalizeFirst ??
                                                  '',
                                              style: subtitleStyle.copyWith(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const Center(
                            child: Text('Delivering'),
                          ),
                          const Center(
                            child: Text('Delivered'),
                          ),
                          const Center(
                            child: Text('Cancelled'),
                          )
                        ])),
            )
          ],
        ),
      )),
    );
  }
}
