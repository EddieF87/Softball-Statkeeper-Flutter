import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

// The store-class
abstract class _BaseStore with Store {

  @observable
  ObservableList<dynamic> bases = ObservableList<Player>.of([null, null, null, null, null]);

  List<Player> prevBases = [null, null, null, null, null];


  void updatePrevBases() {
    print("updatePrevBases");
    for (int i = 0; i < prevBases.length; i++) {
      prevBases[i] = bases[i];
    }
  }

  @action
  void resetBases() {
    for (int i = 0; i < bases.length; i++) {
      bases[i] = prevBases[i];
    }
    bases = bases;
  }

  @action
  void setBases(List<Player> newBases) {
    bases.clear();
    bases.addAll(newBases);
  }

  @action
  void updateBase(int newBaseIndex, int currentBaseIndex) {
    bases[newBaseIndex] = bases[currentBaseIndex];
    bases[currentBaseIndex] = null;
    bases[4] = null;
    if(currentBaseIndex == 0) {
      onBatterMoved();
    }
  }

  @action
  void setBatter(Player batter) {
    bases[0] = batter;
  }

  @action
  void onBatterMoved() {
    bases[0] = null;
  }

  @action
  void onRunnerMoved(int baseIndex) {
    bases[baseIndex] = null;
  }
}