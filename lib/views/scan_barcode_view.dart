import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../viewmodels/barcode_viewmodel.dart';
import '../services/barcode_service.dart';

class BarcodeView extends StatefulWidget {
  @override
  _BarcodeViewState createState() => _BarcodeViewState();
}

class _BarcodeViewState extends State<BarcodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  final BarcodeService _barcodeService = BarcodeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Consumer<BarcodeViewModel>(
              builder: (context, viewModel, child) {
                return Center(
                  child: (viewModel.barcode != null)
                      ? Text(
                          'Barcode Type: ${viewModel.barcode!.format}   Data: ${viewModel.barcode!.code}')
                      : Text('Scan a code'),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    _barcodeService.scanBarcode(controller).then((barcode) {
      Provider.of<BarcodeViewModel>(context, listen: false)
          .setBarcode(barcode.code!, barcode.format!);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
