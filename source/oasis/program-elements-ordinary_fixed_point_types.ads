--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Elements.Type_Definitions;
with Program.Lexical_Elements;
with Program.Elements.Expressions;
with Program.Elements.Real_Range_Specifications;

package Program.Elements.Ordinary_Fixed_Point_Types is

   pragma Pure (Program.Elements.Ordinary_Fixed_Point_Types);

   type Ordinary_Fixed_Point_Type is
     limited interface and Program.Elements.Type_Definitions.Type_Definition;

   type Ordinary_Fixed_Point_Type_Access is
     access all Ordinary_Fixed_Point_Type'Class with Storage_Size => 0;

   not overriding function Delta_Expression
    (Self : Ordinary_Fixed_Point_Type)
      return not null Program.Elements.Expressions.Expression_Access
     is abstract;

   not overriding function Real_Range
    (Self : Ordinary_Fixed_Point_Type)
      return not null Program.Elements.Real_Range_Specifications
          .Real_Range_Specification_Access is abstract;

   type Ordinary_Fixed_Point_Type_Text is limited interface;

   type Ordinary_Fixed_Point_Type_Text_Access is
     access all Ordinary_Fixed_Point_Type_Text'Class with Storage_Size => 0;

   not overriding function To_Ordinary_Fixed_Point_Type_Text
    (Self : aliased in out Ordinary_Fixed_Point_Type)
      return Ordinary_Fixed_Point_Type_Text_Access is abstract;

   not overriding function Delta_Token
    (Self : Ordinary_Fixed_Point_Type_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

end Program.Elements.Ordinary_Fixed_Point_Types;
