import 'package:dictionary_app/result.dart';
import 'package:flutter/material.dart';

class Dictionary extends StatefulWidget {
  final String word;
  const Dictionary({super.key, required this.word});

  @override
  _dictionary createState() => _dictionary();
}

class _dictionary extends State<Dictionary> {
  final List<String> definitions = [
    'definition 1',
    'definition 2',
    'definition 3',
    'definition 4'
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Dictionary',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
            body: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.word,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          const Text(
                            '(meaning):meaning here',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 20),
                          )
                        ],
                      ),
                    )),
                const TabBar(
                    labelColor: Colors.red,
                    indicatorColor: Colors.red,
                    tabs: [
                      Tab(text: 'definition'),
                      Tab(
                        text: 'synonyms',
                      ),
                      Tab(text: 'antonyms')
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.all(10),
                            child: Text(
                              'partsofspeech: Noun',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),),
                           Expanded(child: 
                            ListView.builder(
                              itemCount: definitions.length
                              ,itemBuilder: (context, index) {
                              return Container(

                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border(bottom: BorderSide(color: Colors.grey,width: 1))

                                ),
                                child: Text(definitions[index],style:TextStyle(
                                  color: Colors.black
                                ),),
                              );
                            }))
                          ],
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.orange,
                  ),
                ]))
              ],
            ),
          ),
        ));
  }
}
