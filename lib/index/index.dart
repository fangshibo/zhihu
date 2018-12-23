import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import '../global_config.dart';

class Index extends StatefulWidget{
_IndexState createState()=> _IndexState();
}

class _IndexState  extends State<Index> with TickerProviderStateMixin{

  int _currentIndex=0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _navigationViews=<NavigationIconView>[
        new NavigationIconView(icon: Icon(Icons.assignment),title: Text('首页'),vsync: this),
       new NavigationIconView(icon: Icon(Icons.assignment),title: Text('首页'),vsync: this),
       new NavigationIconView(icon: Icon(Icons.assignment),title: Text('首页'),vsync: this),
       new NavigationIconView(icon: Icon(Icons.assignment),title: Text('首页'),vsync: this),
       new NavigationIconView(icon: Icon(Icons.assignment),title: Text('首页'),vsync: this),
      ];
      for (NavigationIconView view in _navigationViews){
        view.controller.addListener(_rebuild);
      }

      _pageList=<StatefulWidget>[
       new Scaffold(
          appBar: AppBar(
            title: Text('1'),
          ),
        ),
        new Scaffold(
          appBar: AppBar(
            title: Text('2'),
          ),
        ),
        new Scaffold(
          appBar: AppBar(
            title: Text('3'),
          ),
        ),
        new Scaffold(
          appBar: AppBar(
            title: Text('4'),
          ),
        ),
        new Scaffold(
          appBar: AppBar(
            title: Text('5'),
          ),
        ),
      ];
      _currentPage =_pageList[_currentIndex];
    }

    void _rebuild(){
      setState(() { });
    }

    @override
      void dispose() {
        // TODO: implement dispose
        super.dispose();
        for(NavigationIconView view in _navigationViews){
          view.controller.dispose();
        }
      }
  @override

  Widget build(BuildContext content){
   final BottomNavigationBar botnavbar=new BottomNavigationBar(
     items: _navigationViews.map((NavigationIconView navigationIconView)=>navigationIconView.item).toList(),
     currentIndex: _currentIndex,
     fixedColor: Colors.blue,
     type: BottomNavigationBarType.fixed,
     onTap: (int index){
       print('$index');
       setState(() {
                _navigationViews[_currentIndex].controller.reverse();
                _currentIndex=index;
                _navigationViews[_currentIndex].controller.forward();
                _currentPage=_pageList[_currentIndex];
              });
     },
   );

   return MaterialApp(
     home: Scaffold(
       body: Center(
         child: _currentPage,
       ),
       bottomNavigationBar: botnavbar,
     ),
     theme: GlobalConfig.themeData,
   );
  }
}