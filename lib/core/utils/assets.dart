import 'package:easy_english/domain/entities/category_data_entity.dart';

import '../../domain/entities/lesson_entity.dart';

class Assets {
  Assets._();

  // Search in topics
  static const topicFolders = [
    'animals',
    'appearance',
    'communication',
    'culture',
    'food_and_drink',
    'functions',
    'health',
    'homes_and_buildings',
    'leisure',
    'notions',
    'people',
    'politics_and_society',
    'science_and_technology',
    'sport',
    'the_natural_world',
    'time_and_space',
    'travel',
    'work_and_business',
  ];

  static List<String> getTopicsForFolder(String folder) {
    switch (folder) {
      case 'animals':
        return ['animals', 'birds', 'fish_and_shellfish', 'insects_worms'];
      case 'appearance':
        return [
          'appearance',
          'body',
          'clothes_and_fashion',
          'colours_and_shapes',
        ];
      case 'communication':
        return ['language', 'phones_email_and_the_internet'];
      case 'culture':
        return [
          'art',
          'film_and_theatre',
          'literature_and_writing',
          'music',
          'tv_radio_and_news',
        ];
      case 'food_and_drink':
        return ['cooking_and_eating', 'drinks', 'food'];
      case 'functions':
        return [
          'discussion_and_agreement',
          'doubt_guessing_and_certainty',
          'opinion_and_argument',
          'permission_and_obligation',
          'preferences_and_decisions',
          'suggestions_and_advice',
        ];
      case 'health':
        return [
          'disability',
          'health_and_fitness',
          'health_problems',
          'healthcare',
          'mental_health',
        ];
      case 'homes_and_buildings':
        return ['buildings', 'gardens', 'houses_and_homes'];
      case 'leisure':
        return ['games_and_toys', 'hobbies', 'shopping'];
      case 'notions':
        return [
          'change_cause_and_effect',
          'danger',
          'difficulty_and_failure',
          'success',
        ];
      case 'people':
        return [
          'education',
          'family_and_relationships',
          'feelings',
          'life_stages',
          'personal_qualities',
        ];
      case 'politics_and_society':
        return [
          'crime_and_punishment',
          'law_and_justice',
          'people_in_society',
          'politics',
          'religion_and_festivals',
          'social_issues',
          'war_and_conflict',
        ];
      case 'science_and_technology':
        return [
          'biology',
          'computers',
          'engineering',
          'maths_and_measurement',
          'physics_and_chemistry',
          'scientific_research',
        ];
      case 'sport':
        return [
          'other_sports',
          'sports_ball_and_racket_sports',
          'water_sports',
        ];
      case 'the_natural_world':
        return [
          'farming',
          'geography',
          'plants_and_trees',
          'the_environment',
          'weather',
        ];
      case 'time_and_space':
        return ['history', 'space', 'time'];
      case 'travel':
        return [
          'holidays',
          'transport_by_air',
          'transport_by_bus_and_train',
          'transport_by_car_or_lorry',
          'transport_by_water',
        ];
      case 'work_and_business':
        return ['business', 'jobs'];
      default:
        return [];
    }
  }

  static const Map<String, List<String>> listTopic = {
    'animals': ['animals', 'birds', 'fish_and_shellfish', 'insects_worms'],
    'appearance': [
      'appearance',
      'body',
      'clothes_and_fashion',
      'colours_and_shapes',
    ],
    'communication': ['language', 'phones_email_and_the_internet'],
    'culture': [
      'art',
      'film_and_theatre',
      'literature_and_writing',
      'music',
      'tv_radio_and_news',
    ],
    'food_and_drink': ['cooking_and_eating', 'drinks', 'food'],
    'functions': [
      'discussion_and_agreement',
      'doubt_guessing_and_certainty',
      'opinion_and_argument',
      'permission_and_obligation',
      'preferences_and_decisions',
      'suggestions_and_advice',
    ],
    'health': [
      'disability',
      'health_and_fitness',
      'health_problems',
      'healthcare',
      'mental_health',
    ],
    'homes_and_buildings': ['buildings', 'gardens', 'houses_and_homes'],
    'leisure': ['games_and_toys', 'hobbies', 'shopping'],
    'notions': [
      'change_cause_and_effect',
      'danger',
      'difficulty_and_failure',
      'success',
    ],
    'people': [
      'education',
      'family_and_relationships',
      'feelings',
      'life_stages',
      'personal_qualities',
    ],
    'politics_and_society': [
      'crime_and_punishment',
      'law_and_justice',
      'people_in_society',
      'politics',
      'religion_and_festivals',
      'social_issues',
      'war_and_conflict',
    ],
    'science_and_technology': [
      'biology',
      'computers',
      'engineering',
      'maths_and_measurement',
      'physics_and_chemistry',
      'scientific_research',
    ],
    'sport': ['other_sports', 'sports_ball_and_racket_sports', 'water_sports'],
    'the_natural_world': [
      'farming',
      'geography',
      'plants_and_trees',
      'the_environment',
      'weather',
    ],
    'time_and_space': ['history', 'space', 'time'],
    'travel': [
      'holidays',
      'transport_by_air',
      'transport_by_bus_and_train',
      'transport_by_car_or_lorry',
      'transport_by_water',
    ],
    'work_and_business': ['business', 'jobs'],
  };

