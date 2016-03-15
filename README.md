# fed-storage-tests

ALICE test scripts:
 * aliceinit.sh - initalisation script
 * alicefulltest.sh - wrapper that runs tests for all defined variants
 * alicetest.sh - invokes real tests and gathers statistics
 * start.c, readraw.C - test sources

ATLAS test scripts:
 * atlasinit\_\* - initalisation scripts for ATLAS test
 * atlastesfull.sh - runs real tests for all defined variants
 * atlasrespars.sh - parser for ATLAS test results
 * atlasinit\_spbu.s - environment setup script
 * atlas\_test2/\* - test sources and input data
