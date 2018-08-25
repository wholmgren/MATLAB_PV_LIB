addpath('../')

% set up input data (same as pvlib python)

SunZen = [89.9, 80, 0]


%% Test simple Matlab
AM = pvl_relativeairmass(SunZen, 'simple')
Expected = [572.9581    5.7588    1.0000]
assert(all(abs(AM - Expected) < 0.001))

%% Test simple matlab against python
AM = pvl_relativeairmass(SunZen, 'simple')
Expected = [572.958,   5.759,   1.000]
assert(all(abs(AM - Expected) < 0.001))

%% Test youngirvine1967 Matlab
AM = pvl_relativeairmass(SunZen, 'youngirvine1967')
Expected = [-2.251358367165932e+05,   5.5365,    1.0000]
assert(all(abs(AM - Expected) < 0.001))

%% Test youngirvine1967 matlab against python
AM = pvl_relativeairmass(SunZen, 'youngirvine1967')
Expected = [-2.251358367165932e+05, 5.5365, 1.0000]
assert(all(abs(AM - Expected) < 0.001))