  static final List<CategoryDataEntity> categories = [
    const CategoryDataEntity(
      id: 1,
      title: 'Tenses',
      description: '13 tenses in English',
      progress: 0,
      total: 13,
      lessons: [
        LessonEntity(
          id: 1,
          title: 'Simple Present',
          subTitle: 'S + to be/V + O',
          path: Assets.presentSimplePresentTense,
        ),
        LessonEntity(
          id: 2,
          title: 'Present Continuous',
          subTitle: 'S + to be + V-ing + O',
          path: Assets.presentPresentContinuousTense,
        ),
        LessonEntity(
          id: 3,
          title: 'Present Perfect',
          subTitle: 'S + have/has + V3 + O',
          path: Assets.presentPresentPerfectTense,
        ),
        LessonEntity(
          id: 4,
          title: 'Present Perfect Continuous',
          subTitle: 'S + have/has + been + V-ing + O',
          path: Assets.presentPresentPerfectContinuousTense,
        ),
        LessonEntity(
          id: 5,
          title: 'Simple Past',
          subTitle: 'S + V2 + O',
          path: Assets.pastSimplePastTense,
        ),
        LessonEntity(
          id: 6,
          title: 'Past Continuous',
          subTitle: 'S + was/were + V-ing + O',
          path: Assets.pastPastContinuousTense,
        ),
        LessonEntity(
          id: 7,
          title: 'Past Perfect',
          subTitle: 'S + had + V3 + O',
          path: Assets.pastPastPerfectTense,
        ),
        LessonEntity(
          id: 8,
          title: 'Past Perfect Continuous',
          subTitle: 'S + had + been + V-ing + O',
          path: Assets.pastPastPerfectContinuousTense,
        ),
        LessonEntity(
          id: 9,
          title: 'Simple Future',
          subTitle: 'S + will + V + O',
          path: Assets.futureFutureSimpleTense,
        ),
        LessonEntity(
          id: 10,
          title: 'Future Continuous',
          subTitle: 'S + will + be + V-ing + O',
          path: Assets.futureFutureContinuousTense,
        ),
        LessonEntity(
          id: 11,
          title: 'Future Perfect',
          subTitle: 'S + will + have + V3 + O',
          path: Assets.futureFuturePerfectTense,
        ),
        LessonEntity(
          id: 12,
          title: 'Future Perfect Continuous',
          subTitle: 'S + will + have + been + V-ing + O',
          path: Assets.futureFuturePerfectContinuousTense,
        ),
        LessonEntity(
          id: 13,
          title: 'Near Future',
          subTitle: 'S + to be + going to + V + O',
          path: Assets.futureNearFuture,
        ),
      ],
    ),
    const CategoryDataEntity(
      id: 2,
      title: 'Sentences',
      description: 'Sentences in English',
      progress: 0,
      total: 8,
      lessons: [
        LessonEntity(
          id: 14,
          title: 'Passive Voice',
          subTitle: 'Emphasize the action rather than the doer',
          path: Assets.sentencesPassiveVoice,
        ),
        LessonEntity(
          id: 15,
          title: 'Reported Speech',
          subTitle: 'Report what someone else said',
          path: Assets.sentencesReportedSpeech,
        ),
        LessonEntity(
          id: 16,
          title: 'Conditional Sentences',
          subTitle: '4 types of conditional sentences',
          path: Assets.sentencesConditionalSentences,
        ),
        LessonEntity(
          id: 17,
          title: 'Wish Sentences',
          subTitle: 'Express regret or desire',
          path: Assets.sentencesWishSentences,
        ),
        LessonEntity(
          id: 18,
          title: 'Question Tags',
          subTitle: 'Short questions at the end of a sentence',
          path: Assets.sentencesQuestionTags,
        ),
        LessonEntity(
          id: 19,
          title: 'Imperative Sentences',
          subTitle: 'Give orders or instructions',
          path: Assets.sentencesImperativeSentences,
        ),
        LessonEntity(
          id: 20,
          title: 'Comparison Sentences',
          subTitle: 'Compare two or more things',
          path: Assets.sentencesComparisonSentences,
        ),
        LessonEntity(
          id: 21,
          title: 'Exclamatory Sentences',
          subTitle: 'Express strong feelings',
          path: Assets.sentencesExclamatorySentences,
        ),
      ],
    ),
    const CategoryDataEntity(
      id: 3,
      title: 'Words',
      description: 'Words in English',
      progress: 0,
      total: 9,
      lessons: [
        LessonEntity(
          id: 22,
          title: 'Nouns',
          subTitle: 'Person, place, thing, or idea',
          path: Assets.wordFamiliesNouns,
        ),
        LessonEntity(
          id: 23,
          title: 'Pronouns',
          subTitle: 'Replace nouns',
          path: Assets.wordsPronouns,
        ),
        LessonEntity(
          id: 24,
          title: 'Adjectives',
          subTitle: 'Describe nouns',
          path: Assets.wordFamiliesAdjectives,
        ),
        LessonEntity(
          id: 25,
          title: 'Adverbs',
          subTitle: 'Describe verbs, adjectives, or other adverbs',
          path: Assets.wordFamiliesAdverbs,
        ),
        LessonEntity(
          id: 26,
          title: 'Prepositions',
          subTitle: 'Show the relationship between a noun and another word',
          path: Assets.wordsPreposition,
        ),
        LessonEntity(
          id: 27,
          title: 'Conjunctions',
          subTitle: 'Connect words, phrases, or clauses',
          path: Assets.wordsConjunction,
        ),
        LessonEntity(
          id: 28,
          title: 'Interjections',
          subTitle: 'Express strong feelings or emotions',
          path: Assets.wordsInterjection,
        ),
        LessonEntity(
          id: 29,
          title: 'Articles',
          subTitle: 'A, an, the',
          path: Assets.wordsArticle,
        ),
        LessonEntity(
          id: 32,
          title: 'Modals Verbs',
          subTitle: 'Can, could, may, might, must, shall, should, will, would',
          path: Assets.wordsModalVerbs,
        ),
      ],
    ),
    const CategoryDataEntity(
      id: 4,
      title: "Others",
      description: "Other grammar topics",
      progress: 0,
      total: 5,
      lessons: [
        LessonEntity(
          id: 33,
          title: "Word Families",
          subTitle: "Words that are related to each other",
          path: Assets.wordFamiliesWordFamilies,
        ),
        LessonEntity(
          id: 34,
          title: "Phrasal Verbs",
          subTitle: "Verb + preposition or adverb",
          path: Assets.grammarPhrasalVerbs,
        ),
        LessonEntity(
          id: 35,
          title: "Idioms",
          subTitle:
              "Expressions that have a meaning different from the meaning of the individual words",
          path: Assets.grammarIdioms,
        ),
        LessonEntity(
          id: 36,
          title: "Proverbs",
          subTitle: "Short sayings that give advice or express a belief",
          path: Assets.grammarProverbs,
        ),
        LessonEntity(
          id: 37,
          title: "Quantifiers",
          subTitle: "Words that describe quantity",
          path: Assets.grammarQuantifiers,
        ),
      ],
    ),
  ];

