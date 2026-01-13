import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/datatables/categories_datasoruce.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),

        children: [
          Text('Categories View', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            showCheckboxColumn: false,
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Category Name')),
              DataColumn(label: Text('Creado Por')),
              DataColumn(label: Text('Actions')),
            ],
            source: CategoriesDTS(),
            header: Text('Categories Available', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {},
                icon: Icons.add_outlined,
                tooltip: 'Add New Category',
                text: 'Add New',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
