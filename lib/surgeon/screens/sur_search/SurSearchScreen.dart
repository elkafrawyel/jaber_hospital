import 'package:base_flutter/surgeon/models/patient_details_model.dart';
import 'package:base_flutter/surgeon/screens/sur_search/BuildPrePostItem.dart';
import 'package:base_flutter/surgeon/screens/sur_search/pagination_view.dart';
import 'package:base_flutter/surgeon/screens/sur_search/patient_search_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/utilities/http/dio/dio_helper.dart';
import '../../../general/utilities/utils_functions/ApiNames.dart';
import '../../models/patient_model.dart';
import 'BuildPreOpItem.dart';
import 'debouncer.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<PatientModel> _results = [];
  int page = 0;
  bool loading = false;
  bool loadingMore = false;
  bool loadingMoreEnd = false;
  String? searchQuery;
  PatientSearchResponse? response;

  Future<void> _getSearchResults() async {
    if (!(response?.pageInfo?.hasNext ?? true) || loading || loadingMore) {
      return;
    }
    page++;

    if (page == 1) {
      _results.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      loading = true;
    } else {
      loadingMore = true;
    }
    setState(() {});
    response = await GenericHttp<PatientSearchResponse>(context).callApi(
      name: ApiNames.patientSearch + "?search=${searchQuery ?? ''}&page=$page",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      showLoader: false,
      toJsonFunc: (json) => PatientSearchResponse.fromJson(json),
    );
    setState(() {
      loading = false;
      loadingMore = false;
      _results.addAll(response?.data ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Theme.of(context).primaryColor),
        titleSpacing: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search Patient...',
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          autofocus: true,
          onChanged: (value) {
            searchQuery = value;
            page = 0;
            response = null;
            _debouncer.run(() => _getSearchResults());
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator.adaptive())
          : _results.isEmpty
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/no_results.svg'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No Results',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Text(
                          'There are no search results for this till now, please try again later',
                          style: TextStyle(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                )
              : PaginationView(
                  loadMoreData: () {
                    _getSearchResults();
                  },
                  showLoadMoreEndWidget: loadingMoreEnd,
                  showLoadMoreWidget: loadingMore,
                  child: ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final PatientModel result = _results[index];
                      return result.operationStatus == 'Post-op'
                          ? BuildPrePostItem(
                              patientModel: result,
                              togglePathway: () {
                                setState(() {
                                  result.isOpen = !(result.isOpen ?? false);
                                });
                              },
                              onPatientArchive: () {
                                setState(() {
                                  _results.removeAt(index);
                                });
                              },
                            )
                          : BuildPreOpItem(
                              patientModel: result,
                              togglePathway: () {
                                setState(() {
                                  result.isOpen = !(result.isOpen ?? false);
                                });
                              },
                              onPatientArchive: () {
                                setState(() {
                                  _results.removeAt(index);
                                });
                              },
                            );
                    },
                  ),
                ),
    );
  }
}
