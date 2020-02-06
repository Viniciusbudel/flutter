import 'package:carros/drawer_list.dart';
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/carros_listview.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initTabs();
  }

  _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);

    int tabIdx = await Prefs.getInt("tabIdx");
    _tabController.index = tabIdx;
    //future.then((int tabIdx) => _tabController.index = tabIdx);

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Text("Classicos"),
            Text("Esportivos"),
            Text("Luxo"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CarrosListView(TipoCarros.classicos),
          CarrosListView(TipoCarros.esportivos),
          CarrosListView(TipoCarros.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
