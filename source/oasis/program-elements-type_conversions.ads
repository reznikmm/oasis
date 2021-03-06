--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Elements.Expressions;
with Program.Lexical_Elements;

package Program.Elements.Type_Conversions is

   pragma Pure (Program.Elements.Type_Conversions);

   type Type_Conversion is
     limited interface and Program.Elements.Expressions.Expression;

   type Type_Conversion_Access is access all Type_Conversion'Class
     with Storage_Size => 0;

   not overriding function Subtype_Mark
    (Self : Type_Conversion)
      return not null Program.Elements.Expressions.Expression_Access
     is abstract;

   not overriding function Operand
    (Self : Type_Conversion)
      return not null Program.Elements.Expressions.Expression_Access
     is abstract;

   type Type_Conversion_Text is limited interface;

   type Type_Conversion_Text_Access is access all Type_Conversion_Text'Class
     with Storage_Size => 0;

   not overriding function To_Type_Conversion_Text
    (Self : aliased in out Type_Conversion)
      return Type_Conversion_Text_Access is abstract;

   not overriding function Left_Bracket_Token
    (Self : Type_Conversion_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

   not overriding function Right_Bracket_Token
    (Self : Type_Conversion_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

end Program.Elements.Type_Conversions;
