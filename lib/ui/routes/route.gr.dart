// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:personal_expense_tracker/ui/ft_tracker/pg_home/page.dart'
    as _i3;
import 'package:personal_expense_tracker/ui/ft_tracker/pg_list_expense/page.dart'
    as _i1;
import 'package:personal_expense_tracker/ui/ft_tracker/pg_summary/page.dart'
    as _i2;

/// generated route for
/// [_i1.NeurogineHomeExpenseListPage]
class NeurogineHomeExpenseListRoute extends _i4.PageRouteInfo<void> {
  const NeurogineHomeExpenseListRoute({List<_i4.PageRouteInfo>? children})
    : super(NeurogineHomeExpenseListRoute.name, initialChildren: children);

  static const String name = 'NeurogineHomeExpenseListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.NeurogineHomeExpenseListPage();
    },
  );
}

/// generated route for
/// [_i2.NeurogineHomeExpenseSummaryPage]
class NeurogineHomeExpenseSummaryRoute extends _i4.PageRouteInfo<void> {
  const NeurogineHomeExpenseSummaryRoute({List<_i4.PageRouteInfo>? children})
    : super(NeurogineHomeExpenseSummaryRoute.name, initialChildren: children);

  static const String name = 'NeurogineHomeExpenseSummaryRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.NeurogineHomeExpenseSummaryPage();
    },
  );
}

/// generated route for
/// [_i3.NeurogineHomeTrackerPage]
class NeurogineHomeTrackerRoute extends _i4.PageRouteInfo<void> {
  const NeurogineHomeTrackerRoute({List<_i4.PageRouteInfo>? children})
    : super(NeurogineHomeTrackerRoute.name, initialChildren: children);

  static const String name = 'NeurogineHomeTrackerRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.NeurogineHomeTrackerPage();
    },
  );
}
