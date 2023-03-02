import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

class BuildPaginationLoadingIndicator extends StatelessWidget {
  final GenericBloc<bool> paginationLoadingBloc;
  const BuildPaginationLoadingIndicator({
    Key? key,
    required this.paginationLoadingBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: paginationLoadingBloc,
      builder: (context, state) {
        return Visibility(
            visible: state.data,
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 15,
                color: MyColors.primary,
              ),
            ));
      },
    );
  }
}
