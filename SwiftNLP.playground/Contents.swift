import NaturalLanguage

// MARK: - Language Identification

let recognizer = NLLanguageRecognizer()
recognizer.processString("Stay hungry. Stay foolish.")

let lang = recognizer.dominantLanguage?.rawValue  // Optional("en")

// MARK: - Tokenization

let text = "I want to play basketball 🏀."
let tokenizer = NLTokenizer(unit: .word)
tokenizer.string = text

let tokenRanges = tokenizer.tokens(for: text.startIndex..<text.endIndex)
let tokens = tokenRanges.map { text[$0] }
print(tokens)

// MARK: - Word Tagging

let tagger = NLTagger(tagSchemes: [NLTagScheme.lexicalClass])
let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .omitOther]
tagger.string = text

let tags = tagger.tags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options)
let taggedWords = tags.map { tag in (text[tag.1], tag.0!.rawValue) }
print(taggedWords)

let text2 = "swimming, swam, swim, assuming, assumed, assume, learned, learning."

let tagger2 = NLTagger(tagSchemes: [.lemma])
tagger2.string = text2

tagger2.enumerateTags(in: text2.startIndex..<text2.endIndex, unit: .word, scheme: .lemma) { tag, range -> Bool in
    if let tag = tag {
        print("\(text2[range]): \(tag.rawValue)")
    }
    return true
}

let text3 = "Hello world, I am a software developer. I work with iOS application."

let posTagger = NLTagger(tagSchemes: [.lexicalClass])
let posOptions: NLTagger.Options = [NLTagger.Options.omitWhitespace, NLTagger.Options.omitPunctuation]
posTagger.string = text3

posTagger.enumerateTags(in: text3.startIndex..<text3.endIndex, unit: .word, scheme: .lexicalClass, options: posOptions) { tag, range -> Bool in
    if let tag = tag {
        print("\(text3[range]): \(tag.rawValue)")
    }
    return true
}

let text4 = "Apple is lookings at buying U.K. startup for $1 billion in London."

let nerTagger = NLTagger(tagSchemes: [.nameType])
let nerOptions: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
let nameTags: [NLTag] = [.personalName, .placeName, .organizationName]
nerTagger.string = text4

nerTagger.enumerateTags(in: text4.startIndex..<text4.endIndex, unit: .word, scheme: .nameType, options: nerOptions) { tag, range -> Bool in
    if let tag = tag, nameTags.contains(tag) {
        print("\(text4[range]): \(tag.rawValue)")
    }
    return true
}
