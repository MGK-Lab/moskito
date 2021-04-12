ms = 7;

Point(1) = {0, 0, 0, ms};
Point(2) = {0, 0, -50, ms};
Point(3) = {0, 0, -1600, ms};
Point(4) = {0, 0, -4000, ms};

Point(5) = {0, 0, -4007, ms};
Point(6) = {30, 0, -4070, ms};
Point(7) = {100, 0, -4100, ms};

Point(8) = {107, 0, -4100, ms};
Point(9) = {220, -280, -4100, ms};
Point(10) = {500, -400, -4100, ms};

Point(11) = {507, -400, -4100, ms};
Point(12) = {560, -540, -4100, ms};
Point(13) = {700, -600, -4100, ms};

Point(14) = {707, -600, -4100, ms};
Point(15) = {730, -670, -4100, ms};
Point(16) = {800, -700, -4100, ms};

Point(17) = {4000-800, -700, -4100, ms};
Point(18) = {4000-730, -670, -4100, ms};
Point(19) = {4000-707, -600, -4100, ms};

Point(20) = {4000-700, -600, -4100, ms};
Point(21) = {4000-560, -540, -4100, ms};
Point(22) = {4000-507, -400, -4100, ms};

Point(23) = {4000-500, -400, -4100, ms};
Point(24) = {4000-220, -280, -4100, ms};
Point(25) = {4000-107, 0, -4100, ms};

Point(26) = {4000-100, 0, -4100, ms};
Point(27) = {4000-30, 0, -4070, ms};
Point(28) = {4000-0, 0, -4000, ms};

Point(29) = {4000, 0, -1600, ms};
Point(30) = {4000, 0, -50, ms};
Point(31) = {4000, 0, 0, ms};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
BSpline(4) = {5, 6, 7};
BSpline(5) = {8, 9, 10};
BSpline(6) = {11, 12, 13};
BSpline(7) = {14, 15, 16};
Line(8) = {16, 17};
BSpline(9) = {17, 18, 19};
BSpline(10) = {20, 21, 22};
BSpline(11) = {23, 24, 25};
BSpline(12) = {26, 27, 28};
Line(13) = {28, 29};
Line(14) = {29, 30};
Line(15) = {30, 31};

Physical Point("inlet") = {1};
Physical Point("inlet_do") = {5};
Physical Point("inlet_se") = {8};
Physical Point("inlet_ch") = {11};
Physical Point("inlet_pa") = {14};
Physical Point("inlet_shi") = {20};
Physical Point("inlet_haf") = {23};
Physical Point("inlet_hash") = {26};

Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("horizontal") = {4,5,6,7,8,9,10,11,12};
Physical Line("right_vertical_down") = {13};
Physical Line("right_vertical_bet") = {14};
Physical Line("right_vertical_up") = {15};
