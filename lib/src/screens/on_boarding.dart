import 'package:carousel_slider/carousel_slider.dart';
import 'package:options_consumer_app/config/app_config.dart' as config;
import 'package:options_consumer_app/src/bloc/DataSnapBloc.dart';
import 'package:options_consumer_app/src/models/on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:options_consumer_app/src/screens/tabs.dart';
import 'package:options_consumer_app/src/services/DataStore.dart';
DataStore _dataStore;
class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  int _current = 0;
  OnBoardingList _onBoardingList;
  @override
  void initState() {
    _onBoardingList = new OnBoardingList();
    _dataStore = DataStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataSnapShotBloc.fetchFireStoreData();
    return Stack(children: [
        StreamBuilder(
          stream: dataSnapShotBloc.snapShot,
          builder: (BuildContext context, AsyncSnapshot<Map
            <String, dynamic>> snap){
            if(snap.hasData){
              return  TabsWidget(currentTab: 2,snap: snap);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          })
      ]);
   }
}
