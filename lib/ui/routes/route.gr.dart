// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:personal_expense_tracker/ui/ft_tracker/pg_home/page.dart'
    as _i2;
import 'package:personal_expense_tracker/ui/ft_tracker/pg_list_expense/page.dart'
    as _i1;

/// generated route for
/// [_i1.NeurogineHomeExpenseListPage]
class NeurogineHomeExpenseListPage extends _i3.PageRouteInfo<void> {
  const NeurogineHomeExpenseListPage({List<_i3.PageRouteInfo>? children})
    : super(NeurogineHomeExpenseListPage.name, initialChildren: children);

  static const String name = 'NeurogineHomeExpenseListPage';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.NeurogineHomeExpenseListPage();
    },
  );
}

/// generated route for
/// [_i2.NeurogineHomeTrackerPage]
class NeurogineHomeTrackerPage extends _i3.PageRouteInfo<void> {
  const NeurogineHomeTrackerPage({List<_i3.PageRouteInfo>? children})
    : super(NeurogineHomeTrackerPage.name, initialChildren: children);

  static const String name = 'NeurogineHomeTrackerPage';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.NeurogineHomeTrackerPage();
    },
  );
}
