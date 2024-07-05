import 'package:qr_code_scanner/qr_code_scanner.dart' as qr;
import '../models/barcode.dart';

class BarcodeService {
  Future<Barcode> scanBarcode(qr.QRViewController controller) async {
    final qr.Barcode result = await controller.scannedDataStream.first;
    return Barcode(code: result.code, format: result.format.formatName);
  }
}
