import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/ApiNames.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../../models/future_operations_response.dart';
import 'BuildSurOperationsItem.dart';

class SurOperations extends StatefulWidget {
  const SurOperations({Key? key}) : super(key: key);

  @override
  State<SurOperations> createState() => _SurOperationsState();
}

class _SurOperationsState extends State<SurOperations> {
  List<FutureOperationModel> futureOperationsList = [];
  List<FutureOperationModel> pastOperationsList = [];
  bool showFutureOperations = true;

  @override
  initState() {
    super.initState();
    loadData();
  }

  loadData() {
    if (showFutureOperations) {
      getFutureOperations();
    } else {
      getPastOperations();
    }
  }

  getFutureOperations() async {
    if (futureOperationsList.isNotEmpty) {
      setState(() {});
      return;
    }
    FutureOperationsResponse data = await GenericHttp<FutureOperationsResponse>(context).callApi(
      name: ApiNames.futureOperations,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      toJsonFunc: (data) => FutureOperationsResponse.fromJson(data),
    );
    futureOperationsList.addAll(data.data ?? []);
    setState(() {});
  }

  getPastOperations() async {
    if (pastOperationsList.isNotEmpty) {
      setState(() {});
      return;
    }
    FutureOperationsResponse data = await GenericHttp<FutureOperationsResponse>(context).callApi(
      name: ApiNames.pastOperations,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      toJsonFunc: (data) => FutureOperationsResponse.fromJson(data),
    );
    pastOperationsList.addAll(data.data ?? []);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "Operations",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTabController(
            length: 2,
            child: TabBar(
              onTap: (index) {
                showFutureOperations = index == 0;
                loadData();
              },
              indicatorColor: MyColors.primary,
              labelColor: MyColors.primary,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle: WidgetUtils.textStyle.copyWith(
                color: MyColors.grey,
                fontSize: 14,
              ),
              labelStyle: WidgetUtils.textStyle.copyWith(
                color: MyColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: MyColors.grey,
              tabs: [
                Tab(child: Text("Upcoming Operations")),
                Tab(child: Text("Past Operations")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: MyText(
              title: '${showFutureOperations ? futureOperationsList.length : pastOperationsList.length} Operations',
              size: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: showFutureOperations ? futureOperationsList.length : pastOperationsList.length,
              itemBuilder: (context, index) => BuildSurOperationsItem(
                operation: showFutureOperations ? futureOperationsList[index] : pastOperationsList[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
