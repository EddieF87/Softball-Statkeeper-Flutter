import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/store/team_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_stats_page.dart';

class TeamsPageView extends StatefulWidget {
  final List<Team> teams;
  final int startingIndex;
  final TeamStore teamStore;

  TeamsPageView({
    Key key,
    this.teams,
    this.teamStore,
    this.startingIndex = 0,
  })  : assert(teams != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => TeamsPageViewState();
}

class TeamsPageViewState extends State<TeamsPageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.startingIndex);
    widget.teamStore.setTeam(widget.teams[widget.startingIndex]);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        itemBuilder: (BuildContext context, int index) => TeamStatsPage(
            teamStore: widget.teamStore,
          ),
        onPageChanged: (index) => widget.teamStore.setTeam(widget.teams[index]),
        itemCount: widget.teams.length,
        controller: _pageController,
      ),
    );
  }
}
