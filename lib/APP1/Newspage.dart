import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ui_tut/Login/globals.dart';
import 'modune/models/news_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'NewsPage/newstyle.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var stuclass = '';
  final List<NewsDetail> items = [];

  Future<String> getNews() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var username = preferences.getString('username');
    var _url =
'https://web.rmutp.ac.th/eng/chaichalerm-s/rmutp.ms/studentms/api/get_news.php';

    final response = await http.get(Uri.parse(_url));
    final Map<String, dynamic> responseData = await jsonDecode(response.body);
    print('Data ***** $responseData');
    responseData['data'].forEach((newsDetail) {
      final NewsDetail news = NewsDetail(
        title: newsDetail['NoticeMessage'],
        description: newsDetail['NoticeTitle'],
        url: newsDetail['img'],
      );
      setState(() {
        items.add(news);
      });
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade900,
        appBar: AppBar(
            title: Text(
          "News",
          style: Styles.navBarTitle,
        )),
        body: ListView.builder(
            itemCount: this.items.length, itemBuilder: _listViewItemBuilder
            ));
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var newsDetail = this.items[index];
 return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(4.0),
          // title: _itemTitle(newsDetail),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemThumbnail(newsDetail),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _itemTitle(newsDetail),
                    SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemThumbnail(NewsDetail newsDetail) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: newsDetail.url == null
              ? null
              : Image.network(
                  newsDetail.url,
                  fit: BoxFit.cover,
                ),
        )
      ],
    );
  }

  Widget _itemTitle(NewsDetail newsDetail) {
    return Text(
      newsDetail.title,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
