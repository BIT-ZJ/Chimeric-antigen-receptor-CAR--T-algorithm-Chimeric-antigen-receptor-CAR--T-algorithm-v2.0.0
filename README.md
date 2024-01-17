Operation hardware: 11th Gen Intel (R) Core (TM) i7-11800H @ 2.30GHz with 16.0GB RAM.

Operation software: MATLAB R2021a.

%%
This repository contains five files, namely the Code1.m, body1.m, Code2.m, body2.m, and GenerateSmoothPath.m.

(1) Code1.m and body1.m are used to obtain the Fig. 3, Fig. 4, and Table 1 in the paper "A nature inspired intelligent algorithm for a fundamental search problem". 

To run the Code1.m, you can get the result figures of search paths (maps 1-6), the excel table of search distance (Searchdistance.xls), and the excel table of search time (Searchtime.xls).

(2) Code2.m and body2.m are used to obtain the Fig. 5 in the paper "A nature inspired intelligent algorithm for a fundamental search problem". 

To run the Code2.m, you can get the result figures of convergence curves (maps 1-6).

%%
Note that all the above results are repeated 20 times. The final results shown in the paper are the optimal search results of 20 repetitions. 

In the above excel tables, the 6 rows correspond to maps 1-6. The 20 columns correspond to 20 repetitions.

From the result figures of convergence curves, you can find that the proposed algorithm in the paper can basically guarantee consistent convergence results over multiple repetitions.

GenerateSmoothPath.m is used for smoothing paths.

%%
Acknowledgements：

The "https://github.com/herryCccc/Mobile-robot-path-planning.git" and "https://github.com/danielesartori/3D-grid-path-planning.git" are read for reference.
