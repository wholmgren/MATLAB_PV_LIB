addpath('../')

% set up input data (same as pvlib python)

SurfTilt = 40
SurfAz = 180
irrad_data = [   0.        ,    0.        ,    0.        ;
           79.73860422,  316.1949056 ,   40.46149818;
         1042.48031487,  939.95469881,  118.45831879;
          257.20751138,  646.22886049,   62.03376265]
GHI = irrad_data(:, 1).'
DNI = irrad_data(:, 2).'
DHI = irrad_data(:, 3).'
HExtra = [1321.1655834833093, 1321.1655834833093, 1321.1655834833093, 1321.1655834833093]
ephem_data = [124.0390863 , 124.0390863 , -34.0390863 , -34.0390863 , 352.69550699,  -2.36677158;
          82.85457044,  82.97705621,   7.14542956,   7.02294379, 66.71410338,  -2.42072165;
          10.56413562,  10.56725766,  79.43586438,  79.43274234, 144.76567754,  -2.47457321;
          72.41687122,  72.46903556,  17.58312878,  17.53096444, 287.04104128,  -2.52831909]
SunZen = ephem_data(:, 1).'
SunAz = ephem_data(:, 5).'




%% Test Hay Davies Matlab
SkyDiffuse = pvl_haydavies1980(SurfTilt, SurfAz, DHI, DNI, HExtra, SunZen, SunAz)
Expected = [         0
   27.1775
  102.9949
   33.1909]
assert(all(abs(SkyDiffuse - Expected) < 0.0001))

%% Test Hay Davies matlab against python
SkyDiffuse = pvl_haydavies1980(SurfTilt, SurfAz, DHI, DNI, HExtra, SunZen, SunAz)
Expected = [0., 14.967008, 102.994862, 33.190865].'
assert(all(abs(SkyDiffuse - Expected) < 0.0001))


%% Test Reindl 1990 matlab
SkyDiffuse = pvl_reindl1990(SurfTilt, SurfAz, DHI, DNI, GHI, HExtra, SunZen, SunAz)
Expected = [         0
   27.9412
  104.1317
   34.1663]
assert(all(abs(SkyDiffuse - Expected) < 0.0001))


%% Test Reindl 1990 matlab against python
SkyDiffuse = pvl_reindl1990(SurfTilt, SurfAz, DHI, DNI, GHI, HExtra, SunZen, SunAz)
Expected = [NaN, 15.730664, 104.131724, 34.166258].'
assert(all(abs(SkyDiffuse - Expected) < 0.0001))


%% Test Klucher matlab
SkyDiffuse = pvl_klucher1979(SurfTilt, SurfAz, DHI, GHI, SunZen, SunAz)
Expected = [         0
   37.4463
  109.2093
   56.9659]
assert(all(abs(SkyDiffuse - Expected) < 0.0001))


%% Test Klucher matlab against python
SkyDiffuse = pvl_klucher1979(SurfTilt, SurfAz, DHI, GHI, SunZen, SunAz)
Expected = [0, 37.446276, 109.209347, 56.965916].'
assert(all(abs(SkyDiffuse - Expected) < 0.0001))
