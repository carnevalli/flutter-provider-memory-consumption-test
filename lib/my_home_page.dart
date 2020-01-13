import 'dart:math';

import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:provider_only/app_global_state.dart';
import 'package:provider_only/just_a_lazy_loading_test.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = Random().nextInt(100);
  bool _fired = false;
  int _page = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _scheduleTimer() {
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'Total open pages: ${_page+1}',)
        ));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    AppGlobalState globalState = Provider.of<AppGlobalState>(context);
    
    JustALazyLoadingTest1 str1 = Provider.of<JustALazyLoadingTest1>(context);
    print(str1.title);

    JustALazyLoadingTest2 str2 = Provider.of<JustALazyLoadingTest2>(context);
    print(str2.title);

    JustALazyLoadingTest3 str3 = Provider.of<JustALazyLoadingTest3>(context);
    print(str3.title);

    JustALazyLoadingTest4 str4 = Provider.of<JustALazyLoadingTest4>(context);
    print(str4.title);

    JustALazyLoadingTest5 str5 = Provider.of<JustALazyLoadingTest5>(context);
    print(str5.title);

    if(!_fired) {
      setState(() {
        _fired = true;
        _page = globalState.openPages;
      });
      if(_page > 1 && globalState.openPages < AppGlobalState.maxPages) {
        globalState.openPages++;
        this._scheduleTimer();
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 30,),
            Text('Page Number: $_page'),
            (_page > 1 && _page == AppGlobalState.maxPages) ?
              RaisedButton(child: Text('Pop until home!'), onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              ) : Container(),
            (_page == 1) ? 
              RaisedButton(
                child: Text('Start!'),
                onPressed: () {
                  globalState.openPages = 2;
                  this._scheduleTimer();
                },
              ) : Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
