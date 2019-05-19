library(stringr)
library(dplyr)
library(Rstem)

politics <- data.frame(names = c("Absentee","Accountable","Activist","Adverse","Advertising","Advice","Advise","Affiliation","Aggressive","Amendment","Announcement","Anthem","Appeal","AppearanceAppoint","Approach","Appropriation","Arguments","Articulate","Aspiration","Asset","Assimilation","At","large","Audience","Authorization","Background","Bait","Balancedbudget","Ballot","Ballotbox","Bandwagon","Barnstorm","Behavior","Beliefs","Biannual","Bias","Bicameral","Bill",
                             "Bipartisan","Boondoggle","Brochure","Budget","Bunk","Bureaucracy","Cabinet","Campaign","Candidate","Canvass","Capitalize","Career","Catalyst","Caucus","Ceiling","Centrist","Challenge","Challenger","Changes","Charismatic","Checksandbalances","Choice","Citation","Civic","Coalition","Coast-to-coast","Coattail","Collaboration","Colleague","Collective","Commitments","Committee","Commonality","Communication","CompassionConcede","Concessions",
                             "Confidence","Congress","Congressional","Conscience","Consequence","Conservative","Constituent","Constitution","Consultation","Contribution","Controversy","Convene","Convention","Council","Curiosity","Cycle","Darkhorse","Debate","Decision","Decisive","DeclarationDefeat","Deficit","Delegate","Deliberate","Deliberation","Democracy","Democrat","Democratic","Derision","Destiny","Diligent","Diplomat","Disapproval","DiscourseDiscreet","Discussion",
                             "Disheartened","Dishonesty","Dissatisfaction","District","Distrust","Diverse","Division","Dogma","Dominate","Donation","Donor","DossierDynamic","Effective","Efficient","Elation","Electoralcollege","Elevate","Eloquence","Emphasis","Enact","Endorsement","Engaging","Equal","Ethics","Euphoria","Excessive","Executive","Exitpoll","Experience","Faction","Federal","Feud","Filibuster","Flawed","Focus","Forum","Fraud","Freedom","Front","runner","Fundamental",
                             "Funding","Fundraiser","Gambit","Gerrymander","Glaring","GOP","Government","Grass","roots","Grateful","Handshakes","Hard","money","Hatch","Act","Heckle","Historic","HonestyHooray","Hypocrisy","BJP","narendra","modi","namo","modi","mamta","banerjee","bsp","sp","nitish","shivsena","uddhav","raj","thackeray","hindu","muslim","islamic","aimim","vote","votes","pole","evm","election","commission","india","america","pakistan","ISI","azhar",
                             "masood","uri","surgical","strike","ballot","rahulgandhi","pappu","congress","scam","rss","minister","ministry","foreign","ministry","economic","rashtravadi","priyanka","terrorism","terrorist","manifesto","government","loksabha","police","security","army","indian","Immigrants","Impound","InalienableIncentive","Incorporate","Incumbency","Incumbent","Independent","Independent","Indulge","Infallible","Influx","Informative","Initiative","Innuendo",
                             "InspiringIntegrity","Interests","Investigate","Involvement","Irresponsible","Issues","Jeopardy","JUBILANT","Judge","Judicial","Keen","Knowledge","Lameduck","Landslide","LawLeader","Leadership","Leanings","Legal","Legalization","Legislature","Liberal","Listening","Lobbyist","Lone","Loser","Loss","Loyalty","Magistrate","MajorityMandate","Meaningful","Measures","Media","Meetings","Mentor","Midtermelection","Minority","Misinformation",
                             "Motives","Mudslinging","National","NationwideNegativity","Network","Nominate","Nominee","Nonpartisan","Obligation","Obsequious","Offensive","Office","Official","Oldboy","Opine","Opinion","OpinionatedOpportunity","Opposition","Orator","Outspoken","Ovation","PAC","Pamphlets","Pardon","Participation","Partisanship","Party","Patriotism","Petition","PlatformPledge","Plurality","Polarize","Policy","Polite","Politician","Politics",
                             "Poll","Pollingplace","Pollster","Popular","Popularity","Porkbarrel","Position","paperPragmatist","Praise","Precinct","Predictions","Prescient","Press","Pride","Primary","Priority","Proactive","Process","Progressive","ProjectionPromises","Propaganda","Proponent","Proposal","Purpose","Query","Quest","Questions","Quorum","Quotes","Race","Ratify","Re-election","Reapportionment","RecallRecognition","Reconciliation","Recount","Recrimination",
                             "Redistrict","Referendum","Reform","Registration","Regulate","Representation","Republican","RescindResignation","Resilience","Restrictions","Retort","Reveal","Revelations","Revenues","Rhetoric","Rollcall","Runoff","Scope","Senate","Seniority","ShiftShortcoming","Shuffle","Sidelines","Sinecure","Skill","Slate","Slogan","Solicitation","Solution","Spar","Spectacle","Speculate","Spending","Spin","Stakes","StanceState’srights",
                             "Statute","Strategist","Strategy","Strawpoll","Stump","Subcommittee","Subjects","Success","Suffrage","Support","System","Tactics","Tally","TaxpayerTerm","Termlimit","Ticket","Topic","Trust","Turnout","Ultimate","Unanimous","Uncommitted","Unfair","Uniformity","Unity","Unknown","Unopposed","Unprecedented","UnwindUpcoming","Upset","Vacancy","Veto","Viable","Victor","Victory","Vie","Viewpoint","Views","Violations","VIP","Volunteers","Voter",
                             "Vulnerability","Ward","Whistle-stop","Wild-card","Win","Winner","Withdraw","Withhold","Woo","Xenophobic","Yell","Yield","Zeal","Zealous","Zone"),type = c("politics"))
