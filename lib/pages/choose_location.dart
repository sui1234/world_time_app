import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location:'London',flag:'uk.png',url:'Europe/London'),
    WorldTime(location:'Stockholm',flag:'stockholm.png',url:'Europe/Stockholm'),
    WorldTime(location:'Chicago',flag:'usa.png',url:'America/Chicago'),
    WorldTime(location:'Shanghai',flag:'china.png',url:'Asia/Shanghai'),
    WorldTime(location:'Jakarta',flag:'indonesia.png',url:'Asia/Jakarta'),
    WorldTime(location:'Seoul',flag:'south_korea.png',url:'Asia/Seoul'),

  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime': instance.isDayTime,

    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose a Location'),
        centerTitle: true,
        elevation:0,

      ),

      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:1.0,horizontal:4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    print(locations[index].location);
                    updateTime(index);
                  },
                  title:Text(
                    locations[index].location
                  ),
                  leading:CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
        },
      )
    );
  }
}
