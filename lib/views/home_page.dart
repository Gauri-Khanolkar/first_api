import 'package:first_api/models/prescriptions.dart';
import 'package:first_api/services/remote_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Prescriptions>? presc;

  @override
  void initState(){
    super.initState();
  }

  Future<List<Prescriptions>?> getData() async{
    var resp = RemoteService().getPresc();
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prescriptions'),),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
          return const Center(
          child: CircularProgressIndicator(),
          );
    }
        presc = snapshot.data as List<Prescriptions>?;
        return Container();
      })
    );
  }
}