politics$names <- tolower(politics$names)
politics <- filter(politics,politics$names != "")
write.csv(politics,"politics.csv",row.names = FALSE)




words <- readLines("technology.txt",skipNul = T)
words <- str_split(words,",")
words <- as.character(words)


techno <- data.frame(names = c("Adobe", "Acrobat", "Reader", "ADSL", "Analogue", "Assistive", "technology", "Attachment", "Back-end", "Backward", "compatible", "Microsoft", "files", "invention", "AI", "artificial", "intelligence", "computer", "vision", "computer", "deep", "neural", "networks", "", "network", "", "communication", "", "optical", "fibre", "optical", "", "quantum", "", "statistics", "", "data", "science", "", "data", "", "science", "", "tech", "", "technology", "", "Bandwidth", "Bit", "Bluetooth", "byte", "Bookmark", 
                               "Boolean", "operators", "Boot", "reboot", "Bounce", "back", "hard", "disk", "email", "error", "sender", "web", "website", "address", "Broadband", "Browser", "mozilla", "Firefox", "Internet", "Explorer", "page", "refresh", "version", "cache", "update", "CAD", "Computer-aided", "design", "2D", "3D", "CPU", "Central", "", "Processing", "", "Unit", "speed", "cloud", "service", "icloud", "dropbox", "facebook", "", "apple", "", "iphone", "mac", "ios", "itunes", "android", "Chip", "microprocessor", "program", 
                               "drive", "python", "c++", "julia", "swift", "java", "javascript", "tensorflow", "tf", "pytorch", "GANs", "", "generative", "adversarial", "networks", "CNN", "", "RNN", "torchvision", "batch", "normalization", "geek", "developers", "data", "driven", "code", "cookie", "compression", "computing", "super", "computers", "brain", "mimic", "human", "weight", "input", "output", "cyber", "crimeunauthorised", "authorised", "cybersecurity", "domain", "device", "download", "hackers", "hack", "carsh", "server", 
                               "client", "software", "remote", "digital", "video", "analytics", "firewall", "trusted", "virus", "antivirus", "avast", "breach", "leak", "connections", "fttp", "ftp", "http", "https", "transfer", "protocol", "hyper-text", "text", "hyper", "markup", "language", "host", "user", "admin", "gateway", "gif", "graphics", "hdd", "application", "symbol", "hyperlink", "link", "interconnected", "electronic", "big", "", "bigdata", "hadoop", "pig", "hive", "apache", "spark", "ml", "dl", "cv", "nlp", "sentiment", 
                               "emotion", "isp", "intranet", "jpeg", "expert", "photos", "format", "lan", "local", "mb", "gb", "tb", "terabyte", "gigabyte", "megabyte", "mhz", "megahertz", "modem", "transmit", "information", "telephone", "lines", "online", "offline", "banking", "insurance", "os", "operating", "pdf", "portable", "phishing", "password", "email", "ppm", "printer", "ram", "random", "memory", "readonly", "resolution", "pixels", "image", "saas", "google", "amazon", "paytm", "paypal", "payment", "search", "engine", "database.commercial", 
                               "ssl", "third", "party", "encryption", "decryption", "confidnetial", "message", "seo", "optimization", "parallelization", "spam", "unsolicited", "unzip", "url", "viralwep", "wired", "privacy", "blog", "wifi", "wi-fi", "signal", "wirelesstripping", "archive", "compress", "gadgets", "bioscience", "healthcare", "technical", "technician", "nanotechnology", "cryogenics", "robotics", "boston", "dynamics", "engineer", "advanced", "helped", "texas", "giants", "new", "market", "ucla", "business", "micro", 
                               "titans", "atlanta", "big", "stanford", "miami", "marketing", "intel", "high", "arizona", "denver", "consumer", "improved", "usf", "industry", "technologies", "leading", "florida", "rebounding", "kansas", "makers", "chicago", "clemson", "tennessee", "manufacturers", "pseudoscience", "houston", "stocks", "cisco", "tools", "smart", "run", "drive", "usc", "hokies", "seattle", "york", "home", "tool", "equipment", "systems", "basketball", "dallas", "indianapolis", "corporate", "technique", "drives", "better", 
                               "american", "running", "michigan", "indiana", "baltimore", "focus", "midwest", "advantage", "center", "scientifically", "companies", "scientific", "phoenix", "record", "engineering", "game", "buying", "quarter", "booming", "longhorns", "cowboys", "syracuse", "firms", "up", "offense", "california", "whiz", "upgrade", "sales", "detroit", "chips", "key", "notebook", "neuroscience", "hydroscience", "engineering", "", "school", "polytechnic", "", "institute", "metrology", "cyberscience", "sociology", 
                               "climatology", "tribology", "biophysics", "organon", "bionanoscience", "alchemical", "superscience", "technoscience", "geology", "proscience", "bellwethers", "fortran", "bionics", "multiscience", "antiscience", "phrenology", "architectonics", "ergonomics", "scienceless", "systematics", "hydrodynamic", "alchemy", "epistemology", "microscopy", "theoretician", "interoperable", "psychology", "sciencelike", "geophysics", "cybernetics", "university", "optimization", "scientist", "nonscience", "interoperability", 
                               "geoscience", "mcscience", "limnology", "glycoscience", "physicist", "agronomy", "informatics", "radiography", "metaphysics", "physiology", "dendrohydrology", "physic", "physiology", "theorist", "developer", "environmental", "mathematician", "system", "aeronauticsoperator", "logistics", "astrophysics", "histology", "electrochemistry", "anthropology", "watercourse", "agrobiology", "biological", "modernize", "channel", "technoid", "ecological", "kinesiology", "biologist", "eco", "bio", "dynamic", "naturalist", 
                               "cartography", "electrical", "engineerriverine", "photoscience", "empiricism", "comparator", "specialize", "gerontology", "subroutine", "apply", "science", "canalisation", "methodology", "ecology", "startups", "biotech", "sci", "biomedical", "aerospace", "networking", "technologists", "automotive", "telecom", "techno", "hardware", "innovators", "semiconductor", "labs", "biz", "nerds", "biometrics", "telecommunications", "biomedicine", "futuristic", "cyber", "wireless", "robots", "brainiac", "innovation", 
                               "robotic", "incubator", "entrepreneurial", "darpa", "microelectronics", "pharma", "nano", "profile", "hipster", "laptops", "digital", "sbc", "aeronautic", "auto", "outsourcing", "academia", "futurism", "smartphone", "specialization", "cryptography", "evolution", "demography", "canal", "canalise", "mechanical", "electrotelegraphy", "geroscience", "biocomputing", "sociobiology", "neurophysics", "system", "science", "microphonics", "actinochemistry", "terotechnology", "exobiology", "cyberpsychology", 
                               "thanatology", "depolarize", "psychobiology", "macrophysics", "infostructure", "lifehack", "bioacoustics", "radiology", "chemical", "alchemize", "astrobiology", "scienticide", "transistorize", "cyberphilosophy", "cybertechnology", "scientific", "method", "biomed", "dotcom", "geek", "digerati", "gizmos", "techy", "technophile", "ungreen", "symbolics", "brainiacs", "brainpower", "thingamajigs", "grads", "enviro", "whizbang", "futurology", "gearhead", "micrographics", "turtlenecked", "highflier", "doodad", 
                               "photomicrography", "fanboy", "intrapreneur", "cogwheels", "dealmaking", "cryptology", "newfangled", "pricey", "social", "gimcracks", "scientific", "discipline", "cognitive", "formal", "software", "philosophy", "natural", "topic", "category", "scientific", "hard", "physic", "field", "of", "study", "history", "space", "technologybachelor", "quantum", "physic", "theory", "subject", "analysis", "civil", "physical", "logic", "letter", "security", "technological", "rocket", "exact", "life", "pure", "industrial", 
                               "", "art", "statistical", "", "mechanic", "natural", "philosophy", "affine", "transformation", "bucket", "evolutionary", "", "biology", "screen", "saver", "linear", "monkey", "patch", "transport", "good", "power", "seismic", "political", "science", "quantum", "mechanic", "scientist", "space", "dot", "com", "venture", "capital", "gee", "whiz", "cutting", "edge", "capitalist", "vacuum", "tube", "dean", "kamen", "ultrahigh", "frequency", "bridge", "river", "Popular", "Searches", "quantum", "quiet", 
                               "quick", "question", "quest", "quilting", "queer", "recycling", "rainfall", "religion", "reading", "royalty", "racism", "rainforest", "research", "resilience", "relationships", "safari", "science", "shopping", "sustainability", "sound", "summer", "snow", "school", "travel", "the", "ocean", "trees", "the", "sea", "the", "beach", "plants", "textiles", "universe", "unity", "underwater", "urban", "unique", "umbrella", "unicorn", "usa", "ugly", "unemployment", "vehicles", "volcano", "vikings", "vegetables", 
                               "vacation", "time", "warp", "atomic", "sub", "submarine", "nuclear", "nuke", "fire", "", "blast", "collider", "", "hydrogen", "ozone", "land", "cognitive", "agronomyformal", "scientificroger", "bacon", "cosmology", "theorist", "theoretician", "field", "of", "study", "thanatology", "skill", "information", "science", "technological", "pseudoscience", "climatology", "technical", "linguistics", "informatics", "biophysics", "alhazen", "society", "nature", "geoscience", "bioscience", "economics", "algebra", 
                               "professor", "academic", "applied", "sciences", "scientific", "knowledge", "astrophysics", "book", "of", "optics", "education", "literature", "biomedical", "metaphysics", "ptolemy", "exobiology", "curriculum", "scientific", "community", "ecology", "genetics", "astrobiology", "physiology", "mathematical", "logic", "psychobiology", "nanotechnology", "biochemistry", "witelo", "formal", "cause", "microbiology", "applied", "science", "heliocentrism", "empiricism", "robotics", "zoology", "evolution", "limnology", 
                               "molecular", "biology", "william", "whewell", "measure", "francis", "bacon", "physical", "law", "hypothesis", "consilience", "peer", "review", "statistics", "theory", "of", "relativity", "explanation", "predictions", "universe", "scientifically", "civilization", "concept", "ability", "subject", "nutrition", "field", "metallurgy", "cryptography", "discipline", "cryptanalysis", "bailiwick", "ip", "virtuosity", "nose", "verify", "tectonics", "control", "power", "parmenides", "socrates", "aristotle", 
                               "teleological", "antiscience", "actualization", "ethics", "multiscience", "proscience", "superscience", "technoscience", "scienceless", "phrenology", "bionanoscience", "sciencelike", "caliphate", "facts", "mahabhuta", "abbasid", "baghdad", "glycoscience", "iraq", "sciences", "mcscience", "cyberscience", "theories", "geophysics", "euclid", "institute", "studies", "alchemical", "scholasticism", "cryptanalytics", "strategics", "theoriser", "agrology", "theorizer", "cryptology", "idealogue", "phusis", 
                               "studying", "copernicus", "journalism", "electrochemistry", "almagest", "university", "galileo", "dogma", "arts", "harvard", "educational", "hypotheses", "photoscience", "graduate", "teaching", "mechanistic", "focuses", "physic", "tribology", "teaches", "chirality", "biologist", "hydroscience", "geography", "energy", "experiments", "organon", "potential", "expert", "theoretical", "phd", "archaeology", "physicist", "alchemy", "studied", "al-kindi", "learning", "thesis", "taught", "faculty", "logy", 
                               "art", "ology", "crystallography", "interdisciplinary", "nonscience", "creative", "analysis", "actinochemistry", "laboratory", "researcher", "lab", "yale", "academy", "work", "program", "epistemology", "focusing", "species", "history", "works", "comparative", "doctorate", "biologically", "princeton", "degree", "atoms", "institutes", "institution", "associate", "thermodynamics", "focus", "master", "ecological", "journal", "biological", "mathematical", "bio", "development", "based", "modern", "writing", 
                               "aspects", "atom", "berkeley", "innovation", "literary", "experimental", "doctoral", "subjects", "researchers", "perspective", "mathematician", "chemist", "undergraduate", "textbook", "concepts", "physical", "world", "sociobiology", "culture", "electron", "bachelor", "social", "sciences", "einstein", "polytechnic", "formal", "sciences", "atomism", "cryogenics", "see", "ic", "middle", "ages", "middle", "east", "biologic", "analytic", "antibiotic", "automobiles", "aircraft", "classical", "antiquity", 
                               "icbm", "osmosis", "western", "world", "naturalist", "reversibly", "ph.d.", "noncritical", "internet", "philosophy", "of", "science", "classical", "elements", "smartphone", "cytology", "hard", "science", "aerobiology", "physical", "laws", "embryology", "dimorphism", "apply", "science", "microscopy", "psychological", "reproducible", "kinesiology", "xenobiology", "modern", "era", "histology", "toxicology", "zoologist", "test", "geroscience", "modern", "science", "neurophysics", "causality", "ergonomics", 
                               "gerontology", "ancient", "greek", "biochemist", "school", "subject", "fact", "subject", "area", "subject", "field", "scientific", "agriculture", "psychological", "science", "information", "processing", "bioclimatology", "macrophysics", "hydrodynamic", "pre-socratic", "philosopher", "chemically", "letter", "and", "science", "cryobiology", "act", "x-ray", "radioactivity", "measurements", "bioacoustics", "arithmetic", "geometry", "final", "cause", "chemical", "physic", "trigonometry", "cosmochemistry", 
                               "exact", "science", "predict", "calculus", "political", "philosophy", "neurochemistry", "topology", "scienticide", "deductive", "reasoning", "quantum", "physic", "late", "antiquity", "system", "science", "early", "middle", "ages", "serology", "pharmacochemistry", "unreactive", "theorem", "isidore", "of", "seville", "formula", "chemo", "topic", "category", "byzantine", "empire", "syriac", "language", "axiom", "iatrochemistry", "macrochemistry", "thermochemistry", "metamathematics", "oleochemistry", 
                               "zymurgy", "house", "of", "wisdom", "photochemistry", "practicum", "apply", "mathematics", "cytochemistry", "femtochemistry", "phenomena", "glycochemistry", "piezochemistry", "islamic", "golden", "age", "histochemistry", "polyvalent", "monovalent", "ibn", "sahl", "immunochemistry", "ibn", "al-haytham", "palynology", "astrogeology", "toledo", "school", "of", "translators", "national", "science", "foundation", "phenomenon", "radiochemistry", "bachelor", "of", "science", "magnetochemistry", "rocket", 
                               "science", "eleatic", "falsifiable", "life", "science", "western", "europe", "nomenclature", "anticatalyst", "zoochemistry", "hellenistic", "civilization", "bivalent", "ibn", "abi", "usaibia", "meteoritics", "physical", "chemistry", "stoichiology", "geochronology", "allomerism", "john", "peckham", "logic", "four", "causes", "soil", "science", "johannes", "kepler", "technological", "university", "geocentric", "model", "science", "room", "renaissance", "chemical", "biology", "printing", "press", "rené", 
                               "descartes", "pure", "mathematics", "quantum", "mechanic", "csiro", "isaac", "newton", "gottfried", "leibniz", "newtonian", "physics", "aristotelian", "physics", "evolutionary", "biology", "actuality", "and", "potentiality", "john", "herschel", "oceanography", "botany", "meteorology", "paleontology", "archeology", "biomedicine", "bioengineering", "parasitology", "rocketry", "geosciences", "olympiads", "seismology", "genomics", "aeronautics", "palaeontology", "sci", "agriculture", "charles", "darwin", 
                               "on", "the", "origin", "of", "species", "political", "science", "descent", "with", "modification", "imprs", "l", "natural", "selection", "john", "dalton", "poetry", "statistical", "mechanic", "electromagnetic", "theory", "system", "theory", "computational", "chemistry", "state", "quantum", "mechanics", "policy", "artificial", "fertilizer", "population", "growth", "atomic", "energy", "nuclear", "power", "space", "biology", "space", "technology", "charles", "sanders", "peirce", "space", "race", "conicet", 
                               "nuclear", "arms", "race", "integrated", "circuits", "public", "policy", "communications", "satellite", "information", "technology", "csic", "mobile", "computing", "probability", "theory", "oecd", "earth", "science", "eo", "wilson", "organic", "chemistry", "universities", "mössbauer", "effect", "museology", "biometeorology", "primatology", "paleoclimatology", "neuropharmacology", "ufology", "biomimetics", "lysenkoism", "psychophysiology", "paleoecology", "glaciology", "biomathematics", "catastrophism", 
                               "teratology", "radiobiology", "sociolinguistics", "psycholinguistics", "paleobiology", "criminalistics", "pharmacognosy", "grantsmanship", "precalculus", "scientism", "ichthyology", "enigmatology", "formal", "system", "thought", "experiment", "newscientist", "nuclear", "chemistry", "occam's", "razor", "philosopher", "correlation", "does", "not", "imply", "causation", "cell", "theory", "particle", "physic", "politician", "scientific", "modeling", "design", "of", "experiments", "confirmation", "bias", 
                               "inoculation", "salmonella", "mohists", "number", "theory", "computational", "science", "society", "for", "industrial", "and", "applied", "mathematics", "electrons", "idealism", "consciousness", "compete", "human", "behavior", "rationalism", "descartes", "scientific", "law", "agree", "measurement", "methodology", "supernatural", "certainty", "fallacy", "rules", "skeptical", "authoritarian", "truth", "mythology", "magic", "religion", "ideology", "a", "priori", "and", "a", "posteriori", "newton's", 
                               "laws", "of", "motion", "fundamental", "science", "learned", "society", "accademia", "dei", "lincei", "academy", "of", "sciences", "royal", "society", "académie", "des", "sciences", "international", "council", "for", "science", "mass", "media", "united", "states", "centre", "national", "de", "la", "recherche", "scientifique", "max", "planck", "society", "deutsche", "forschungsgemeinschaft", "scientific", "literature", "scientific", "journal", "journal", "des", "sçavans", "philosophical", "transactions", 
                               "of", "the", "royal", "society", "inductivism", "united", "states", "national", "library", "of", "medicine", "scientific", "paper", "bayesianism", "comparative", "anatomy", "developmental", "psychology", "cognitive", "neuroscience", "gottfried", "wilhelm", "leibniz", "cognitive", "psychology", "quantum", "physics", "analytical", "chemistry", "particle", "physics", "differential", "calculus", "veterinary", "medicine", "inorganic", "chemistry", "celestial", "mechanics", "science", "magazine", "science", 
                               "&", "vie", "falsifiability", "scientific", "american", "science", "book", "science", "fiction", "falsificationism", "fallibilist", "fallibilism", "uniformitarianism", "instrumentalism", "royal", "literary", "fund", "christine", "ladd-franklin", "ludwig", "wittgenstein", "separate", "spheres", "research", "funding", "public", "works", "hundred", "schools", "of", "thought", "warring", "states", "period", "great", "britain", "the", "royal", "society", "united", "states", "national", "academy", "of", 
                               "sciences", "kaiser", "wilhelm", "institute", "capital", "equipment", "vannevar", "bush", "office", "of", "scientific", "research", "and", "development", "science", "", "technology", "and", "society", "developed", "country", "gross", "domestic", "product", "research", "and", "development", "basic", "science", "blue", "skies", "research", "nuclear", "fusion", "scientific", "debate", "beat", "reporter", "united", "kingdom", "mmr", "vaccine", "edwina", "currie", "battery", "cage", "john", "horgan", 
                               "chris", "mooney", "science", "outreach", "public", "awareness", "of", "science", "science", "communication", "science", "festival", "citizen", "science", "science", "journalism", "public", "science", "popular", "science", "template:science", "and", "the", "public", "stem", "fields", "scientific", "realism", "world", "view", "deductive", "logic", "karl", "popper", "hypothetico-deductive", "method", "critical", "rationalism", "trial", "and", "error", "keith", "stanovich", "observational", "studies", 
                               "appeal", "to", "authority", "non-overlapping", "magisteria", "methodological", "naturalism", "scientific", "creationism", "models", "of", "nature", "models", "of", "our", "universe", "john", "pecham", "demarcation", "problem", "imre", "lakatos", "scientific", "progress", "epistemological", "anarchism", "paul", "k", "feyerabend", "constructive", "empiricism", "interpretations", "of", "quantum", "mechanics", "critique", "of", "ptolemy", "affirming", "the", "consequent", "the", "advancement", "of", 
                               "learning", "scientific", "misconduct", "john", "ziman", "intersubjective", "verifiability", "applied", "research", "basic", "research", "rod", "cells", "night", "vision", "search", "and", "rescue", "cargo", "cult", "science", "richard", "feynman", "junk", "science", "fringe", "science", "fallacy", "of", "the", "single", "cause", "hyperbolic", "doubt", "barry", "stroud", "germ", "theory", "of", "disease", "relativity", "theory", "scientific", "skepticism"),type = "technology")

