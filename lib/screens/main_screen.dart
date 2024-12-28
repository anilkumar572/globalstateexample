import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:funfacts/screens/settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> funfacts = [];
  bool isLoading = false;

  Future<void> loadFacts() async {
    isLoading = true;
    setState(() {});
    try {
      Response response = await Dio().get(
          'https://raw.githubusercontent.com/anilkumar572/flutter_dummy_api/refs/heads/main/funfacts.json');
      funfacts = jsonDecode(response.data);
      isLoading = false;

      setState(() {});
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  void initState() {
    super.initState();
    loadFacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FunFacts'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SettingsScreen();
                  }),
                );
              },
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: funfacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              funfacts[index],
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Swipe right to know more',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
    );
  }
}