  static const String futureFuture =
      'assets/md/grammar/tenses/future/future.md';
  static const String futureFutureContinuousTense =
      'assets/md/grammar/tenses/future/future__continuous__tense.md';
  static const String futureFuturePerfectContinuousTense =
      'assets/md/grammar/tenses/future/future__perfect__continuous__tense.md';
  static const String futureFuturePerfectTense =
      'assets/md/grammar/tenses/future/future__perfect__tense.md';
  static const String futureFutureSimpleTense =
      'assets/md/grammar/tenses/future/future__simple__tense.md';
  static const String futureNearFuture =
      'assets/md/grammar/tenses/future/near__future.md';
  static const String grammarGrammar = 'assets/md/grammar/grammar.md';
  static const String grammarIdioms = 'assets/md/grammar/idioms.md';
  static const String grammarPhrasalVerbs =
      'assets/md/grammar/phrasal__verbs.md';
  static const String grammarProverbs = 'assets/md/grammar/proverbs.md';
  static const String grammarQuantifiers = 'assets/md/grammar/quantifiers.md';
  static const String lottieConfetti = 'assets/lottie/confetti.json';
  static const String mdEnglish = 'assets/md/english.md';
  static const String pastPast = 'assets/md/grammar/tenses/past/past.md';
  static const String pastPastContinuousTense =
      'assets/md/grammar/tenses/past/past__continuous__tense.md';
  static const String pastPastPerfectContinuousTense =
      'assets/md/grammar/tenses/past/past__perfect__continuous__tense.md';
  static const String pastPastPerfectTense =
      'assets/md/grammar/tenses/past/past__perfect__tense.md';
  static const String pastSimplePastTense =
      'assets/md/grammar/tenses/past/simple__past__tense.md';
  static const String pngFlame = 'assets/png/flame.png';
  static const String pngFlameInactive = 'assets/png/flame_inactive.png';
  static const String pngImg = 'assets/png/img.png';
  static const String pngImg1 = 'assets/png/img_1.png';
  static const String pngLauncher = 'assets/png/launcher.png';
  static const String pngLauncherPlaystore =
      'assets/png/launcher-playstore.png';
  static const String pngSample = 'assets/png/sample.png';
  static const String pngXlsxDemo = 'assets/png/xlsx_demo.png';
  static const String presentPresent =
      'assets/md/grammar/tenses/present/present.md';
  static const String presentPresentContinuousTense =
      'assets/md/grammar/tenses/present/present__continuous__tense.md';
  static const String presentPresentPerfectContinuousTense =
      'assets/md/grammar/tenses/present/present__perfect__continuous__tense.md';
  static const String presentPresentPerfectTense =
      'assets/md/grammar/tenses/present/present__perfect__tense.md';
  static const String presentSimplePresentTense =
      'assets/md/grammar/tenses/present/simple__present__tense.md';
  static const String sentencesComparisonSentences =
      'assets/md/grammar/sentences/comparison__sentences.md';
  static const String sentencesConditionalSentences =
      'assets/md/grammar/sentences/conditional__sentences.md';
  static const String sentencesExclamatorySentences =
      'assets/md/grammar/sentences/exclamatory__sentences.md';
  static const String sentencesImperativeSentences =
      'assets/md/grammar/sentences/imperative__sentences.md';
  static const String sentencesPassiveVoice =
      'assets/md/grammar/sentences/passive_voice.md';
  static const String sentencesQuestionTags =
      'assets/md/grammar/sentences/question__tags.md';
  static const String sentencesReportedSpeech =
      'assets/md/grammar/sentences/reported__speech.md';
  static const String sentencesSentences =
      'assets/md/grammar/sentences/sentences.md';
  static const String sentencesWishSentences =
      'assets/md/grammar/sentences/wish__sentences.md';
  static const String speakingSpeaking = 'assets/md/speaking/speaking.md';
  static const String speakingTheInternationalPhoneticAlphabetIPA =
      'assets/md/speaking/the__international__phonetic__alphabet__i_p_a.md';
  static const String tensesTenses = 'assets/md/grammar/tenses/tenses.md';
  static const String wordFamiliesAdjectives =
      'assets/md/grammar/words/word__families/adjectives.md';
  static const String wordFamiliesAdverbs =
      'assets/md/grammar/words/word__families/adverbs.md';
  static const String wordFamiliesNouns =
      'assets/md/grammar/words/word__families/nouns.md';
  static const String wordFamiliesVerbs =
      'assets/md/grammar/words/word__families/verbs.md';
  static const String wordFamiliesWordFamilies =
      'assets/md/grammar/words/word__families/word__families.md';
  static const String wordsArticle = 'assets/md/grammar/words/article.md';
  static const String wordsConjunction =
      'assets/md/grammar/words/conjunction.md';
  static const String wordsInterjection =
      'assets/md/grammar/words/interjection.md';
  static const String wordsModalVerbs =
      'assets/md/grammar/words/modal__verbs.md';
  static const String wordsPreposition =
      'assets/md/grammar/words/preposition.md';
  static const String wordsPronouns = 'assets/md/grammar/words/pronouns.md';
  static const String wordsWords = 'assets/md/grammar/words/words.md';

