--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Elements.Declarations;
with Program.Tokens;
with Program.Elements.Definitions;
with Program.Elements.Expressions;

package Program.Elements.Object_Declarations is

   pragma Pure (Program.Elements.Object_Declarations);

   type Object_Declaration is
     limited interface and Program.Elements.Declarations.Declaration;

   type Object_Declaration_Access is access all Object_Declaration'Class
     with Storage_Size => 0;

   not overriding function Colon_Token
    (Self : Object_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Aliased_Token
    (Self : Object_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Constant_Token
    (Self : Object_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Object_Subtype
    (Self : Object_Declaration)
      return Program.Elements.Definitions.Definition_Access is abstract;

   not overriding function Assignment_Token
    (Self : Object_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Initialization_Expression
    (Self : Object_Declaration)
      return Program.Elements.Expressions.Expression_Access is abstract;

   not overriding function With_Token
    (Self : Object_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Semicolon_Token
    (Self : Object_Declaration)
      return Program.Tokens.Token_Access is abstract;

end Program.Elements.Object_Declarations;