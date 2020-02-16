import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_stats_page.dart';

class TeamsPageView extends StatefulWidget {
  final int startingIndex;

  TeamsPageView({
    Key key,
    this.startingIndex = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TeamsPageViewState();
}

class TeamsPageViewState extends State<TeamsPageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.startingIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          "Teams",
          style: TextStyle(fontSize: 36),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TeamStatsPage(
            teamIndex: index,
            statKeeperStore: statKeeperStore,
          );
        },
        itemCount: statKeeperStore.teams.length,
        controller: _pageController,
      ),
    );
  }
}