techno$names <- tolower(techno$names)
techno <- filter(techno,techno$names != "")
write.csv(techno,file = "technology.csv",row.names = FALSE)


glamour <- readLines("glamour.txt",skipNul = T)
glamour <- str_split(glamour[1],",")
glamour <- gsub(glamour,pattern = "[[:punct:]]",replacement = "")
glamour <- str_replace_all(glamour,pattern = " ",replacement = ",")
glamour <- str_split(glamour,",")
glamour <- as.character(glamour)
write(glamour,"glamour1.txt")

glamour <- data.frame(names = c("c12A", "", "animation", "", "animator", "", "best", "boy", "", "Bollywood", "", "boom", "", "box", "office", "", "cameraman", "", "camerawork", "", "can", "1", "", "canon", "", "celluloid", "", "CGI", "", "cinema", "", "cinemagoer", "", "cinematic", "", "cinematography", "", "clapperboard", "", "clip", "", "closeup", "", "computergenerated", "imagery", "", "continuity", "", "counterprogramming", "", "credit", "", "double", "feature", "", "extra", "fade", "film", "", "filmstar", "", "filmgoer", 
                                "", "filmgoing", "", "filmic", "", "filming", "", "filmstrip", "", "flick", "", "footage", "", "frame", "", "franchise","freeze", "frame", "", "gaffer", "", "Hollywood", "", "IMAX", "", "in", "the", "can", "idiom", "", "kinetoscope", "", "location", "", "lot", "", "magic", "lantern", "", "mockumentary", "", "motion", "picture", "", "movie", "", "moviegoer", "", "moviegoing", "", "outtake", "", "pan", "", "premiere", "", "project", "", "projection", "", "projector", "", "Rambo", "", "reel", 
                                "", "release", "", "remake", "", "rerelease", "", "retake", "", "retcon", "", "run", "", "screen", "", "screening", "", "screenplay", "sequence", "", "shoot", "", "shot", "", "show", "", "showing", "", "slapstick", "", "slide", "projector", "", "slow", "motion", "sound", "effect", "", "soundtrack", "", "still", "", "sting", "", "storyboard", "", "studio", "", "stunt", "", "subtitle", "", "take", "", "technicolor", "", "the", "big", "screen", "1", "", "the", "silver", "screen", "", "timelapse", 
                                "", "title", "", "track", "", "viewing", "", "zoetrope", "", "act", "", "act", "5th", "out", "", "acting", "", "amateur", "dramatics", "", "amateur", "theater", "", "appear", "", "appearance", "", "be", "on", "the", "stage", "idiom", "", "camp", "", "camp", "it", "up", "", "costar", "", "come", "", "come", "on", "", "debut", "", "dumb", "show", "", "enact", "", "entrance", "1", "", "go", "on", "the", "stage", "idiom", "", "greasepaint", "ham", "", "ham", "it", "up", "", "hammy", "", "improvisation", 
                                "", "improvise", "", "interpret", "", "interpreter", "", "live", "live", "action", "", "method", "acting", "", "mime", "", "offstage", "", "overact", "", "pantomime", "", "performative", "", "play", "", "portrayal", "", "prompt", "", "reenact", "reenactment", "", "rep", "", "repertory", "", "rest", "", "stage", "", "stage", "fright", "", "stage", "whisper", "", "stagestruck", "", "star", "stardom", "", "star", "turn", "", "stretch", "", "tread", "", "tread", "the", "boards", "idiom", "", "understudy", 
                                "", "variety", "", "walkthrough", "", "SRK", "", "shahrukh", "khan", "hrithik", "roshan", "", "salman", "khan", "", "urvashi", "rautela", "", "bebo", "", "karina", "", "taimur", "saif", "ali", "khan", "", "sara", "ali", "khan", "", "sara", "", "kartik", "aaryan", "", "sartik", "", "ananya", "pandey", "", "divorce", "", "divorced", "", "sexy", "", "hot", "", "oops", "", "saree", "", "upcoming", "action", "", "drama", "", "scifi", "", "romance", "", "melody", "", "song", "songs", "", "akshay", 
                                "kumar", "", "mouni", "roy", "kgf", "bahubali", "tiger", "shroff", "", "vidyut", "", "vfx", "soty", "soty2", "", "alia", "bhatt", "", "varun", "dhawan", "boney", "kapoor", "ranbir", "kappor", "", "ranbir", "ranveer", "singh", "", "ranveer", "deepkia", "padukone", "", "kalank", "", "sonakshi", "sinha", "", "sonakshi", "john", "abraham", "celebs", "", "celebrity", "fame", "janhavi", "kapoor", "trending", "", "date", "", "affairs", "love", "", "couple", "", "marraige", "", "married"),type = c("glamour"))
