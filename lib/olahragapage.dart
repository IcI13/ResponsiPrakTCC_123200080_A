import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsiprak/detail/detailolahraga.dart';
class OlahragaPage extends StatefulWidget {
  const OlahragaPage({super.key});

  @override
  State<OlahragaPage> createState() => _OlahragaPageState();
}

class _OlahragaPageState extends State<OlahragaPage> {
 List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'CNN Olahraga',
          
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Container(
                      color: Colors.grey[200],
                      width: 100,
                      height: 100,
                      child: _posts[index]['thumbnail'] != null
                          ? Image.network(
                              _posts[index]['thumbnail'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                          : Center(),
                    ),
                    title: Text(
                      '${_posts[index]['title']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailOlahraga(
                              link: _posts[index]['link'],
                              title: _posts[index]['title'],
                              description: _posts[index]['description'],
                              thumbnail: _posts[index]['thumbnail'],
                              pubDate: _posts[index]['pubDate'],
                            ),
                          ));
                    },
                  ),
                )),
      ),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(
          Uri.parse('https://api-berita-indonesia.vercel.app/cnn/olahraga'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['data']['posts'];
        });
        print(_posts);
      }
    } catch (e) {
      print(e);
    }
  }
}