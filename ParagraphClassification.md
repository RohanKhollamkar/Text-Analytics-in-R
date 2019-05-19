Article Classification
================
Rohan Khollamkar
7 April 2019

**Library**

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(stringr)
library(ggplot2)
```

    ## Registered S3 methods overwritten by 'ggplot2':
    ##   method         from 
    ##   [.quosures     rlang
    ##   c.quosures     rlang
    ##   print.quosures rlang

**Load a text
    paragraph**

``` r
words <- readLines("cybersecurity blog.txt")
```

    ## Warning in readLines("cybersecurity blog.txt"): incomplete final line found
    ## on 'cybersecurity blog.txt'

``` r
head(words)
```

    ## [1] "On Wednesday, Denver-based deepwatch announced it has secured $23 million in a Series A funding round. The cybersecurity provider will use the sizable Series A to fuel research and development, as well as to expand its market reach."                                                                                                                             
    ## [2] ""                                                                                                                                                                                                                                                                                                                                                                     
    ## [3] "“We’ve been doubling in size since starting in 2015, going from a startup to 130 employees and over 100 customers — many of them blue chip companies,” said Chief Financial Officer Ron Peele. “We expect that growth rate to continue.”Deepwatch uses a combination of software and in-house cybersecurity expertise to help companies protect their digital assets."
    ## [4] ""                                                                                                                                                                                                                                                                                                                                                                     
    ## [5] "“A lot of what we do is detection. We look through the data, in the form of logs, to see what activity is happening with our customers’ digital assets,” said Peele. “From that activity, we do machine learning that helps us identify patterns and threats. From what we learn from that, we can alert someone or take corresponding action.”"                      
    ## [6] ""

**make a vector of words**

``` r
vcsWords <- str_split(words, pattern = " ")
vcsWords <- unlist(vcsWords)
head(vcsWords,10)
```

    ##  [1] "On"           "Wednesday,"   "Denver-based" "deepwatch"   
    ##  [5] "announced"    "it"           "has"          "secured"     
    ##  [9] "$23"          "million"

**Clean all words**

``` r
# convert to lower-case
vcsWords <- str_to_lower(vcsWords)

# remove punctuations
vcsWords <- str_replace_all(vcsWords,pattern="[[:punct:]]", "")

# remove numbers
vcsWords <- str_replace_all(vcsWords,pattern="[[:digit:]]", "")

# remove spaces
vcsWords <- str_replace_all(vcsWords,pattern="[[:space:]]", "")

# remove special chars
vcsWords <- str_replace_all(vcsWords,pattern="[~@#$%&-_=<>]", "")

# filter out null values
vcsWords <- vcsWords[vcsWords != ""]

head(vcsWords,100)
```

    ##   [1] "on"                "wednesday"         "denverbased"      
    ##   [4] "deepwatch"         "announced"         "it"               
    ##   [7] "has"               "secured"           "million"          
    ##  [10] "in"                "a"                 "series"           
    ##  [13] "a"                 "funding"           "round"            
    ##  [16] "the"               "cybersecurity"     "provider"         
    ##  [19] "will"              "use"               "the"              
    ##  [22] "sizable"           "series"            "a"                
    ##  [25] "to"                "fuel"              "research"         
    ##  [28] "and"               "development"       "as"               
    ##  [31] "well"              "as"                "to"               
    ##  [34] "expand"            "its"               "market"           
    ##  [37] "reach"             "weve"              "been"             
    ##  [40] "doubling"          "in"                "size"             
    ##  [43] "since"             "starting"          "in"               
    ##  [46] "going"             "from"              "a"                
    ##  [49] "startup"           "to"                "employees"        
    ##  [52] "and"               "over"              "customers"        
    ##  [55] "many"              "of"                "them"             
    ##  [58] "blue"              "chip"              "companies"        
    ##  [61] "said"              "chief"             "financial"        
    ##  [64] "officer"           "ron"               "peele"            
    ##  [67] "we"                "expect"            "that"             
    ##  [70] "growth"            "rate"              "to"               
    ##  [73] "continuedeepwatch" "uses"              "a"                
    ##  [76] "combination"       "of"                "software"         
    ##  [79] "and"               "inhouse"           "cybersecurity"    
    ##  [82] "expertise"         "to"                "help"             
    ##  [85] "companies"         "protect"           "their"            
    ##  [88] "digital"           "assets"            "a"                
    ##  [91] "lot"               "of"                "what"             
    ##  [94] "we"                "do"                "is"               
    ##  [97] "detection"         "we"                "look"             
    ## [100] "through"

**make dataframe of words**

``` r
word.frame <- data.frame(words = vcsWords)
#word.frame$words <- as.character(words)
head(word.frame,10)
```

    ##          words
    ## 1           on
    ## 2    wednesday
    ## 3  denverbased
    ## 4    deepwatch
    ## 5    announced
    ## 6           it
    ## 7          has
    ## 8      secured
    ## 9      million
    ## 10          in

**Calculate frequency of words**

``` r
word.frame <- word.frame%>% 
              group_by(words)%>% 
              summarise(Freq = n())%>%
              arrange(desc(Freq))