glamour <- filter(glamour,glamour$names != "")
glamour$names <- tolower(glamour$names)

write.csv(glamour,"glamour.csv",row.names = F)

cuisine <- readLines("cuisine.txt")
cuisine <- str_split(cuisine," ")
cuisine <- unlist(cuisine)
cuisine <- str_to_lower(cuisine)
cuisine <- cuisine[cuisine != "a"]
cuisine <- data.frame(words = cuisine, type = c("cuisine"))
cuisine <- cuisine[cuisine$words != ""]
cuisine$words <- trimws(cuisine$words)
cuisine <- cuisine[!is.null(cuisine$words)]

vcsCmnWords <- c("all","also","and","any","are","but","can","cant","cry","due",
                 "etc","few","for","get","had","has","hasnt","have","her","here",
                 "hers","herself","him","himself","his","how","inc","into","its",
                 "ltd","may","nor","not","now","off","once","one","only","onto",
                 "our","ours","out","over","own","part","per","put","see","seem",
                 "she","than","that","the","their","them","then","thence","there",
                 "these","they","this","those","though","thus","too","top","upon",
                 "very","via","was","were","what","when","which","while","who","whoever",
                 "whom","whose","why","will","with","within","without","would","yet",
                 "you","your","yours","the","from","a","aa","of","it's","it","is","was","were")
