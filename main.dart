import 'dart:io';

void main() {
  List<Map<dynamic, dynamic>> dialogues = [
    {
      "string": "Witaj w prostej, konsolowej aplikacji do tworzenia prostych symulacji tekstu typu tych w grach Visual Novel",
      "speed": 45,
      "autoskip": false,
      "choice": false,
      "pickables": <String>[],
      "pickablemakes": <String>[]
    },
    {
      "string": "Możesz dowolnie edytować skrypt, jakkolwiek ci się podoba.",
      "speed": 100,
      "autoskip": false,
      "choice": false,
      "pickables": <String>[],
      "pickablemakes": <String>[]
    },
    {
      "string": "Może ten mini projekt się przydać tobie, lub innym... Ale bardzo pomaga mi. Bo",
      "speed": 45,
      "autoskip": true,
      "choice": false,
      "pickables": <String>[],
      "pickablemakes": <String>[]
    },
    {
      "string": "pomaga mi się uczyć całego tego języka.",
      "speed": 45,
      "autoskip": false,
      "choice": false,
      "pickables": <String>[],
      "pickablemakes": <String>[]
    },
    {
      "string": "So Have fun!",
      "speed": 10,
      "autoskip": true,
      "choice": true,
      "pickables": <String>["Dzięki!", "Spoko."],
      "pickablemakes": <String>[":3", ":|"]
    },
  ];
  for (var i = 0; i < dialogues.length; i++) {
    typing(dialogues, i);
  }
}

void typing(List<Map<dynamic,dynamic>> listmap, int n) {
  dynamic dialogue = listmap[n];
  for (var i = 0; i < dialogue["string"].length; i++) {
    stdout.write(dialogue["string"][i]);
    sleep(Duration(milliseconds: dialogue["speed"]));
  }
  if (dialogue["autoskip"] == false && dialogue["choice"] == false) {
    stdout.write(" >>> ");
    stdin.readLineSync() ?? "";
  }
  else if (dialogue["autoskip"] == false || dialogue["autoskip"] == true && dialogue["choice"] == true) {
    print("");
    stdout.write("${dialogue["pickables"]} (pick a number from 1 to ${dialogue["pickables"].length}) > ");

    int? picked;

    while (picked == null) {
      picked = int.tryParse(stdin.readLineSync() ?? '');

      if (picked == null || picked > dialogue["pickables"].length) {
        stdout.write("");
      }
      else {
        break;
      }
    }

    choiceTyping(dialogue, dialogue["pickablemakes"], picked);
  }
  else if (dialogue["autoskip"] == true && dialogue["choice"] == false) {
    print("");
  }
}

void choiceTyping(Map<dynamic, dynamic> dgue, List<String> pickable, int pick) { // dialogue to mapa w liscie, wiec map. pickables ma w sobie liste ([]), wiec lista. no i pick jako int
  String response = pickable[pick - 1];
  for (var i = 0; i < response.length; i++) {
    stdout.write(response[i]);
    sleep(Duration(milliseconds: dgue["speed"]));
  }
  if (dgue["autoskip"] == false) {
    stdout.write(" >>> ");
    stdin.readLineSync() ?? '';
  }
  else {
    print("");
  }
}