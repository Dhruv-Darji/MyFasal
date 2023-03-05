import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class CropPrice {
  final String commodity;
  final String variety;
  final String market;
  final String arrivalDate;
  final String minPrice;
  final String maxPrice;
  final String modalPrice;

  CropPrice({
    required this.commodity,
    required this.variety,
    required this.market,
    required this.arrivalDate,
    required this.minPrice,
    required this.maxPrice,
    required this.modalPrice,
  });
}


Future<List<CropPrice>> fetchCropPrices(
    {required String commodity,
    required String state,
    required String district,
    required String market,
    required String fromDate,
    required String toDate}) async {
  final response = await http.get(Uri.parse(
      'https://agmarknet.gov.in/New/Comm_datewise_month_yrwise_prices_arrivals_top20.aspx?'
      'Tx_Commodity=${commodity}&Tx_State=${state}&Tx_District=${district}'
      '&Tx_Market=${market}&DateFrom=${fromDate}&DateTo=${toDate}&Fr_Date=${fromDate}&To_Date=${toDate}'
      '&Tx_Trend=0&Tx_CommodityHead=${commodity}'));
  final document = parse(response.body);
  final table = document.getElementsByTagName('table').first;
  final rows = table.getElementsByTagName('tr');
  final cropPrices = <CropPrice>[];  
  for (var i = 1; i < rows.length; i++) {
    final cells = rows[i].getElementsByTagName('td');    
    final cropPrice = CropPrice(
      commodity: cells[0].text.trim(),
      variety: cells[1].text.trim(),
      market: cells[2].text.trim(),
      arrivalDate: cells[3].text.trim(),
      minPrice: cells[4].text.trim(),
      maxPrice: cells[5].text.trim(),
      modalPrice: '',
      //modalPrice: cells[6].text.trim(),
    );
    print('market:${cropPrice}');
    cropPrices.add(cropPrice);
  }
  
  print('we are touched');
  return cropPrices;
}