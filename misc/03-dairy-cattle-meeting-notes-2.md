---
editor_options: 
  markdown: 
    wrap: sentence
---

-   Might need more detailed time stamps to clarify within-hour orders (perhaps specifically to the minute)
-   The original dataset has the minute time stamp but the client dropped it when they provided it to us.
    -   Another way - randomize Elo-rating (r package).

        -   Problem: randomize everything, having the cow show up later in time to interact with cows in the prev time.
            (cows would interact with each other in a different dynamic group)

        -   Shuffle the data manually for replacements within the dates.

        -   Results from the randomized Elo ratings should be similar to the results from classic Elo-ratings.
            Since the time lapse is longer, then the effect of the order should be less.

    -   The client wants to see what dates are included in each subgroup.

    -   May need to further investigate the result for high/low THI, such as creating some visualizations over the entire data collection period to show how the cow's dominance score is flattened.

    -   Use the Elo-steepness package to investigate the flatness of dominance hierarchy.

        -   This package uses the bayesian method -- gives you the probability distribution of the dominance of each cow.
            Each of the hills is a cow.
            For example, for the graph created for the high THI group.
            It may have a shallower hierarchy in which all the probability distributions of cows are clustered together.
-   A different approach such as Neural Network may not be feasible.
-   Are clients satisfied with using 65 as the THI level?
    -   They still prefer to have a THI threshold of around 75.
        They confirmed that as long as the number of replacements in each group is at least 10 times the number of cows, then we could run the Elo algorithm with confidence.

    -   Clients supposed that high THI cases/replacements happens usually on the same time period.
        So maybe we could restrict your time frame so that we have fewer cows in the group.
-   Client's questions:
    -   Did you use the same number of replacements (same pair-wise interactions between cows) in the spearsman correlation test?

    -   why do you optimize K?

        -   Rank reversal might be observed in a larger dataset because of the size.

        -   Sample with the same replacements in each group to compare apple to apple (But using the same K).

        -   Our clients want to exclude the peak time competition, which is when the feed bin has fresh food and cows are naturally more competitive.

        -   Sub-sample from the feed bin data based on the water bin.

        -   As long as the standard is met.
            It's ok to subset the replacements (10-20 \* \# of replacements).

    -   The ultimate goal: at the end of the day, we want to tell the farmers, to reflect on who's more dominant and who more subsist.

        -   compare ranks -- which is what we already know.

    -   The client wants to know how much data we need to collect in the water bin to have an equal comparison.
        (water bin may take more time to collect the data).
