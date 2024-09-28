import 'package:flutter/material.dart';
import 'package:hotel_management/presentations/screens/home/widgets/carosole_for_details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        CarosoleforDetails(dotIndicator: false,),
      ],),
    );
  }
}