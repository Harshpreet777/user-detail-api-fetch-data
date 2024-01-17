import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getapi/model/api_request_model.dart';
import 'package:getapi/screens/user_details_page.dart';
import 'package:getapi/services/api_request_service.dart';
import 'package:getapi/util/index.dart';

class HomeScreenClass extends StatefulWidget {
  const HomeScreenClass({super.key});

  @override
  State<HomeScreenClass> createState() => _HomeScreenClassState();
}

class _HomeScreenClassState extends State<HomeScreenClass> {
  // static int? indexId;
  late Future<List<DataModel>>? futureData;
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
            const SizedBox(
              height: 50,
            ),
            FutureBuilder<List<DataModel>>(
              future: futureData,
              builder: (context, snapshot) {
                List<DataModel> listData = snapshot.data ?? [];
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DataModel data = listData[index];

                    return InkWell(
                      onTap: () {
                        IndexId.indexId = data.id;
                        log('${IndexId.indexId}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserDetailsScreen(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  data.userId.toString(),
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ))),
                      ),
                    );
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
