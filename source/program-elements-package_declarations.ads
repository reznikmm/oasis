--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Elements.Declarations;
with Program.Tokens;
with Program.Elements.Defining_Names;
with Program.Elements.Aspect_Specifications;
with Program.Element_Vectors;
with Program.Elements.Expressions;

package Program.Elements.Package_Declarations is

   pragma Pure (Program.Elements.Package_Declarations);

   type Package_Declaration is
     limited interface and Program.Elements.Declarations.Declaration;

   type Package_Declaration_Access is access all Package_Declaration'Class
     with Storage_Size => 0;

   not overriding function Package_Token
    (Self : Package_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Name
    (Self : Package_Declaration)
      return not null Program.Elements.Defining_Names.Defining_Name_Access
     is abstract;

   not overriding function With_Token
    (Self : Package_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Aspects
    (Self : Package_Declaration)
      return not null Program.Elements.Aspect_Specifications
          .Aspect_Specification_Vector_Access is abstract;

   not overriding function Is_Token
    (Self : Package_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Visible_Declarations
    (Self : Package_Declaration)
      return not null Program.Element_Vectors.Element_Vector_Access
     is abstract;

   not overriding function Private_Token
    (Self : Package_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Private_Declarations
    (Self : Package_Declaration)
      return not null Program.Element_Vectors.Element_Vector_Access
     is abstract;

   not overriding function End_Token
    (Self : Package_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function End_Name
    (Self : Package_Declaration)
      return Program.Elements.Expressions.Expression_Access is abstract;

   not overriding function Semicolon_Token
    (Self : Package_Declaration)
      return Program.Tokens.Token_Access is abstract;

end Program.Elements.Package_Declarations;