cuisine <- filter(cuisine,!(words %in% vcsCmnWords))
write.csv(cuisine,file = "cuisine.csv",row.names = F)



technology <- read.csv("technology.csv")
technology <- filter(technology,!(names %in% vcsCmnWords))
write.csv(technology,file = "technology.csv",row.names = F)

glamour <- read.csv("glamour.csv")
glamour <- filter(glamour,!(names %in% vcsCmnWords))
write.csv(glamour,file = "glamour.csv",row.names = F)

politics <- read.csv("politics.csv")
politics <- filter(politics , !(names %in% vcsCmnWords))
write.csv(politics,file = "politics.csv",row.names = F)




data <- read.csv("word_data.csv")
data$words <- str_replace_all(data$words,pattern = "[[:digit:]]","")
data <- filter(data,data$words != "")
data <- filter(data, !(words %in% vcsCmnWords))
write.csv(data,"word_data.csv",row.names = F)

national <- readLines("international.txt")
national <- str_split(national,"\t")
national <- unlist(national)
national <- str_split(national," ")
national <- unlist(national)
national <- str_split(national,",")
national <- unlist(national)
national <- tolower(national)
national <- unlist(national)

national <- data.frame(words = national, type = c("International News"))
national$words <- str_replace_all(national$words,pattern = "[[:digit:]]","")
national$words <- str_replace_all(national$words,pattern = "---","")
national$words <- str_replace_all(national$words,pattern = "[[:punct:]]","")

national <- filter(national,national$words != "")
write.csv(national,"international.csv",row.names = F)

sport <- readLines("sports.txt")
sport <- str_split(sport, " ")
sport <- unlist(sport)
sport <- tolower(sport)
sport <- str_replace_all(sport ,pattern = "[[:digit:]]","")
sport <- str_replace_all(sport ,pattern = "[[:punct:]]","")
sport <- str_replace_all(sport, pattern = "[~@#$%&-_=<>]","")
sport <- unlist(sport)

sport <- data.frame(words = sport,type = c("sport"))
sport <- filter(sport,str_length(words) > 2)

sport <- filter(sport,words != "")
write.csv(sport,"sports.csv")


## Final word_data cleaning
word_data <- read.csv("word_data.csv",header = T)
word_data <- word_data[!duplicated(word_data$words),]
write.csv(word_data,"word_data1.csv",row.names = F)




