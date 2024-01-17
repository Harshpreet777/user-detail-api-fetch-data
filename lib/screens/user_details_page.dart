import 'package:flutter/material.dart';
import 'package:getapi/model/api_request_model.dart';
import 'package:getapi/services/api_request_service.dart';
import 'package:getapi/util/index.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late Future<List<DataModel>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = DataApiService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<DataModel>>(
              future: futureData,
              builder: (context, snapshot) {
                List<DataModel> listdata = snapshot.data ?? [];
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listdata.length,
                  itemBuilder: (context, index) {
                    DataModel data = listdata[index];
                    if(IndexId.indexId==data.id){

                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        child: ListTile(
                          leading: Text(
                            data.id.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                          title: Text(
                            data.title,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          subtitle: Text(
                            data.body,
                            style: const TextStyle(
                                fontSize: 6, color: Colors.white),
                          ),
                        ),
                      ),
                    );}
                    else{
                      return Container();
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
