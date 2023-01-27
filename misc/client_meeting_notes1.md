Questions for Client:
1. How was the dynamic group of 48 dairy cows chosen?
Initially a study for legs. Every 2 weeks we took 5 cows out of the dynamic group and added 5 new cows, which forms multiple stable groups. Only the healthy cows were kept in the group. It’s possible for cows to leave and then come back.
2. What linear models were used for the initial analysis that identified the seasonal difference in daily replacements at the water and feed bins?
Not sure about this, need some more clarification.
2 explanations: 
As temp increases, there would be more replacement in water bins because cows are thirsty. As THI increases, replacements become more frequent. 
3. Does the time in variable mean the number of replacements?


—------- about the dataset—-------------
4. How should we calculate the cows’ dominance scores, since it was not in the dataset?
Calculate based on Elo Rating for both water bin and feed bin replacements and compare relative hierarchy. The second approach is that group THI into two groups (low THI and high THI) and compare separately for both the water bin and feed bin. The threshold is suggested to be 75, but it depends on the amount of data in each group. The number of replacements needs to be at least 15-20 times the number of cows we have for Elo Rating to work. Calculate the number of replacements based on the number in each bucket (need to worry about this for the water bin groups).  The flattening phenomenon would be more obvious between high THI and low THI groups for the water bin. Cows normally stop eating when THI is too high.
5. What is the Bout_interval, and hour in the dataset? What does it represent?
The time interval between the reactor cow left and the actor cow came in. As long as the time interval is less than or equal to 26 seconds, we record it as a replacement behaviour. Each cow has an ear tag attached and a reader would record near bins. 
6. We noticed there are around 180000 rows with no bin type recorded, should we eliminate those rows, or are they meaningful to use for our research question?
Turned out to be an excel display problem.


7. What are the potential confounding variables? Is it possible that the gender of dairy cows causes some interactions observed?
Driven by hunger, thirst, and many other things, but the most important thing is the dominance hierarchy. Thus this is more like an observational study rather than experiments. When fresh feed arrives, everyone is motivated to eat not because of dominance. More meaningful replacements happen when there are abundant food resources.


About the study:
- comparing between feed bin and water bin
- A replacement happens when cow A originally ate at a certain feed bin, then cow B came over and took the position
- tropical area (above 45 degrees), humans would experience heat stress, while 38 degrees is hot enough for cows to experience the same


Client’s hypothesis: As THI increases, the dominance hierarchy would become flatter.


Dominance calculation: 
A package to rank players used for chess games: Elo Rating
example:
Cow A vs Cow B
if Cow B wins, cow B + 10, cow A - 10


For this study, the algorithm is a bit more complicated in a way that predicted wins would add less score to the winning cow and vice versa.
The graph would have segments starting at an Elo Rating of 1000 at any time.
- one way to pick the date (?) is to make sure we have a sufficient number of replacements (15-20 times the number of cows)


Reformatted research question:
Under different THI levels, compare the dominance hierarchy for cattle between water bins and feed bins.


More questions for Bianca via email discussion:
- Bout interval is not involved in the dominance calculation. Is it related to the hypothesis? (As THI increases, bout interval might be shorter)
- There are 3 THI variables in the dataset, do we need to consider all of them? (Sky said we can just use the THI_mean but need some clarification from Bianca)
- For cows that come back after leaving, the dominance score might be kept. This can be both good and bad, but it only happens for 2 or 3 out of 159 cows. Do we need to pay extra attention to it?



