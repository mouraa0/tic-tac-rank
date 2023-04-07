import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/data/matchmaking/models/snapshot_model.dart';
import 'package:tic_tac_rank_app/domain/matchmaking/entities/snapshot_entity.dart';

class MatchmakingController extends GetxController {
  MatchmakingSnapshotEntity? mostRecentData;

  void handleSnapshotReceive(AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.data == null) {
      return;
    }

    mostRecentData =
        MatchmakingSnapshotModel.fromJson(jsonDecode(snapshot.data));
  }
}
