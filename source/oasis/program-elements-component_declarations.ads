--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Elements.Declarations;
with Program.Elements.Defining_Identifiers;
with Program.Lexical_Elements;
with Program.Elements.Component_Definitions;
with Program.Elements.Expressions;
with Program.Elements.Aspect_Specifications;

package Program.Elements.Component_Declarations is

   pragma Pure (Program.Elements.Component_Declarations);

   type Component_Declaration is
     limited interface and Program.Elements.Declarations.Declaration;

   type Component_Declaration_Access is access all Component_Declaration'Class
     with Storage_Size => 0;

   not overriding function Names
    (Self : Component_Declaration)
      return not null Program.Elements.Defining_Identifiers
          .Defining_Identifier_Vector_Access is abstract;

   not overriding function Object_Subtype
    (Self : Component_Declaration)
      return not null Program.Elements.Component_Definitions
          .Component_Definition_Access is abstract;

   not overriding function Default_Expression
    (Self : Component_Declaration)
      return Program.Elements.Expressions.Expression_Access is abstract;

   not overriding function Aspects
    (Self : Component_Declaration)
      return Program.Elements.Aspect_Specifications
          .Aspect_Specification_Vector_Access is abstract;

   type Component_Declaration_Text is limited interface;

   type Component_Declaration_Text_Access is
     access all Component_Declaration_Text'Class with Storage_Size => 0;

   not overriding function To_Component_Declaration_Text
    (Self : aliased in out Component_Declaration)
      return Component_Declaration_Text_Access is abstract;

   not overriding function Colon_Token
    (Self : Component_Declaration_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

   not overriding function Assignment_Token
    (Self : Component_Declaration_Text)
      return Program.Lexical_Elements.Lexical_Element_Access is abstract;

   not overriding function With_Token
    (Self : Component_Declaration_Text)
      return Program.Lexical_Elements.Lexical_Element_Access is abstract;

   not overriding function Semicolon_Token
    (Self : Component_Declaration_Text)
      return not null Program.Lexical_Elements.Lexical_Element_Access
     is abstract;

end Program.Elements.Component_Declarations;
