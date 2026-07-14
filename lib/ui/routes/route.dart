import 'package:auto_route/auto_route.dart';
import 'package:personal_expense_tracker/ui/routes/route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|Route,Page')
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
