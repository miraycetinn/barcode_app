import 'package:barcode_app/views/scan_barcode_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/barcode_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BarcodeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Code Scanner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BarcodeView(),
      ),
    );
  }
}
