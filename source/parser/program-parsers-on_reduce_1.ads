
with Anagram.Grammars;
with Program.Parsers.Nodes;
private procedure Program.Parsers.On_Reduce_1
  (Self  : access Parse_Context;
   Prod  : Anagram.Grammars.Production_Index;
   Nodes : in out Program.Parsers.Nodes.Node_Array);
pragma Preelaborate (Program.Parsers.On_Reduce_1);
