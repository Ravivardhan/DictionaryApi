// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'result.dart';
import 'dart:convert';
import 'dict.dart';

void main() {
  runApp(Dictionary(word:'hello'));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final List<String> cities = [
    "hyderabad",
    "nellore",
    "nagaram",
    "hydurapalli",
    "andhra pradesh",
    "telangana",
    "tamilnadu",
    "chennai"
  ];
  var filteredWords = [];
  TextEditingController searchController = TextEditingController();
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterWords();
    });
  }

  Future<List<String>> getSuggestions(String query) async {
    final response =
        await http.get(Uri.parse('https://api.datamuse.com/sug?s=$query'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => item['word'] as String).toList();
    } else {
      throw Exception('not able to load suggestions');
    }
  }

  void filterWords() {
    String city_s = searchController.text.toLowerCase();
    if (city_s.isNotEmpty) {
      getSuggestions(city_s).then((result) {
        setState(() {
          suggestions = result;
        });
      });
    } else {
      setState(() {
        suggestions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.dosisTextTheme()),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.red,
            title: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Dictionary API",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(160),
              child: Container(
                decoration: const BoxDecoration(),
                height: 160,
                child: Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.only(
                      top: 50, right: 20, bottom: 50, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.search_outlined),
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Search for a word...',
                            border: InputBorder.none),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)))),
        drawer: Drawer(
          child: ListView(
            children: const [],
          ),
        ),
        body: 
           ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    
                    title: word(text: suggestions[index]),
                  );
                }),
      ),
    );
  }
}
