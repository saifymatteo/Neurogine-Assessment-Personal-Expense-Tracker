import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|Route,Page')
import 'route.gr.dart';

export 'route.gr.dart';

class NeurogineRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: NeurogineHomeTrackerPage.page,
      initial: true,
      children: [
        AutoRoute(page: NeurogineHomeExpenseListPage.page, initial: true),
      ],
    ),
  ];
}
