import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Kamera'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Scan'),
                onPressed: () async {
                  try {
                    String barcode = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', true, ScanMode.QR);
                    setState(() {
                      this.barcode = barcode;
                    });
                  } on PlatformException catch (error) {
                    if (error.message == 'Access Denied') {
                      setState(() {
                        this.barcode =
                            'Izin kamera tidak diizinkan oleh si pengguna';
                      });
                    } else {
                      setState(() {
                        this.barcode = 'Error: $error';
                      });
                    }
                  }
                },
              ),
              // Text(
              //   'Result: $barcode',
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
