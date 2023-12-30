import 'package:collection/collection.dart';

enum SideMenuEnum {
  HOME,
  MAIN_DASHBOARD,
  CREATE_PROJECT,
  PROJECT_PAGE,
  TEAM_CAPACITIES,
  COST_MANAGEMENT,
  HOME_PAGE_SEE_ALL,
  FINANCIALS,
  ALL_COSTS,
}

enum FinancialOutlookBar {
  Total,
  Spent,
  Remaining,
}

enum AccessRole {
  Developer,
  GeneralManager,
  Senior,
  Middle,
  Associate,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SideMenuEnum):
      return SideMenuEnum.values.deserialize(value) as T?;
    case (FinancialOutlookBar):
      return FinancialOutlookBar.values.deserialize(value) as T?;
    case (AccessRole):
      return AccessRole.values.deserialize(value) as T?;
    default:
      return null;
  }
}
