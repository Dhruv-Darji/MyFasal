import 'package:flutter/material.dart';
import 'package:mycrop/Constants/Colors.dart';
import 'package:mycrop/Database/getdata.dart';

class ChartPage extends StatefulWidget {
  final String check ;
  const ChartPage({required this.check});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late String text ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.check;
     fetchCropPrices(
      commodity: 'Bajra(Pearl Millet/Cumbu)', 
      district: 'Rajkot', 
      fromDate: '01-Jan-2023', 
      market: 'Rajkot', 
      state: 'Gujarat', 
      toDate: '05-Mar-2023');    
    print(text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,        
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text("MyFasal",style: TextStyle(
          fontWeight: FontWeight.w600,
          color:lightText ,
        ),),
      ),
      body: Container(
        color: themecolor,
        child: Center(child: Text(text,
        style: TextStyle(
          color: lightText,
        ),)),
      ),
    );
  }
}