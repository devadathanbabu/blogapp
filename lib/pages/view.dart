import 'package:blogappfrontend/model/postmodel.dart';
import 'package:blogappfrontend/service/postservice.dart';
import 'package:blogappfrontend/service/userservice.dart';
import 'package:flutter/material.dart';

import '../model/usermodel.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Post>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=postApiService().viewPost();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BLOGIFY",
            style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white),),
          backgroundColor: Colors.black.withOpacity(0.9),
        ),
        body: FutureBuilder(future: data, builder: (context,snapshot)
        {
          if(snapshot.hasData && snapshot.data!.isNotEmpty)
            {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (value,index)
              {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Name : " +snapshot.data![index].userId.toString()),
                        subtitle: Text("Model : "+snapshot.data![index].post.toString()
                        )

                      )

                    ],
                  ),
                );
              });
            }
          else
            {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 460,),
                  CircularProgressIndicator(),
                ],
              );
            }
        }),
      ),
    );
  }
}
