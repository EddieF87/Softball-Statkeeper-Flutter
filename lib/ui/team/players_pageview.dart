import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stats_page.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class PlayersPageView extends StatefulWidget {
  final int startingIndex;

  PlayersPageView({
    Key key,
    this.startingIndex = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PlayersPageViewState();
}

class PlayersPageViewState extends State<PlayersPageView> {
  PageController _pageController;
  int currentIndex;

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
          "Players",
          style: TextStyle(fontSize: 36),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: PlayerSearch(
                players: statKeeperStore.players,
                onPlayerSelected: (index) => _pageController.jumpToPage(index),
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) => PlayerPage(
          playerIndex: index,
            firestoreID: statKeeperStore.players[index].firestoreID
        ),
        itemCount: statKeeperStore.players.length,
        controller: _pageController,
      ),
    );
  }
}

class PlayerSearch extends SearchDelegate<Player> {
  final List<Player> players;
  final ValueSetter onPlayerSelected;

  PlayerSearch({
    this.players,
    this.onPlayerSelected,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (players == null) {
      return Center(child: Text("PLAYERSNULLLLLLLL!"));
    } else if (players.isEmpty) {
      return Center(child: Text("No Players! ${players.length}"));
    }
    final results = query.isEmpty
        ? players
        : players.where((player) =>
            player.name.toLowerCase().contains(query.toLowerCase()));
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView(
        shrinkWrap: true,
        children: results
            .map<Widget>(
              (player) => Card(
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                  title: Text(
                    player.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle:
                      Text("${StatFormatter.displayAmount(statName: PlayerUtils.LABEL_AVG, amount: player.getAVG())} / "
                          "${StatFormatter.displayAmount(statName: PlayerUtils.LABEL_OBP, amount: player.getOBP())} / "
                          "${StatFormatter.displayAmount(statName: PlayerUtils.LABEL_SLG, amount: player.getSLG())}\n"
                          "HR: ${player.hrs}  RBI: ${player.rbis}  "
                          "R: ${player.runs}"),
                  leading: Icon(Icons.person),
                  onTap: () {
                    onPlayerSelected(players.indexOf(player));
                    close(context, null);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
