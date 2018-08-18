The test scripts can be run with commands such as:

```
matlab -nojvm -nodesktop -r "runtests('test_sky_diffuse');exit"
```

On OS X, use the full path to matlab, for example: ``/Applications/MATLAB_R2016a.app/bin/matlab``

You'll also need to set your MATLABPATH environment variable:

```
export MATLABPATH=/my/local/path/to/MATLAB_PV_LIB/tests
```
