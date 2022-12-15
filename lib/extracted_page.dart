import 'package:flutter/material.dart';

class ExtractedPage extends StatefulWidget {
  var url;
  ExtractedPage({required this.url});

  @override
  State<ExtractedPage> createState() => _ExtractedPageState();
}

class _ExtractedPageState extends State<ExtractedPage> {
  @override
  Widget build(BuildContext context) {
    bool isDropped = false;
    final url2 = widget.url;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Draggable(
                  data: isDropped,
                  feedback: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(color: Colors.red[400]),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.red,
                    child: Image.network(
                      'https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=893&height=600&name=image8-2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Drag the Image below!'),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DragTarget(
                  builder: (BuildContext context, accepted, rejected) {
                    return Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 10)),
                        child: isDropped
                            ? Image.network(url2, fit: BoxFit.cover)
                            : Icon(Icons.image));
                  },
                  onAccept: ((data) {
                    setState(() {
                      isDropped = true;
                    });
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