  // my icon
  static const String svgBook = 'assets/svg/book.svg';
  static const String svgBookmarks = 'assets/svg/bookmarks.svg';
  static const String svgBookOpenText = 'assets/svg/bookopentext.svg';
  static const String svgFire = 'assets/svg/fire.svg';
  static const String svgGearSix = 'assets/svg/gearsix.svg';
  static const String svgTranslate = 'assets/svg/translate.svg';
  static const String svgStarOutline = 'assets/svg/staroutline.svg';
  static const String svgStarFilled = 'assets/svg/starfilled.svg';
  static const String svgVolume = 'assets/svg/volume.svg';
  static const String svgFlagUS = 'assets/svg/flagUSA.svg';
  static const String svgFlagUK = 'assets/svg/flagUK.svg';
  static const String svgFlagUS24 = 'assets/svg/flagUSA24.svg';
  static const String svgFlagUK24 = 'assets/svg/flagUK24.svg';
  static const String svgArrowRight = 'assets/svg/arrow_back_ios.svg';
  static const String svgArrowLeft = 'assets/svg/arrow_left_ios.svg';
  static const String svgSearch = 'assets/svg/search.svg';
  static const String svgClose = 'assets/svg/close.svg';
  static const String svgHouse = 'assets/svg/house.svg';
  static const String svgUser = 'assets/svg/user.svg';
  static const String svgGrammar = 'assets/svg/grammar.svg';
  static const String svgBookmarkSimple = 'assets/svg/bookmarksimple.svg';
  static const String svgDictionary = 'assets/svg/dictionary.svg';
  static const String svgSun = 'assets/svg/sun.svg';
  static const String svgMoon = 'assets/svg/moon.svg';
  static const String ilustrationhomepage =
      'assets/svg/ilustrationhomepage.svg';

