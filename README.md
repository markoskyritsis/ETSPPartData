# ETSPPartData

-Description-

Human trials in the Euclidean Travelling Salesman Problem. There are a total of 188 participants and 15 graphs with an incrementing number of nodes (from 10 to 50, incrementing by 10, three graphs for each group). Collected by Dr Markos Kyritsis, Dr Stephen Gulliver, and Dr Eva Feredoes.
The data was collected using random sampling in an interactive web-based experiment in 2016. Participants were asked to 'connect the dots' in the Euclidean variant of the travelling salesman problem in order to find the shortest possible tour. The starting node, or 'city' was fixed for each graph, and participants could only visit each city once before returning back to their home city.
The data is meant as supplementary material for the paper: "Kyritsis M., Gulliver, S., & Feredoes E., Acknowledging Violations of the Crossing-Avoidance Heuristic When Solving the Eucledian Travelling Salesman Problem (publication target TBA)". Although we are making this data available to the community in an effort to increase interest and awareness in this research area.

Some source code in R will also be released here periodically. The ultimate aim is to create algorithms that mimic the human approach to problem solving the ETSP and run in linear time [O(n)], just like human performance.

-Variables in csv file-

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

--sdDist
Standard Deviation of the distance travelled between cities

--meanDist
Mean distance travelled between cities

--crossError
Presence of crossing-avoidance error (0 = no, 1 = yes)

--resultsfromNN
The tour cost of the graph using the Nearest Neighbour approach
