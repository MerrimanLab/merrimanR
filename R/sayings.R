# A collection of saysing to provide humour

# a fun function to return common sayings
just <- function(){
  sayings = c("Just...",
              "Just quickly...",
              "You should be able to just...",
              'Could you just...',
              "Just add in...",
              "Are you able to just...",
              "why don't you just...",
              "What happens if you just...")
  print(sample(sayings,size = 1))
}


# returns common trouble shooting advice
trouble_shooter <- function(){
  sayings = c("Have you tried turning it off and on again",
              "What happens when you change X?",
              "Are you out of ram?",
              "Close some tabs",
              "Are you missing a bracket?",
              "Is it out of HWE?",
              "Is it in LD?",
              "Coffee time!",
              "Did you call it something different?",
              "Did you save it somewhere else?",
              "Is this the right version?",
              "Does your variable contain what you think it does?",
              "Is your variable empty?",
              "What genome build are you using?",
              "0 or 1 based indexing?"
  )
  print(sample(sayings, size = 1))
}
