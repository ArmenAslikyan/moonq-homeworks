import 'dart:math';

class QuizOption {
  const QuizOption({required this.id, required this.text});

  final String id;
  final String text;
}

class QuizQuestion {
  const QuizQuestion({
    required this.id,
    required this.text,
    required this.options,
    required this.correctOptionId,
    this.didYouKnow = '',
  });

  final String id;
  final String text;
  final List<QuizOption> options;
  final String correctOptionId;
  final String didYouKnow;

  bool isCorrect(String optionId) => optionId == correctOptionId;

  List<QuizOption> shuffledOptions({Random? random}) {
    final shuffled = List<QuizOption>.of(options)..shuffle(random);
    return shuffled;
  }
}

const List<QuizQuestion> vanadzorQuestionBank = [
  QuizQuestion(
    id: 'vanadzor_expert_01',
    text: 'Սպորտի պատմության մեջ հայտնի ո՞ր լեգենդար հայ մարզիկն ու փրկարարն է ծնվել Կիրովականում (Վանաձորում) 1953 թվականին։',
    options: [
      QuizOption(id: 'vanadzor_expert_01_a', text: 'Յուրի Վարդանյանը'),
      QuizOption(id: 'vanadzor_expert_01_b', text: 'Շավարշ Կարապետյանը'),
      QuizOption(id: 'vanadzor_expert_01_c', text: 'Ալբերտ Ազարյանը'),
      QuizOption(id: 'vanadzor_expert_01_d', text: 'Իգոր Տեր-Հովհաննիսյանը'),
    ],
    correctOptionId: 'vanadzor_expert_01_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_02',
    text: 'Վանաձորի տարածքում պեղված հնագիտական հուշարձաններից «Մաշտոցի բլուրը» ո՞ր պատմական դարաշրջանին է հիմնականում վերագրվում։',
    options: [
      QuizOption(id: 'vanadzor_expert_02_a', text: 'Վաղ բրոնզի դար (Կուր-արաքսյան մշակույթ)'),
      QuizOption(id: 'vanadzor_expert_02_b', text: 'Ուշ անտիկ շրջան (Արտաշեսյանների ժամանակաշրջան)'),
      QuizOption(id: 'vanadzor_expert_02_c', text: 'Միջին դարեր (Բագրատունիների թագավորություն)'),
      QuizOption(id: 'vanadzor_expert_02_d', text: 'Վաղ միջնադար (Քրիստոնեության ընդունման վաղ շրջան)'),
    ],
    correctOptionId: 'vanadzor_expert_02_a',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_03',
    text: 'Ի՞նչ անուն է կրում Փամբակի լեռնաշղթայի՝ անմիջապես Վանաձորից հարավ վեր խոյացող 3094 մետր բարձրությամբ հայտնի լեռնագագաթը։',
    options: [
      QuizOption(id: 'vanadzor_expert_03_a', text: 'Թեժ լեռ'),
      QuizOption(id: 'vanadzor_expert_03_b', text: 'Ուրասար'),
      QuizOption(id: 'vanadzor_expert_03_c', text: 'Մայմեխ'),
      QuizOption(id: 'vanadzor_expert_03_d', text: 'Լալվար'),
    ],
    correctOptionId: 'vanadzor_expert_03_c',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_04',
    text: 'Ո՞ր թվականին է Ղարաքիլիսա բնակավայրը պաշտոնապես ստացել քաղաքի կարգավիճակ՝ առանձնանալով որպես ինքնուրույն վարչական միավոր։',
    options: [
      QuizOption(id: 'vanadzor_expert_04_a', text: '1895 թվականին'),
      QuizOption(id: 'vanadzor_expert_04_b', text: '1924 թվականին'),
      QuizOption(id: 'vanadzor_expert_04_c', text: '1935 թվականին'),
      QuizOption(id: 'vanadzor_expert_04_d', text: '1918 թվականին'),
    ],
    correctOptionId: 'vanadzor_expert_04_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_05',
    text: '18-րդ դարում Ղարաքիլիսան հանդիսանում էր ո՞ր նշանավոր հայ ազնվական (մելիքական) տոհմի կալվածքն ու ժառանգական նստավայրը։',
    options: [
      QuizOption(id: 'vanadzor_expert_05_a', text: 'Լոռիս-Մելիքովների'),
      QuizOption(id: 'vanadzor_expert_05_b', text: 'Մելիք-Շահնազարյանների'),
      QuizOption(id: 'vanadzor_expert_05_c', text: 'Արղության-Երկայնաբազուկների'),
      QuizOption(id: 'vanadzor_expert_05_d', text: 'Հասան-Ջալալյանների'),
    ],
    correctOptionId: 'vanadzor_expert_05_c',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_06',
    text: 'Հայ դասական գրականության ո՞ր հայտնի ստեղծագործության մեջ է հանգամանալից և գունեղ կերպով նկարագրվում Ղարաքիլիսայի ավանդական տոնավաճառը։',
    options: [
      QuizOption(id: 'vanadzor_expert_06_a', text: 'Րաֆֆու «Կայծեր»-ում'),
      QuizOption(id: 'vanadzor_expert_06_b', text: 'Շիրվանզադեի «Քաոս»-ում'),
      QuizOption(id: 'vanadzor_expert_06_c', text: 'Մուրացանի «Գևորգ Մարզպետունի»-ում'),
      QuizOption(id: 'vanadzor_expert_06_d', text: 'Խաչատուր Աբովյանի «Վերք Հայաստանի»-ում'),
    ],
    correctOptionId: 'vanadzor_expert_06_d',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_07',
    text: 'Ո՞ր թվականին է շահագործման հանձնվել Վանաձորի (Կիրովականի) ջերմաէլեկտրակայանը (ՋԷԿ), որը ստեղծվել էր տեղի հսկա քիմիական համալիրը սպասարկելու նպատակով։',
    options: [
      QuizOption(id: 'vanadzor_expert_07_a', text: '1945 թվականին'),
      QuizOption(id: 'vanadzor_expert_07_b', text: '1961 թվականին'),
      QuizOption(id: 'vanadzor_expert_07_c', text: '1975 թվականին'),
      QuizOption(id: 'vanadzor_expert_07_d', text: '1982 թվականին'),
    ],
    correctOptionId: 'vanadzor_expert_07_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_08',
    text: 'Տեկտոնական տեսանկյունից ո՞ր ակտիվ երկրաբանական խզվածքի գոտում է անմիջապես տեղակայված Վանաձորի գոգավորությունը։',
    options: [
      QuizOption(id: 'vanadzor_expert_08_a', text: 'Գառնու խզվածքի'),
      QuizOption(id: 'vanadzor_expert_08_b', text: 'Անատոլիական խզվածքի'),
      QuizOption(id: 'vanadzor_expert_08_c', text: 'Փամբակ-Սևան խզվածքի'),
      QuizOption(id: 'vanadzor_expert_08_d', text: 'Շիրակի խզվածքի'),
    ],
    correctOptionId: 'vanadzor_expert_08_c',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_09',
    text: 'Ծովի մակերևույթից միջինում ի՞նչ բարձրության վրա է տարածվում Վանաձոր քաղաքի հիմնական հատվածը։',
    options: [
      QuizOption(id: 'vanadzor_expert_09_a', text: 'Մոտ 900 մետր'),
      QuizOption(id: 'vanadzor_expert_09_b', text: 'Մոտ 1350 մետր'),
      QuizOption(id: 'vanadzor_expert_09_c', text: 'Մոտ 1750 մետր'),
      QuizOption(id: 'vanadzor_expert_09_d', text: 'Մոտ 2100 մետր'),
    ],
    correctOptionId: 'vanadzor_expert_09_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_10',
    text: '1934 թվականից ի վեր ի՞նչ անունով էր լույս տեսնում Կիրովականի քաղաքային կոմիտեի պաշտոնական թերթը։',
    options: [
      QuizOption(id: 'vanadzor_expert_10_a', text: '«Լոռու մարզ»'),
      QuizOption(id: 'vanadzor_expert_10_b', text: '«Ավանգարդ»'),
      QuizOption(id: 'vanadzor_expert_10_c', text: '«Փարոս»'),
      QuizOption(id: 'vanadzor_expert_10_d', text: '«Կայծ»'),
    ],
    correctOptionId: 'vanadzor_expert_10_d',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_11',
    text: 'Խորհրդային տարիներին Կիրովականի «Պոլիմերսոսինձ» ԳՀԻ-ի կողմից մշակված գերամուր սոսինձները որտե՞ղ էին առավելապես կիրառվում համամիութենական մասշտաբով։',
    options: [
      QuizOption(id: 'vanadzor_expert_11_a', text: 'Գյուղատնտեսական տեխնիկայի արտադրության մեջ'),
      QuizOption(id: 'vanadzor_expert_11_b', text: 'Տիեզերագնացության և ավիացիայի մեջ'),
      QuizOption(id: 'vanadzor_expert_11_c', text: 'Թեթև արդյունաբերության մեջ'),
      QuizOption(id: 'vanadzor_expert_11_d', text: 'Խոհանոցային սպասքի գործարաններում'),
    ],
    correctOptionId: 'vanadzor_expert_11_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_12',
    text: 'Ո՞վ է հանդիսանում Վանաձորի կենտրոնում գտնվող և 1895 թ. կառուցված ռուսական ուղղափառ եկեղեցու նախագծի հեղինակ-ճարտարապետը։',
    options: [
      QuizOption(id: 'vanadzor_expert_12_a', text: 'Ալեքսանդր Թամանյանը'),
      QuizOption(id: 'vanadzor_expert_12_b', text: 'Վասիլի Բաժենովը'),
      QuizOption(id: 'vanadzor_expert_12_c', text: 'Ալեքսանդր Պոմերանցևը'),
      QuizOption(id: 'vanadzor_expert_12_d', text: 'Պավել Սյուզորը'),
    ],
    correctOptionId: 'vanadzor_expert_12_c',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_13',
    text: 'Ըստ 1897 թվականի Ռուսական կայսրության առաջին համընդհանուր մարդահամարի արդյունքների՝ մոտավորապես որքա՞ն էր Ղարաքիլիսայի բնակչությունը։',
    options: [
      QuizOption(id: 'vanadzor_expert_13_a', text: 'Շուրջ 1,200 մարդ'),
      QuizOption(id: 'vanadzor_expert_13_b', text: 'Շուրջ 3,900 մարդ'),
      QuizOption(id: 'vanadzor_expert_13_c', text: 'Շուրջ 15,000 մարդ'),
      QuizOption(id: 'vanadzor_expert_13_d', text: 'Շուրջ 25,500 մարդ'),
    ],
    correctOptionId: 'vanadzor_expert_13_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_14',
    text: 'Հայտնի ճարտարապետներից ո՞ւմ նախագծով է խորհրդային տարիներին կառուցվել Վանաձորի Հայքի հրապարակում գտնվող մարզպետարանի վարչական շենքը։',
    options: [
      QuizOption(id: 'vanadzor_expert_14_a', text: 'Զավեն Բախշինյանի'),
      QuizOption(id: 'vanadzor_expert_14_b', text: 'Արթուր Թարխանյանի'),
      QuizOption(id: 'vanadzor_expert_14_c', text: 'Սպարտակ Կնտեղցյանի'),
      QuizOption(id: 'vanadzor_expert_14_d', text: 'Ռաֆայել Իսրայելյանի'),
    ],
    correctOptionId: 'vanadzor_expert_14_a',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_15',
    text: 'ՀՀ ԳԱԱ ո՞ր գիտահետազոտական ինստիտուտի կազմում է ընդգրկված 1936 թվականին հիմնադրված Վանաձորի բուսաբանական այգին։',
    options: [
      QuizOption(id: 'vanadzor_expert_15_a', text: 'Կենդանաբանության և հիդրոէկոլոգիայի գիտական կենտրոնի'),
      QuizOption(id: 'vanadzor_expert_15_b', text: 'Էկոլոգանոոսֆերային հետազոտությունների կենտրոնի'),
      QuizOption(id: 'vanadzor_expert_15_c', text: 'Ա. Թախտաջյանի անվան բուսաբանության ինստիտուտի'),
      QuizOption(id: 'vanadzor_expert_15_d', text: 'Միկրոբիոլոգիայի ինստիտուտի'),
    ],
    correctOptionId: 'vanadzor_expert_15_c',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_16',
    text: '1918 թ. Ղարաքիլիսայի հերոսամարտում իր մարտկոցով աչքի ընկած և հերոսաբար զոհված ո՞ր կապիտանի անունով է կոչվում Վանաձորի փողոցներից մեկը։',
    options: [
      QuizOption(id: 'vanadzor_expert_16_a', text: 'Գարեգին Նժդեհի'),
      QuizOption(id: 'vanadzor_expert_16_b', text: 'Գուրգեն Տեր-Մովսիսյանի'),
      QuizOption(id: 'vanadzor_expert_16_c', text: 'Դանիել Բեկ-Փիրումյանի'),
      QuizOption(id: 'vanadzor_expert_16_d', text: 'Պողոս Բեկ-Մաքինցյանի'),
    ],
    correctOptionId: 'vanadzor_expert_16_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_17',
    text: 'Ի՞նչ բարձրություն ունի Բազումի լեռնաշղթայով անցնող Պուշկինի լեռնանցքը, որով Վանաձորը կապվում է Ստեփանավանի հետ։',
    options: [
      QuizOption(id: 'vanadzor_expert_17_a', text: '1850 մետր'),
      QuizOption(id: 'vanadzor_expert_17_b', text: '2037 մետր'),
      QuizOption(id: 'vanadzor_expert_17_c', text: '2410 մետր'),
      QuizOption(id: 'vanadzor_expert_17_d', text: '2800 մետր'),
    ],
    correctOptionId: 'vanadzor_expert_17_b',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_18',
    text: 'Վանաձորի ճանաչված արդյունաբերական ձեռնարկություններից ո՞րն էր մասնագիտացած ավտոմատիկայի սարքերի և ճշգրիտ հաստոցների արտադրության մեջ ԽՍՀՄ տարիներին։',
    options: [
      QuizOption(id: 'vanadzor_expert_18_a', text: '«Ավտոգենմաշ» գործարանը'),
      QuizOption(id: 'vanadzor_expert_18_b', text: '«Էլեկտրոն» գործարանը'),
      QuizOption(id: 'vanadzor_expert_18_c', text: '«Ճշգրիտ հաստոցների» (Ավտոմատիկայի) գործարանը'),
      QuizOption(id: 'vanadzor_expert_18_d', text: '«Քիմմանրաթել» գործարանը'),
    ],
    correctOptionId: 'vanadzor_expert_18_c',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_19',
    text: 'Վանաձոր քաղաքը հյուսիսից եզերող Բազումի լեռնաշղթայի ամենաբարձր գագաթը ո՞րն է։',
    options: [
      QuizOption(id: 'vanadzor_expert_19_a', text: 'Ուրասարը'),
      QuizOption(id: 'vanadzor_expert_19_b', text: 'Թեժ լեռը'),
      QuizOption(id: 'vanadzor_expert_19_c', text: 'Արամազդը'),
      QuizOption(id: 'vanadzor_expert_19_d', text: 'Արտենին'),
    ],
    correctOptionId: 'vanadzor_expert_19_a',
  ),
  QuizQuestion(
    id: 'vanadzor_expert_20',
    text: 'Ի՞նչ յուրահատուկ ճարտարապետական լուծում ունի Վանաձորի կենտրոնական Սուրբ Աստվածածին եկեղեցու (1831թ.) շարվածքը, որը բնորոշ է 19-րդ դարի տեղական ոճին։',
    options: [
      QuizOption(id: 'vanadzor_expert_20_a', text: 'Ամբողջությամբ սպիտակ մարմարից քանդակված ճակատ'),
      QuizOption(id: 'vanadzor_expert_20_b', text: 'Սև և նարնջագույն տուֆի շախմատաձև կամ խաչաձև համադրություն'),
      QuizOption(id: 'vanadzor_expert_20_c', text: 'Կարմիր աղյուսով կառուցված գմբեթ'),
      QuizOption(id: 'vanadzor_expert_20_d', text: 'Ապակեպատ հսկայական վիտրաժներ մուտքի մոտ'),
    ],
    correctOptionId: 'vanadzor_expert_20_b',
  ),
];

List<QuizQuestion> randomVanadzorQuestions({int count = 10, Random? random}) {
  if (count < 0 || count > vanadzorQuestionBank.length) {
    throw RangeError.range(count, 0, vanadzorQuestionBank.length, 'count');
  }

  final shuffled = List<QuizQuestion>.of(vanadzorQuestionBank)..shuffle(random);
  return shuffled.take(count).toList(growable: false);
}