import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,

      cells: [
        DataCell(
          Text('Cell#1 index  $index'),
          onTap: () => print('Cell#1 index $index tapped'),
        ),
        DataCell(Text('Cell#2 index  $index')),
        DataCell(Text('Cell#3 index  $index')),
        DataCell(Text('Cell#4 index  $index')),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 1000;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
