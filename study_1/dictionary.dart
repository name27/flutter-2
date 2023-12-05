typedef MapStringKey = Map<String, dynamic>;

class Dictionary {
  MapStringKey dictionary;
  Dictionary({
    required this.dictionary,
  });

  //단어를 추가함.
  void addWord(MapStringKey wordMap) {
    for (var key in wordMap.keys.toList()) {
      dictionary.update(key, (value) {
        if (wordMap[key] is String) {
          value = [value];
        }
        wordMap[key] is String
            ? value.add(wordMap[key])
            : value.addAll(wordMap[key]);
        return value;
      }, ifAbsent: () => wordMap[key]);
    }
  }

  //단어의 정의를 리턴함.
  String getKorean(String word) {
    if (dictionary.containsKey(word)) {
      return dictionary[word].toString();
    } else {
      print("해당 단어는 사전에 없습니다");
    }
    return "";
  }

  //단어를 삭제함.
  void deleteWord(String word) {
    dictionary.remove(word);
  }

  //단어를 업데이트함
  void updateWord(MapStringKey wordMap) {
    for (var key in wordMap.keys.toList()) {
      if (dictionary.containsKey(key)) {
        dictionary.update(key, (value) => wordMap[key]);
      } //사전에 없던 단어 추가
      else {
        print("$key 단어는 사전에 없습니다");
      }
    }
  }

  //사전 단어를 모두 보여줌
  void showAll() {
    print(dictionary.toString());
  }

  //사전 단어들의 총 갯수를 리턴함
  int countWord() {
    return dictionary.keys.length;
  }

  //단어를 업데이트 함. 존재하지 않을시. 이를 추가함.
  void upsert(MapStringKey wordMap) {
    for (var key in wordMap.keys.toList()) {
      dictionary.update(key, (value) => wordMap[key],
          ifAbsent: () => wordMap[key]);
    }
  }

  //해당 단어가 사전에 존재하는지 여부를 알려줌.
  void exists(String word) {
    print(dictionary.containsKey(word).toString());
  }

  //다음과 같은 방식으로. 여러개의 단어를 한번에 추가할 수 있게 해줌.
  //. [{"term":"김치", "definition":"대박이네~"}, {"term":"아파트", "definition":"비싸네~"}]
  void bulkAdd(List<MapStringKey> list) {
    for (var wordMap in list) {
      for (var key in wordMap.keys.toList()) {
        dictionary.update(key, (value) {
          if (wordMap[key] is String) {
            value = [value];
          }
          wordMap[key] is String
              ? value.add(wordMap[key])
              : value.addAll(wordMap[key]);
          return value;
        }, ifAbsent: () => wordMap[key]);
      }
    }
  }

  //다음과 같은 방식으로. 여러개의 단어를 한번에 삭제할 수 있게 해줌. ["김치", "아파트"]
  void bulkDelete(List<String> list) {
    for (var word in list) {
      dictionary.remove(word);
      dictionary.removeWhere((key, value) => value.contains(word));
    }
  }
}

void main() {
  var dictionary = Dictionary(dictionary: {'apple': '사과'});
  dictionary.showAll();
  print('red 단어 추가 후');
  dictionary.addWord({'red': "빨강"});
  dictionary.showAll();

  print('\nred 단어 정의: ${dictionary.getKorean('red')}');

  print('\napple 단어 삭제 후');
  dictionary.deleteWord('apple');
  dictionary.showAll();

  print('\nred 빨강에서 붉은으로 업데이트 후');
  dictionary.updateWord({'red': '붉은'});
  dictionary.showAll();

  print('\n사전 단어 총 갯수: ${dictionary.countWord()}');

  print('\nred 붉은->적색, blue 파란 단어 추가');
  dictionary.upsert({'red': '적색', 'blue': '파란'});
  dictionary.showAll();

  print('\nblue 단어가 존재하는지');
  dictionary.exists('blue');

  print('\n여러개의 단어를 한번에 추가');
  var sampleList = [
    {"term": "김치", "definition": "대박이네~"},
    {"term": "아파트", "definition": "비싸네~"}
  ];
  dictionary.bulkAdd(sampleList);
  dictionary.showAll();

  print('\n여러개의 단어를 한번에 삭제');
  dictionary.bulkDelete(['김치', 'red']);
  dictionary.showAll();
}
