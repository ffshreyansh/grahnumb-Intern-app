import 'package:flutter/material.dart';
import 'package:grahnumb/extracted_page.dart';
import 'dart:io';
import 'package:image_viewer/image_viewer.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final url;
    final TextEditingController extract = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('GrahNumb Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Link Paste -------------------------------------------
            TextFormField(
              onChanged: (val) {},
              controller: extract,
              decoration: InputDecoration(
                  hintText: 'Paste the Link', border: OutlineInputBorder()),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 20,
            ),

            //Extraction Button --------------------------------------
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExtractedPage(
                        url: extract.text,
                      ),
                    ));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.cyan, borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                  'Extract Image',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
