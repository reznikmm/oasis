--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Elements.Declarations;
with Program.Lexical_Elements;
with Program.Elements.Defining_Names;
with Program.Elements.Expressions;
with Program.Elements.Parameter_Associations;
with Program.Elements.Aspect_Specifications;

package Program.Elements.Package_Instantiations is

   pragma Pure (Program.Elements.Package_Instantiations);

   type Package_Instantiation is
     limited interface and Program.Elements.Declarations.Declaration;

   type Package_Instantiation_Access is access all Package_Instantiation'Class
     with Storage_Size => 0;

   not overriding function Name
    (Self : Package_Instantiation)
      return not null Program.Elements.Defining_Names.Defining_Name_Access
     is abstract;

   not overriding function Generic_Package_Name
    (Self : Package_Instantiation)
      return not null Program.Elements.Expressions.Expression_Access
     is abstract;

   not overriding function Parameters
    (Self : Package_Instantiation)
      return Program.Elements.Parameter_Associations
          .Parameter_Association_Vector_Access is abstract;

   not overriding function Aspects
    (Self : Package_Instantiation)
      return Program.Elements.Aspect_Specifications
          .Aspect_Specification_Vector_Access is abstract;

   type Package_Instantiation_Text is limited interface;

   type Package_Instantiation_Text_Access is
     access all Package_Instantiation_Text'Class with Storage_Size => 0;

   not overriding function To_Package_Instantiation_Text
    (Self : aliased in out Package_Instantiation)
      return Package_Instantiation_Text_Access is abstract;

   not overriding function Package_Token
    (Self : Package_Instantiation_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

   not overriding function Is_Token
    (Self : Package_Instantiation_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

   not overriding function New_Token
    (Self : Package_Instantiation_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

   not overriding function Left_Bracket_Token
    (Self : Package_Instantiation_Text)
      return Program.Lexical_Elements.Lexical_Element_Access is abstract;

   not overriding function Right_Bracket_Token
    (Self : Package_Instantiation_Text)
      return Program.Lexical_Elements.Lexical_Element_Access is abstract;

   not overriding function With_Token
    (Self : Package_Instantiation_Text)
      return Program.Lexical_Elements.Lexical_Element_Access is abstract;

   not overriding function Semicolon_Token
    (Self : Package_Instantiation_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

end Program.Elements.Package_Instantiations;
