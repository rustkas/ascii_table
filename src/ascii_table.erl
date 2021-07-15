%% @author Anatolii Kosorukov <java1cprog@yandex.ru> [rustkas.github.io/]
%% @copyright 2021 by Anatolii Kosorukov
%% @doc A structured view of an ASCII-table as a list of tuples.
%% ```
%%	Dec  Hx     Oct    Regex  String  Description
%%	0    16#0   8#0    \x0    NULL    (null)
%%	1    16#1   8#1    \x1    SOH     (start of heading)
%%	2    16#2   8#2    \x2    STX     (start of text)
%%	3    16#3   8#3    \x3    ETX     (end of text)
%%	4    16#4   8#4    \x4    EOT     (end of transmission)
%%	5    16#5   8#5    \x5    ENQ     (enquiry)
%%	6    16#6   8#6    \x6    ACK     (acknowledge)
%%	7    16#7   8#7    \x7    BEL     (bell)
%%	8    16#8   8#10   \x8    BS      (backspace)
%%	9    16#9   8#11   \x9    TAB     (horizontal tab)
%%	10   16#A   8#12   \xA    LF      (NL form feed, new line)
%%	11   16#B   8#13   \xB    VT      (vertical tab)
%%	12   16#C   8#14   \xC    FF      (NP form feed, new page)
%%	13   16#D   8#15   \xD    CR      (carridge return)
%%	14   16#E   8#16   \xE    SO      (shift out)
%%	15   16#F   8#17   \xF    SI      (shift in)
%%	16   16#10  8#20   \x10   DLE     (data link escape)
%%	17   16#11  8#21   \x11   DC1     (device control 1)
%%	18   16#12  8#22   \x12   DC2     (device control 2)
%%	19   16#13  8#23   \x13   DC3     (device control 3)
%%	20   16#14  8#24   \x14   DC4     (device control 4)
%%	21   16#15  8#25   \x15   NAK     (negative acknowledge)
%%	22   16#16  8#26   \x16   SYN     (synchronous idle)
%%	23   16#17  8#27   \x17   ETB     (end of trans. block)
%%	24   16#18  8#30   \x18   CAN     (cancel)
%%	25   16#19  8#31   \x19   EM      (end of medium)
%%	26   16#1A  8#32   \x1A   SUB     (substitute)
%%	27   16#1B  8#33   \x1B   ESC     (escape)
%%	28   16#1C  8#34   \x1C   FS      (file separator)
%%	29   16#1D  8#35   \x1D   GS      (group separator)
%%	30   16#1E  8#36   \x1E   GS      (record separator)
%%	31   16#1F  8#37   \x1F   US      (unit separator)
%%	32   16#20  8#40   \x20   Space
%%	33   16#21  8#41   !      !
%%	34   16#22  8#42   \x22   "
%%	35   16#23  8#43   #      #
%%	36   16#24  8#44   \x24   $
%%	37   16#25  8#45   %      %
%%	38   16#26  8#46   &      &
%%	39   16#27  8#47   '      '
%%	40   16#28  8#50   \(     (
%%	41   16#29  8#51   \)     )
%%	42   16#2A  8#52   \*     *
%%	43   16#2B  8#53   \+     +
%%	44   16#2C  8#54   \,     ,
%%	45   16#2D  8#55   \-     -
%%	46   16#2E  8#56   \.     .
%%	47   16#2F  8#57   /      /
%%	48   16#30  8#60   0      0
%%	49   16#31  8#61   1      1
%%	50   16#32  8#62   2      2
%%	51   16#33  8#63   3      3
%%	52   16#34  8#64   4      4
%%	53   16#35  8#65   5      5
%%	54   16#36  8#66   6      6
%%	55   16#37  8#67   7      7
%%	56   16#38  8#70   8      8
%%	57   16#39  8#71   9      9
%%	58   16#3A  8#72   :      :
%%	59   16#3B  8#73   ;      ;
%%	60   16#3C  8#74   <      <
%%	61   16#3D  8#75   =      =
%%	62   16#3E  8#76   >      >
%%	63   16#3F  8#77   \?     ?
%%	64   16#40  8#100  @      @
%%	65   16#41  8#101  A      A
%%	66   16#42  8#102  B      B
%%	67   16#43  8#103  C      C
%%	68   16#44  8#104  D      D
%%	69   16#45  8#105  E      E
%%	70   16#46  8#106  F      F
%%	71   16#47  8#107  G      G
%%	72   16#48  8#110  H      H
%%	73   16#49  8#111  I      I
%%	74   16#4A  8#112  J      J
%%	75   16#4B  8#113  K      K
%%	76   16#4C  8#114  L      L
%%	77   16#4D  8#115  M      M
%%	78   16#4E  8#116  N      N
%%	79   16#4F  8#117  O      O
%%	80   16#50  8#120  P      P
%%	81   16#51  8#121  Q      Q
%%	82   16#52  8#122  R      R
%%	83   16#53  8#123  S      S
%%	84   16#54  8#124  T      T
%%	85   16#55  8#125  U      U
%%	86   16#56  8#126  V      V
%%	87   16#57  8#127  W      W
%%	88   16#58  8#130  X      X
%%	89   16#59  8#131  Y      Y
%%	90   16#5A  8#132  Z      Z
%%	91   16#5D  8#133  \[     [
%%	92   16#5C  8#134  \x5C   \
%%	93   16#5D  8#135  \]     ]
%%	94   16#5E  8#136  \^     ^
%%	95   16#5F  8#137  _      _
%%	96   16#60  8#140  `      `
%%	97   16#61  8#141  a      a
%%	98   16#62  8#142  b      b
%%	99   16#63  8#143  c      c
%%	100  16#64  8#144  d      d
%%	101  16#65  8#145  e      e
%%	102  16#66  8#146  f      f
%%	103  16#67  8#147  g      g
%%	104  16#68  8#150  h      h
%%	105  16#69  8#151  i      i
%%	106  16#6A  8#152  j      j
%%	107  16#6B  8#153  k      k
%%	108  16#6C  8#154  l      l
%%	109  16#6D  8#155  m      m
%%	110  16#6E  8#156  n      n
%%	111  16#6F  8#157  o      o
%%	112  16#70  8#160  p      p
%%	113  16#71  8#161  q      q
%%	114  16#72  8#162  r      r
%%	115  16#73  8#163  s      s
%%	116  16#74  8#164  t      t
%%	117  16#75  8#165  u      u
%%	118  16#76  8#166  v      v
%%	119  16#77  8#167  w      w
%%	120  16#78  8#170  x      x
%%	121  16#79  8#171  y      y
%%	122  16#7A  8#172  z      z
%%	123  16#7B  8#173  \{     {
%%	124  16#7C  8#174  \|     |
%%	125  16#7D  8#175  \}     }
%%	126  16#7E  8#176  ~      ~
%%	127  16#7F  8#177  \x7F   DEL
%%	'''
%% ascii_table:print().
-module(ascii_table).

-export([ascii_table/0,print/0]).

-spec print() -> ok.
%% Print ASCII table content

print() ->
 io:format("~-5.s~-7.s~-7.s~-7.s~-8.s~-30.s~n",
                                       ["Dec", "Hx", "Oct", "Regex", "String", "Description"]),
    ASCII_Table = ascii_table:ascii_table(),
    lists:foreach(fun(Tuple) ->
                     case Tuple of
                         {Dec, Hx, Oct, Regex, String, Description} ->
                             {Dec, Hx, Oct, Regex, String, Description} = Tuple,
                             io:format("~-5.B~-7.16#~-7.8#~-7.s~-8.s~-30.s~n",
                                       [Dec, Hx, Oct, Regex, String, Description]);
                         {Dec, Hx, Oct, Regex, String} ->
                             {Dec, Hx, Oct, Regex, String} = Tuple,
                             io:format("~-5.B~-7.16#~-7.8#~-7.s~-8.s~n", [Dec, Hx, Oct, Regex, String])
                     end
                  end,
                  ASCII_Table),
    ok.

-spec ascii_table() -> [{Dec, Hx, Oct, Regex, Representation, Desciption}]
    when Dec :: pos_integer(),
         Hx :: pos_integer(),
         Oct :: pos_integer(),
         Regex :: nonempty_string(),
         Representation :: nonempty_string(),
         Desciption :: string().
%% Return ASCII-table as list of tuples

ascii_table() ->
     [{0, 16#0, 8#000, "\\x0", "NULL", "(null)"},
     {1, 16#1, 8#001, "\\x1", "SOH", "(start of heading)"},
     {2, 16#2, 8#002, "\\x2", "STX", "(start of text)"},
     {3, 16#3, 8#003, "\\x3", "ETX", "(end of text)"},
     {4, 16#4, 8#004, "\\x4", "EOT", "(end of transmission)"},
     {5, 16#5, 8#005, "\\x5", "ENQ", "(enquiry)"},
     {6, 16#6, 8#006, "\\x6", "ACK", "(acknowledge)"},
     {7, 16#7, 8#007, "\\x7", "BEL", "(bell)"},
     {8, 16#8, 8#010, "\\x8", "BS", "(backspace)"},
     {9, 16#9, 8#011, "\\x9", "TAB", "(horizontal tab)"},
     {10, 16#A, 8#012, "\\xA", "LF", "(NL form feed, new line)"},
     {11, 16#B, 8#013, "\\xB", "VT", "(vertical tab)"},
     {12, 16#C, 8#014, "\\xC", "FF", "(NP form feed, new page)"},
     {13, 16#D, 8#015, "\\xD", "CR", "(carridge return)"},
     {14, 16#E, 8#016, "\\xE", "SO", "(shift out)"},
     {15, 16#F, 8#017, "\\xF", "SI", "(shift in)"},
     {16, 16#10, 8#020, "\\x10", "DLE", "(data link escape)"},
     {17, 16#11, 8#021, "\\x11", "DC1", "(device control 1)"},
     {18, 16#12, 8#022, "\\x12", "DC2", "(device control 2)"},
     {19, 16#13, 8#023, "\\x13", "DC3", "(device control 3)"},
     {20, 16#14, 8#024, "\\x14", "DC4", "(device control 4)"},
     {21, 16#15, 8#025, "\\x15", "NAK", "(negative acknowledge)"},
     {22, 16#16, 8#026, "\\x16", "SYN", "(synchronous idle)"},
     {23, 16#17, 8#027, "\\x17", "ETB", "(end of trans. block)"},
     {24, 16#18, 8#030, "\\x18", "CAN", "(cancel)"},
     {25, 16#19, 8#031, "\\x19", "EM", "(end of medium)"},
     {26, 16#1A, 8#032, "\\x1A", "SUB", "(substitute)"},
     {27, 16#1B, 8#033, "\\x1B", "ESC", "(escape)"},
     {28, 16#1C, 8#034, "\\x1C", "FS", "(file separator)"},
     {29, 16#1D, 8#035, "\\x1D", "GS", "(group separator)"},
     {30, 16#1E, 8#036, "\\x1E", "GS", "(record separator)"},
     {31, 16#1F, 8#037, "\\x1F", "US", "(unit separator)"},
     {32, 16#20, 8#040, "\\x20", "Space"}, 
	 {33, 16#21, 8#041, "!", "!"},
     {34, 16#22, 8#042, "\\x22", "\""}, 
	 {35, 16#23, 8#043, "#", "#"},
     {36, 16#24, 8#044, "\\x24", "$"},
	 {37, 16#25, 8#045, "%", "%"},
	 {38, 16#26, 8#046, "&", "&"},
	 {39, 16#27, 8#047, "'", "'"},
	 {40, 16#28, 8#050, "\\(", "("},
	 {41, 16#29, 8#051, "\\)", ")"},
	 {42, 16#2A, 8#052, "\\*", "*"},
	 {43, 16#2B, 8#053, "\\+", "+"},
	 {44, 16#2C, 8#054, "\\,", ","},
	 {45, 16#2D, 8#055, "\\-", "-"},
	 {46, 16#2E, 8#056, "\\.", "."},
	 {47, 16#2F, 8#057, "/", "/"},
	 {48, 16#30, 8#060, "0", "0"},
	 {49, 16#31, 8#061, "1", "1"},
	 {50, 16#32, 8#062, "2", "2"},
	 {51, 16#33, 8#063, "3", "3"},
	 {52, 16#34, 8#064, "4", "4"},
	 {53, 16#35, 8#065, "5", "5"},
	 {54, 16#36, 8#066, "6", "6"},
	 {55, 16#37, 8#067, "7", "7"},
	 {56, 16#38, 8#070, "8", "8"},
	 {57, 16#39, 8#071, "9", "9"},
	 {58, 16#3A, 8#072, ":", ":"},
	 {59, 16#3B, 8#073, ";", ";"},
	 {60, 16#3C, 8#074, "<", "<"},
	 {61, 16#3D, 8#075, "=", "="},
	 {62, 16#3E, 8#076, ">", ">"},
	 {63, 16#3F, 8#077, "\\?", "?"},
	 {64, 16#40, 8#100, "@", "@"},
	 {65, 16#41, 8#101, "A", "A"},
	 {66, 16#42, 8#102, "B", "B"},
	 {67, 16#43, 8#103, "C", "C"},
	 {68, 16#44, 8#104, "D", "D"},
	 {69, 16#45, 8#105, "E", "E"},
	 {70, 16#46, 8#106, "F", "F"},
	 {71, 16#47, 8#107, "G", "G"},
	 {72, 16#48, 8#110, "H", "H"},
	 {73, 16#49, 8#111, "I", "I"},
	 {74, 16#4A, 8#112, "J", "J"},
	 {75, 16#4B, 8#113, "K", "K"},
	 {76, 16#4C, 8#114, "L", "L"},
	 {77, 16#4D, 8#115, "M", "M"},
	 {78, 16#4E, 8#116, "N", "N"},
	 {79, 16#4F, 8#117, "O", "O"},
	 {80, 16#50, 8#120, "P", "P"},
	 {81, 16#51, 8#121, "Q", "Q"},
	 {82, 16#52, 8#122, "R", "R"},
	 {83, 16#53, 8#123, "S", "S"},
	 {84, 16#54, 8#124, "T", "T"},
	 {85, 16#55, 8#125, "U", "U"},
	 {86, 16#56, 8#126, "V", "V"},
	 {87, 16#57, 8#127, "W", "W"},
	 {88, 16#58, 8#130, "X", "X"},
	 {89, 16#59, 8#131, "Y", "Y"},
	 {90, 16#5A, 8#132, "Z", "Z"},
	 {91, 16#5D, 8#133, "\\[", "["},
	 {92, 16#5C, 8#134, "\\x5C", "\\"},
	 {93, 16#5D, 8#135, "\\]", "]"},
	 {94, 16#5E, 8#136, "\\^", "^"},
	 {95, 16#5F, 8#137, "_", "_"},
	 {96, 16#60, 8#140, "`", "`"},
	 {97, 16#61, 8#141, "a", "a"},
	 {98, 16#62, 8#142, "b", "b"},
	 {99, 16#63, 8#143, "c", "c"},
	 {100, 16#64, 8#144, "d", "d"},
	 {101, 16#65, 8#145, "e", "e"},
	 {102, 16#66, 8#146, "f", "f"},
	 {103, 16#67, 8#147, "g", "g"},
	 {104, 16#68, 8#150, "h", "h"},
	 {105, 16#69, 8#151, "i", "i"},
	 {106, 16#6A, 8#152, "j", "j"},
	 {107, 16#6B, 8#153, "k", "k"},
	 {108, 16#6C, 8#154, "l", "l"},
	 {109, 16#6D, 8#155, "m", "m"},
	 {110, 16#6E, 8#156, "n", "n"},
	 {111, 16#6F, 8#157, "o", "o"},
	 {112, 16#70, 8#160, "p", "p"},
	 {113, 16#71, 8#161, "q", "q"},
	 {114, 16#72, 8#162, "r", "r"},
	 {115, 16#73, 8#163, "s", "s"},
	 {116, 16#74, 8#164, "t", "t"},
	 {117, 16#75, 8#165, "u", "u"},
	 {118, 16#76, 8#166, "v", "v"},
	 {119, 16#77, 8#167, "w", "w"},
	 {120, 16#78, 8#170, "x", "x"},
	 {121, 16#79, 8#171, "y", "y"},
	 {122, 16#7A, 8#172, "z", "z"},
	 {123, 16#7B, 8#173, "\\{", "{"},
	 {124, 16#7C, 8#174, "\\|", "|"},
	 {125, 16#7D, 8#175, "\\}", "}"},
	 {126, 16#7E, 8#176, "~", "~"},
	 {127, 16#7F, 8#177, "\\x7F", "DEL"}
	 ].
