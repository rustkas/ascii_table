# Ascii-table
A structured view of an [ASCII](https://en.wikipedia.org/wiki/ASCII)-table as a list of tuples.

The table contains reference information about the contents of the ASCII-table, as well as an example of a regular expression for the corresponding character.


------------------------
## rebar3 commands

Build
-----
	$ rebar3 compile

Run EUnit tests
-----
	$ rebar3 eunit -v
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc

Make several commands one by one
-----	
    $ rebar3 do hex cut -i patch, hex publish --yes, hex docs