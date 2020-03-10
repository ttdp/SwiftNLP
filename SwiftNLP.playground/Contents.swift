import NaturalLanguage

let text = "Apple provides a community based knowledge portal for Analytics and Data Science professionals."

print(text)

let tokenizer = NLTokenizer(unit: .word)
tokenizer.string = text

tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { range, _ -> Bool in
    print(text[range])
    return true
}

let text2 = "swimming, swam, swim, assuming, assumed, assume, learned, learning."

let tagger = NLTagger(tagSchemes: [.lemma])
tagger.string = text2

tagger.enumerateTags(in: text2.startIndex..<text2.endIndex, unit: .word, scheme: .lemma) { tag, range -> Bool in
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
let tags: [NLTag] = [.personalName, .placeName, .organizationName]
nerTagger.string = text4

nerTagger.enumerateTags(in: text4.startIndex..<text4.endIndex, unit: .word, scheme: .nameType, options: nerOptions) { tag, range -> Bool in
    if let tag = tag, tags.contains(tag) {
        print("\(text4[range]): \(tag.rawValue)")
    }
    return true
}
