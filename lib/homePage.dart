import 'package:datatableproject/db/datatableDB.dart';
import 'package:datatableproject/model/area.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Area> areaList;
  bool loading = true;

  Future fetchAllArea() async{
    areaList = await datatableDB().fetchAll();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Dynamique'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:  buildDataTable(),
    );
  }
  
  Widget buildDataTable() {
    widget: 
    return Container(
      child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Nom')),
          DataColumn(label: Text('Prenom')),
          DataColumn(label: Text('Action')),
        ],
        rows: areaList.map<DataRow>((element) => DataRow(cells: [
          DataCell(Text(element.id.toString())),
          DataCell(Text(element.name.toString())),
          DataCell(Text(element.prenom.toString())),
          DataCell(Icon(Icons.edit)),
        ])).toList(),
      ),
    );
  }

  // List<DataColumn> getColumns(List<String> columns) => columns
  // .map((String column) => DataColumn(
  //   label: Text(column),
  // )).toList();

  // List<DataRow> getRows(List<Country> countries) => countries
  //     .map((Country country) => DataRow(
  //           selected: selectedCountries.contains(country),
  //           onSelectChanged: (isSelected) => setState(() {
  //             final isAdding = isSelected != null && isSelected;

  //             isAdding
  //                 ? selectedCountries.add(country)
  //                 : selectedCountries.remove(country);
  //           }),
  //           cells: [
  //             DataCell(FlagWidget(code: country.code)),
  //             DataCell(Container(
  //               width: 100,
  //               child: Text(country.name),
  //             )),
  //             DataCell(Container(
  //               width: 100,
  //               child: Text(country.nativeName),
  //             )),
  //           ],
  //         ))
  //     .toList();

}