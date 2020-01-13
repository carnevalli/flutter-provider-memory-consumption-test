# Flutter Get_It Memory Comsumption Test

I'm considering switching to Get_It from Provider as my default object provider.

In order to measure if are there some impact in memory consumption, I've created some simple code to profile how each solution manages the lazy allocation of objects in memory.

The test consists on monitoring the memory consumption while the number of registered singletons grows.

By running Flutter in "profile" mode, from Dart DevTools, I got the following results :

## get_it: ^3.1.0

Code: [carnevalli/flutter-getit-memory-consumption-test](https://github.com/carnevalli/flutter-getit-memory-consumption-test)

### Results - (size, count, accumulator)
- 1 Singleton, 1 used (24, 1, 1)
- 2 Singletons, 1 used (24, 1, 1)
- 11 Singletons, 1 used (24, 1, 1),
- 11 Singletons, 6 used (24, 1, 1),

## Provider: ^4.0.1

In order to allow multiple singletons, Provider uses two objects, so, for each test, consider the results of "Provider" + "Multiprovider".

### Results - (size, count, accumulator)

### 1 Singleton, 1 used  (40, 2, 2)
- 	Provider (24, 1, 1)
- 	MultiProvider (16, 1, 1)

### 2 Singletons, 1 used (64, 3, 3)
- 	Provider (48, 2, 2)
- 	MultiProvider (16, 1, 1)

### 11 Singletons, 1 used (280, 12, 12)
- 	Provider (264, 11, 11)
- 	MultiProvider (16, 1, 1)

### 11 Singletons, 6 used (280, 12, 12)
- 	Provider (264, 11, 11)
- 	MultiProvider (16, 1, 1)

## Results

Get_It had a better performance in all tests. No matter how many lazy singletons it holds, the memory consumption will be the same.

In Provider, memory consumption grows as more lazy singletons are added to. Besides to "Provider" object, it also loads "MultiProvider", which makes using MultiProvider more expensive even if there's only one singleton.