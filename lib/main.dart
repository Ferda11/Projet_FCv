import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Personne {
  final String nom;
  final int age;
  final String diplome;
  final String universite;

  Personne({required this.nom, required this.age, required this.diplome, required this.universite});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListeScreen(),
    );
  }
}

class MyListeScreen extends StatelessWidget {
  final List<Personne> personnes = [
    Personne(nom: 'Ferda-Carine', age: 23, diplome: 'Licence', universite: 'ESIH'),
    Personne(nom: 'Fabien Stanley', age: 25, diplome: 'Licence', universite: 'ESIH'),
    Personne(nom: 'Ulyss Mardochee', age: 25, diplome: 'Licence', universite: 'ESIH'),
    Personne(nom: 'Hector Wendel', age: 25, diplome: 'Licence', universite: 'ESIH'),
    Personne(nom: 'Gislain', age: 25, diplome: 'Licence', universite: 'ESIH'),

  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des personnes'),
        backgroundColor: Colors.amber,
      ),
      body: MyListeView(personnes: personnes),
        


    );
  }
}

class MyListeView extends StatelessWidget {
  final List<Personne> personnes;

  MyListeView({required this.personnes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: personnes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(personnes[index].nom),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(personne: personnes[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Personne personne;

  DetailsScreen({required this.personne});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de ${personne.nom}'),
        backgroundColor: Colors.green,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInformationScreen(personne: personne),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent, 
              ),
              child: Text('Informations personnelles'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctxt) => AcademyBackgroundScreen(personne: personne),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent, 
              ),
              child: Text('Parcours académique'),
            ),
          ),
        ],
      ),
    );
  }
}



class PersonalInformationScreen extends StatelessWidget {
  final Personne personne;

  PersonalInformationScreen({required this.personne});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations personnelles'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Nom : ${personne.nom}'),
          ),
          ListTile(
            title: Text('Âge : ${personne.age}'),
          ),
          ListTile(
            title: Text('Description : Je suis ${personne.nom}, âgé de ${personne.age} ans.'),
          ),
        ],
      ),
    );
  }
}

class AcademyBackgroundScreen extends StatelessWidget {
  final Personne personne;

  AcademyBackgroundScreen({required this.personne});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcours académique'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Diplôme : ${personne.diplome}'),
          ),
          ListTile(
            title: Text('Université : ${personne.universite}'),
          ),
        ],
      ),
    );
  }
}
