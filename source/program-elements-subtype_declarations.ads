--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Elements.Declarations;
with Program.Tokens;
with Program.Elements.Defining_Identifiers;
with Program.Elements.Subtype_Indications;

package Program.Elements.Subtype_Declarations is

   pragma Pure (Program.Elements.Subtype_Declarations);

   type Subtype_Declaration is
     limited interface and Program.Elements.Declarations.Declaration;

   type Subtype_Declaration_Access is access all Subtype_Declaration'Class
     with Storage_Size => 0;

   not overriding function Subtype_Token
    (Self : Subtype_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Name
    (Self : Subtype_Declaration)
      return Program.Elements.Defining_Identifiers.Defining_Identifier_Access
     is abstract;

   not overriding function Is_Token
    (Self : Subtype_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Subtype_Indication
    (Self : Subtype_Declaration)
      return Program.Elements.Subtype_Indications.Subtype_Indication_Access
     is abstract;

   not overriding function With_Token
    (Self : Subtype_Declaration)
      return Program.Tokens.Token_Access is abstract;

   not overriding function Semicolon_Token
    (Self : Subtype_Declaration)
      return Program.Tokens.Token_Access is abstract;

end Program.Elements.Subtype_Declarations;