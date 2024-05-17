import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController searchCon = TextEditingController();
  var isSearch = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
