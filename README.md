# ETSPPartData

-Description-
There are two csv files being made available to the public. The first contains results from human trials in the Euclidean Travelling Salesman Problem. There are a total of 188 participants and 15 graphs with an incrementing number of nodes (from 10 to 50, incrementing by 10, three graphs for each group). The data is meant as supplementary material for the paper: "Kyritsis M., Gulliver, S., & Feredoes E., Acknowledging Violations of the Crossing-Avoidance Heuristic When Solving the Eucledian Travelling Salesman Problem (publication target TBA)". We are making this data available to the community in an effort to increase interest and awareness in this research area.

The second contains the average tour costs and crossings in 15 trials for 101 participants, as well as the participants' Sense of Direction and Conscientiousness scores. The two factors were shown to correlate, and when PCA was used to reduce them to one latent variable they appeared to predict a small to medium variance of crossing violations. The work is meant as supplementary material for the paper: Kyritsis, M., Blathras, G., Gulliver, S. & Varela, V. Sense of Direction and Conscientiousness as Predictors of Crossing-Avoidance Violations when solving the Euclidean Travelling Salesman Problem (publication target TBA). Again we are releasing the data to the public to increase interest and awareness in the area.

The data was collected using random sampling in two interactive web-based experiments in 2016. Participants were asked to 'connect the dots' in the Euclidean variant of the travelling salesman problem in order to find the shortest possible tours. The starting node, or 'city' was fixed for each graph, and participants could only visit each city once before returning back to their home city.

Some source code in R will also be released here periodically. The ultimate aim is to create algorithms that mimic the human approach to problem solving the ETSP and have a complexity close to linear time [O(n)]. We are currently creating an algorithm inspired by cognitive approaches that appears to produce good results and tends to avoid crossings.



-Variables in csv file for 1st paper-

--graphID
Unique ID for each graph (from 0 to 14)

--participantID
Unique ID for each participant

--xCoordTour
x-coordinates of the cities travelled, in order.

--yCoordTour
y-coordinates of the cities travelled, in order.

--tourCost
Total cost of the tour.

--sdAnglesHull
Standard Deviation of the internal angles of the hull

--noAnglesHull
Number of hull points

--meanAnglesHull
Mean of the internal angles of the hull

--totalEdges
Total number of cities

--crossError
Presence of crossing-avoidance error (0 = no, 1 = yes)

--No.Cross
Number of crossings (1, 2, >2)

--onLast
If there was one crossing, was it on the last route returning to the starting node?
