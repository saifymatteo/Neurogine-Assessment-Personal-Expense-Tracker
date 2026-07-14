import 'package:auto_route/auto_route.dart';

import 'route.gr.dart';

export 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class NeurogineRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: NeurogineHomeTrackerRoute.page,
      initial: true,
      children: [
        AutoRoute(page: NeurogineHomeExpenseListRoute.page, initial: true),
        AutoRoute(page: NeurogineHomeExpenseSummaryRoute.page),
      ],
    ),
  ];
}
