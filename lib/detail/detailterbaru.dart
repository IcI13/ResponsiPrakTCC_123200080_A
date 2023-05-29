import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailTerbaru extends StatelessWidget {
  final link;
  final title;
  final description;
  final pubDate;
  final thumbnail;

  DetailTerbaru(
      {this.link, this.title, this.description, this.pubDate, this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('CNN News'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '$title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$pubDate',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 20,
              ),
              Image.network(
                '$thumbnail',
                width: double.infinity,
              ),
              Text(
                '$description',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  openUrl('$link');
                },
                child: Text(
                  'Baca Selengkapnya....',
                  style: TextStyle(color: Colors.red, fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openUrl(String url, {bool forceWebView = false}) async {
    await launchUrlString(url);
  }
}
