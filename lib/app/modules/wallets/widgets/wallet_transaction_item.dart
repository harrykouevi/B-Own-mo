/*
 * File name: wallet_transaction_item.dart
 * Last modified: 2023.02.09 at 15:51:55
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../common/ui.dart';
import '../../../models/wallet_transaction_model.dart';

class WalletTransactionItem extends StatelessWidget {
  const WalletTransactionItem({
    Key? key,
    required WalletTransaction transaction,
  })  : _transaction = transaction,
        super(key: key);

  final WalletTransaction _transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('  d, MMMM y - HH:mm', Get.locale.toString()).format(_transaction.dateTime),
          style: Get.textTheme.bodySmall,
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(15),
          decoration: Ui.getBoxDecoration(color: Get.theme.primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      _transaction.user.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Get.textTheme.bodyMedium,
                    ),
                    Text(
                      _transaction.description,
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (_transaction.action == TransactionActions.CREDIT)
                Ui.getPrice(_transaction.amount, style: Get.textTheme.headlineSmall?.merge(TextStyle(color: Colors.green))),
              if (_transaction.action == TransactionActions.DEBIT)
                Ui.getPrice(-_transaction.amount, style: Get.textTheme.headlineSmall?.merge(TextStyle(color: Colors.red))),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
