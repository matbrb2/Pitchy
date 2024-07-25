part of stats_module;

///StatsWidget is the main component for displaying stats UI.
///This widget displays user score from the game.
class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Note',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Answer',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Ratio',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C')),
            DataCell(Text('2/2')),
            DataCell(Text('100%')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('E')),
            DataCell(Text('1/1')),
            DataCell(Text('100°%')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('A#')),
            DataCell(Text('2/3')),
            DataCell(Text('66.67%')),
          ],
        ),
      ],
    );
  }
}
