import 'package:flutter/material.dart';
import 'package:vanadzor_quiz/data/working_with_user_data.dart';

class LeaderboardEntry {
  const LeaderboardEntry({
    required this.name,
    required this.score,
    required this.totalScore,
  });

  final String name;
  final int score;
  final int totalScore;
}

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  late Future<List<LeaderboardEntry>> _entriesFuture;

  @override
  void initState() {
    super.initState();
    _entriesFuture = _loadEntries();
  }

  Future<List<LeaderboardEntry>> _loadEntries() async {
    final records = await loadUserData();
    return records
        .map((record) {
          final name = '${record['name'] ?? ''} ${record['surname'] ?? ''}'
              .trim();
          final rawScore = record['score'];
          final score = rawScore is num
              ? rawScore.toInt()
              : int.tryParse('$rawScore') ?? 0;
          return LeaderboardEntry(name: name, score: score, totalScore: 10);
        })
        .toList(growable: false);
  }

  List<_RankedEntry> _rankedEntries(List<LeaderboardEntry> entries) {
    final sorted = entries.toList()
      ..sort((first, second) {
        final scoreOrder = second.score.compareTo(first.score);
        return scoreOrder != 0 ? scoreOrder : first.name.compareTo(second.name);
      });

    var rank = 0;
    int? previousScore;
    final ranked = <_RankedEntry>[];
    for (var index = 0; index < sorted.length; index++) {
      final entry = sorted[index];
      if (entry.score != previousScore) rank++;
      ranked.add(_RankedEntry(entry: entry, rank: rank));
      previousScore = entry.score;
    }
    return ranked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121a16),
      appBar: AppBar(
        backgroundColor: const Color(0xff121a15),
        leading: IconButton(
          tooltip: 'Վերադառնալ',
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back, color: Color(0xff74ff9d)),
        ),
        title: const Text(
          'Վարկանիշային աղյուսակ',
          style: TextStyle(
            color: Color(0xff74ff9d),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        shape: const Border(bottom: BorderSide(color: Color(0xff426151))),
        actions: [
          IconButton(
            tooltip: 'Թարմացնել',
            onPressed: () => setState(() => _entriesFuture = _loadEntries()),
            icon: const Icon(Icons.refresh, color: Color(0xff74ff9d)),
          ),
        ],
      ),
      body: FutureBuilder<List<LeaderboardEntry>>(
        future: _entriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xff74ff9d)),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Չհաջողվեց բեռնել արդյունքները',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () =>
                        setState(() => _entriesFuture = _loadEntries()),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Կրկին փորձել'),
                  ),
                ],
              ),
            );
          }
          final ranked = _rankedEntries(snapshot.data ?? const []);
          final podium = ranked.where((player) => player.rank <= 3).toList();
          final remaining = ranked.where((player) => player.rank > 3).toList();

          return ranked.isEmpty
              ? _emptyState()
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                  children: [
                    const Text(
                      'Առաջատարներ',
                      style: TextStyle(
                        color: Color(0xffa1b6ab),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _podium(podium),
                    if (remaining.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      const Text(
                        'Մյուս մասնակիցները',
                        style: TextStyle(
                          color: Color(0xffa1b6ab),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      for (final player in remaining) ...[
                        _LeaderboardRow(player: player),
                        const SizedBox(height: 8),
                      ],
                    ],
                  ],
                );
        },
      ),
    );
  }

  Widget _podium(List<_RankedEntry> players) {
    if (players.isEmpty) return const SizedBox.shrink();

    final grouped = <int, List<_RankedEntry>>{
      for (final rank in [1, 2, 3])
        rank: players.where((player) => player.rank == rank).toList(),
    };

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1b2921),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff426151)),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _PodiumRankGroup(rank: 2, players: grouped[2]!)),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: Color(0xff426151),
            ),
            Expanded(child: _PodiumRankGroup(rank: 1, players: grouped[1]!)),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: Color(0xff426151),
            ),
            Expanded(child: _PodiumRankGroup(rank: 3, players: grouped[3]!)),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.leaderboard_outlined,
              color: Color(0xff74ff9d),
              size: 44,
            ),
            SizedBox(height: 12),
            Text(
              'Առայժմ արդյունքներ չկան',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RankedEntry {
  const _RankedEntry({required this.entry, required this.rank});

  final LeaderboardEntry entry;
  final int rank;
}

class _PodiumRankGroup extends StatelessWidget {
  const _PodiumRankGroup({required this.rank, required this.players});

  final int rank;
  final List<_RankedEntry> players;

  @override
  Widget build(BuildContext context) {
    final accent = switch (rank) {
      1 => const Color(0xffffb52e),
      2 => const Color(0xffb8c6cc),
      _ => const Color(0xffd98a45),
    };
    final score = players.isEmpty ? null : players.first.entry.score;

    return Container(
      color: rank == 1 ? const Color(0x1a74ff9d) : null,
      padding: const EdgeInsets.fromLTRB(6, 14, 6, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.emoji_events, color: accent, size: 22),
          const SizedBox(height: 5),
          Text(
            '$rank-րդ տեղ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: accent,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (score != null) ...[
            const SizedBox(height: 3),
            Text(
              '$score / 10 միավոր',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                color: Color(0xffa1b6ab),
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          if (players.isNotEmpty) ...[
            const SizedBox(height: 9),
            for (var index = 0; index < players.length; index++) ...[
              if (index > 0)
                const Divider(
                  height: 9,
                  thickness: 1,
                  color: Color(0xff30483a),
                ),
              Text(
                players[index].entry.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: rank == 1
                      ? const Color(0xff74ff9d)
                      : const Color(0xffd8e2dc),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ] else ...[
            const SizedBox(height: 12),
            const Text(
              '—',
              style: TextStyle(color: Color(0xff607368), fontSize: 13),
            ),
          ],
        ],
      ),
    );
  }
}

class _LeaderboardRow extends StatelessWidget {
  const _LeaderboardRow({required this.player});

  final _RankedEntry player;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff1b2921),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff30483a)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 42,
            child: Text(
              '${player.rank}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xffa1b6ab),
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              player.entry.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${player.entry.score} / ${player.entry.totalScore}',
            maxLines: 1,
            style: const TextStyle(
              color: Color(0xff74ff9d),
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
