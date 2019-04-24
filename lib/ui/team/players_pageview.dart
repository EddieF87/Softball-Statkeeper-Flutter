import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stats_page.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class PlayersPageView extends StatefulWidget {
  final List<Player> players;
  final int startingIndex;

  PlayersPageView({
    Key key,
    this.players,
    this.startingIndex = 0,
  })  : assert(players != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => PlayersPageViewState();
}

class PlayersPageViewState extends State<PlayersPageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.startingIndex);
  }

  @override
  Widget build(BuildContext context) {
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
                    players: widget.players,
                    onPlayerSelected: (index) => _moveToPlayerPage(index))),
          ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) => PlayerStatsPage(
              player: widget.players[index],
            ),
        itemCount: widget.players.length,
        controller: _pageController,
      ),
    );
  }

  void _moveToPlayerPage(int index) {
    _pageController.jumpToPage(index);
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
    if (players == null || players.isEmpty) {
      return Center(child: Text("No Players!"));
    }
    final results = players.where(
        (player) => player.name.toLowerCase().contains(query.toLowerCase()));
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                          "${StatFormatter.displayAmount(player.getAVG())} / "
                          "${StatFormatter.displayAmount(player.getOBP())} / "
                          "${StatFormatter.displayAmount(player.getSLG())}\n"
                          "HR: ${player.hrs}  RBI: ${player.rbi}  "
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
