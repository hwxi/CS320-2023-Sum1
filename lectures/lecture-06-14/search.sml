use "./stream.sml";

datatype node = NODE of int

fun
node_get_neighbors(node): node list = []

fun dfs_walk(node): node stream = fn() =>
  strmcon_cons
  (node, dfs_walk_list(node_get_neighbors(node)))

and dfs_walk_list(nodes): node stream = fn() =>
(
case nodes of
  nil => strmcon_nil
| (node :: nodes) =>
  strmcon_cons
  (node, dfs_walk_list(node_get_neighbors(node) @ nodes))
)

fun bfs_walk(node): node stream = fn() =>
  strmcon_cons
  (node, bfs_walk_list(node_get_neighbors(node)))

and bfs_walk_list(nodes): node stream = fn() =>
(
case nodes of
  nil => strmcon_nil
| (node :: nodes) =>
  strmcon_cons
  (node, bfs_walk_list(nodes @ node_get_neighbors(node)))
)