  // image
  static const String imageTopic = 'assets/images/image_topic.jpg';
  static const String pngCat = 'assets/png/cat.png';
  static const String pngAppearance = 'assets/png/appearance.png';
  static const String pngCommunication = 'assets/png/communication.png';
  static const String pngCulture = 'assets/png/culture.png';
  static const String pngFoodAndDrink = 'assets/png/food_and_drink.png';
  static const String pngFunction = 'assets/png/function.png';
  static const String pngHealth = 'assets/png/health.png';
  static const String pngHomeAndBuilding = 'assets/png/home_and_building.png';
  static const String pngLeisure = 'assets/png/leisure.png';
  static const String pngNotions = 'assets/png/notions.png';
  static const String pngPeople = 'assets/png/people.png';
  static const String pngPoliticsAndSociety =
      'assets/png/politics_and_society.png';
  static const String pngScienceAndTechnology =
      'assets/png/science_and_technology.png';
  static const String pngSport = 'assets/png/sport.png';
  static const String pngTheNaturalWorld = 'assets/png/the_natural_world.png';
  static const String pngTimeAndSpace = 'assets/png/time_and_space.png';
  static const String pngTravel = 'assets/png/travel.png';
  static const String pngWorkAndBusiness = 'assets/png/work_and_business.png';
  static const String pngWordsList = 'assets/png/wordslist.png';
  static const String pngGrammar = 'assets/png/grammar.png';
  static const String pngFlashCards = 'assets/png/flashcard.png';
  static const String pngCalander = 'assets/png/calander.png';
  static const String pngLogo = 'assets/png/logo.png';
}