head(word.frame)
```

    ## # A tibble: 6 x 2
    ##   words  Freq
    ##   <fct> <int>
    ## 1 to       16
    ## 2 a        14
    ## 3 the      14
    ## 4 and      12
    ## 5 of       10
    ## 6 we        9

**make a word
cloud**

``` r
library(wordcloud)
```

    ## Loading required package: RColorBrewer

``` r
wordcloud(word.frame$words[1:100],freq = word.frame$Freq[1:100],random.order = F,max.words = 100,
          colors = brewer.pal(8,"Dark2"))
```

![](ParagraphClassification_files/figure-gfm/word_cloud-1.png)<!-- -->

**Only important words to keep**

``` r
# words with letter more than 2
word.frame <- filter(word.frame,str_length(words) > 2)
# remove stop_words
cmnwords <- c("all","also","and","any","are","but","can","cant","cry","due",
                 "etc","few","for","get","had","has","hasnt","have","her","here",
                 "hers","herself","him","himself","his","how","inc","into","its",
                 "ltd","may","nor","not","now","off","once","one","only","onto",
                 "our","ours","out","over","own","part","per","put","see","seem",
                 "she","than","that","the","their","them","then","thence","there",
                 "these","they","this","those","though","thus","too","top","upon",
                 "very","via","was","were","what","when","which","while","who","whoever",
                 "whom","whose","why","will","with","within","without","would","yet",
                 "you","your","yours","the","from","a","aa","of","it's","it","is","was","were")

word.frame <- filter(word.frame,!(words %in% cmnwords))

abusive.words <- c("arse","ass","asshole","bastard","bitch","bloody","bollocks","child-fucker","cunt","damn","fuck","goddamn","godsdamn","hell","motherfucker","shit","shitass","whore")

word.frame <- filter(word.frame,!(words %in% abusive.words))

head(word.frame,10)
```

    ## # A tibble: 10 x 2
    ##    words          Freq
    ##    <fct>         <int>
    ##  1 said              6
    ##  2 cybersecurity     5
    ##  3 assets            4
    ##  4 companies         4
    ##  5 deepwatch         4
    ##  6 peele             4
    ##  7 customers         3
    ##  8 denver            3
    ##  9 funding           3
    ## 10 protect           3

**summarise again on frequency of words**

``` r
word.frame <- word.frame %>%
              arrange(desc(Freq))

head(word.frame,10)
```

    ## # A tibble: 10 x 2
    ##    words          Freq
    ##    <fct>         <int>
    ##  1 said              6
    ##  2 cybersecurity     5
    ##  3 assets            4
    ##  4 companies         4
    ##  5 deepwatch         4
    ##  6 peele             4
    ##  7 customers         3
    ##  8 denver            3
    ##  9 funding           3
    ## 10 protect           3

**remove words with less frequency**

``` r
word.frame <- filter(word.frame,Freq > 1)
tail(word.frame)
```

    ## # A tibble: 6 x 2
    ##   words       Freq
    ##   <fct>      <int>
    ## 1 operations     2
    ## 2 reach          2
    ## 3 recruit        2
    ## 4 series         2
    ## 5 want           2
    ## 6 where          2

**word cloud of new
dataframe**

``` r
wordcloud(word.frame$words,freq = word.frame$Freq,random.order = F,max.words = 100,
          colors = brewer.pal(8,"Dark2"))
```

![](ParagraphClassification_files/figure-gfm/new_word_cloud-1.png)<!-- -->

**load the file with words and their
categories**

``` r
catgryWords <- read.csv("word_data1.csv",header = T,stringsAsFactors = F)
head(catgryWords)
```

    ##       words    type
    ## 1 animation glamour
    ## 2  animator glamour
    ## 3      best glamour
    ## 4       boy glamour
    ## 5 bollywood glamour
    ## 6      boom glamour

**categorizing frparagraph**

``` r
high.freqwords <- as.character(word.frame$words)

matches <- catgryWords[catgryWords$words %in% high.freqwords, ]
matches
```

    ##              words               type
    ## 346  cybersecurity         technology
    ## 357        digital         technology
    ## 504         denver         technology
    ## 550      companies         technology
    ## 785       security         technology
    ## 1358       funding         technology
    ## 1402      critical         technology
    ## 2485          said International News

``` r
matches <- matches %>% group_by(type)%>%summarise(freq = n())%>%arrange(desc(freq))
matches
```

    ## # A tibble: 2 x 2
    ##   type                freq
    ##   <chr>              <int>
    ## 1 technology             7
    ## 2 International News     1

``` r
print(paste("paragraph belongs to ",as.character(matches[1,1]),"catageory"))
```

    ## [1] "paragraph belongs to  technology catageory"

\*\*
