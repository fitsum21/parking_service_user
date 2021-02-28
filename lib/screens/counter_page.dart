import 'package:flutter/material.dart';
import 'package:psu/blocs/login_bloc.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final LoginBloc bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.outCounter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return Text('${snapshot.data}');
          },
          )
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        bloc.increametAction.add(null);
      },
         child: const Icon(Icons.add),
      ),
    );
  }
}