# Trying to be a helpful friend

## User Story:
As a user of this interface I would like to have confidence that I am not overloading the "factor" capacity when I enter 
schedule a "special trip".  I will identify both the "factory" and the "line" in the interface and I expect to see a dynamic drop-down
containing the available "trip" options.  When I pick one of the "trip" options from this drop-down, and expect to then see a listing 
of time values for the "trip" I select, with the selection defaulting to the first available "trip".

## Scope
To schedule a TRIP on 2023-10-11 at 9:30 AM through "factory" number 2, on "line" number 2, 
and should be included on "trip" number 1. 

## Assumptions:

* The interface that the end user sees is for scheduling a TRIP on a specific date. 
* The "valid_date" for this TRIP has already been established and is set or selected.  

_e.g.  The end user wants to add a TRIP obligation for a specific factory and line on a specific date. The end user needs
to be able to review related "trip"s and "time"s through a drop-down that dynamically shows the "time" when the "trip" value
is changed_


The source data is pre-defined and not being ALTERED by the end user.  The interface is just providing a way to add an obligation, 
within the pre-determine constraints stored in the "std_trip" and "sp_trip" tables.


## In words what I am trying to do with SQL

Given a specific Date, Factory and Line, I will produce a listing of available Trips and associated time values that 
are present in either the "std_trip" table OR in the "sp_trip" table. 

The result set of the SQL will have two fields, one containing the TRIP value, and the other containing the TIME value.

## Expected results

The result set should contain two or more records, each with the same "valid_date" and "factory", but with different
"line" and "time" values on each.  The origin of the values in the result will inclusive of values from both "sp_trip" and
"std_trip" tables.  

The result set will include a record containing:

* valid_date = 2023-10-11
* time = 9:30 AM 
* factory = 2 
* line = 1
* trip = 1

## How the results would be used on in the interface

* Convert the result set into an Array 
* Take its KEYS to produce the drop-down for the TRIPs
* Take its VALUES to produce the drop-down for the TIMEs
* Take the FIRST key/value to obtain the DEFAULT... 

_we need more info to understand what default is desired if it is not just the first available._

## RISK!
My source data is seeded from the Source_Seed.sql file contained in this directory.  Ii is very possible that my source
data is not fully reflective of the data structures stored and possible values in you are working with. 

