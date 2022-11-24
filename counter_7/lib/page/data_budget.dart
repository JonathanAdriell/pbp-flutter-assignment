import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/budget.dart';
import 'package:flutter/material.dart';

class MyBudgetPage extends StatefulWidget {
  const MyBudgetPage({super.key});

  @override
  State<MyBudgetPage> createState() => _MyBudgetPageState();
}

class _MyBudgetPageState extends State<MyBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: const CustomDrawer(),
      body: Center(
          child: ListView.builder(
            itemCount: BudgetStorage.listBudget.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.grey,
                    child: ListTile(
                      title: Text(BudgetStorage.listBudget[index].judul),
                      subtitle: Text(BudgetStorage.listBudget[index].nominal.toString()),
                      trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(BudgetStorage.listBudget[index].jenis),
                            Text(
                              BudgetStorage.listBudget[index].date.toString(),
                              style: const TextStyle(color: Colors.grey),
                            )
                          ]
                      ),
                    )
                ),
              );
            }),
          )
      ),
    );
  }
}