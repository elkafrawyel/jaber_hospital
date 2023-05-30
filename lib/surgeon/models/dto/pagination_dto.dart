import 'package:equatable/equatable.dart';

import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

class PaginationDto<T> extends Equatable {
  late int currentPage;
  late bool nextPage;
  late List<T> addedList;
  late GenericBloc<bool> paginationLoading;
  late GenericBloc<bool> refreshLoading;

  PaginationDto({
    required this.currentPage,
    required this.nextPage,
    required this.addedList,
    required this.paginationLoading,
    required this.refreshLoading,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [currentPage, nextPage, addedList, paginationLoading, refreshLoading];
}
