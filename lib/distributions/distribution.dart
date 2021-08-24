import 'package:file/file.dart';
import 'package:meta/meta.dart';

import 'paper/paper_mc_distribution.dart';
import 'paper/travertine_distribution.dart';
import 'paper/waterfall_distribution.dart';

abstract class Distribution {
  static List<Distribution> all = [
    PaperMCDistribution(),
    WaterfallDistribution(),
    TravertineDistribution()
  ];

  @protected
  Distribution();

  factory Distribution.forName(String name) =>
      all.firstWhere((element) => element.name == name);

  bool get requiresEula => true;

  String get displayName;

  String get name;

  Future<VersionGroup> retrieveVersions(String version);

  Future<int> retrieveLatestBuildFor(String version);

  Future<List<String>> retrieveVersionGroups();

  Future<int> downloadTo(String version, File destination);
}

class VersionGroup {
  final String name;
  final List<String> versions;

  const VersionGroup(this.name, this.versions);
}