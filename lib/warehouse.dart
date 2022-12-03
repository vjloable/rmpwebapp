import 'package:flutter/material.dart';

class Warehouse extends StatefulWidget {
  const Warehouse({Key? key}) : super(key: key);

  @override
  State<Warehouse> createState() => _WarehouseState();
}

class _WarehouseState extends State<Warehouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
