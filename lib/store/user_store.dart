import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_statkeepers.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';

// Include generated file
part 'user_store.g.dart';

// This is the class used by rest of your codebase
class UserStore = _UserStore with _$UserStore;

// The store-class
abstract class _UserStore implements Store {

  @observable
  String userEmail = "";

  @observable
  ObservableList<StatKeeper> statKeepers = ObservableList();

  @action
  void updateEmail(String email) {
    statKeepers.clear();
    email = email;
  }

  @action
  Future<ObservableList<StatKeeper>> getStatKeepers() async {
    print("userStore  getStatKeepers");
    statKeepers.clear();
    statKeepers.addAll(ObservableList.of(await RepositoryServiceStatKeepers.getAllStatKeepers()));
    return statKeepers;
  }

  @action
  Future updateStatKeepers() async {
    print("userStore  getStatKeepers");
    statKeepers.clear();
    statKeepers.addAll(ObservableList.of(await RepositoryServiceStatKeepers.getAllStatKeepers()));
  }

  @action
  Future addStatKeeper(StatKeeper statKeeper) async {
    print("userStore  addStatKeeper");
    await RepositoryServiceStatKeepers.insertStatKeeper(statKeeper);
    statKeepers.add(statKeeper);
  }

  @action
  Future removeStatKeeper(StatKeeper statKeeper) async {
    print("userStore  deleteStatKeeper");
    await RepositoryServiceStatKeepers.deleteStatKeeper(statKeeper);
    statKeepers.remove(statKeeper);
  }
}
