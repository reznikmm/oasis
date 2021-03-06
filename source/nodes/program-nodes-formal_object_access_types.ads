--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Lexical_Elements;
with Program.Elements.Subtype_Indications;
with Program.Elements.Formal_Object_Access_Types;
with Program.Element_Visitors;

package Program.Nodes.Formal_Object_Access_Types is

   pragma Preelaborate;

   type Formal_Object_Access_Type is
     new Program.Nodes.Node
         and Program.Elements.Formal_Object_Access_Types
           .Formal_Object_Access_Type
         and Program.Elements.Formal_Object_Access_Types
           .Formal_Object_Access_Type_Text
     with private;

   function Create
    (Not_Token          : Program.Lexical_Elements.Lexical_Element_Access;
     Null_Token         : Program.Lexical_Elements.Lexical_Element_Access;
     Access_Token       : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     All_Token          : Program.Lexical_Elements.Lexical_Element_Access;
     Constant_Token     : Program.Lexical_Elements.Lexical_Element_Access;
     Subtype_Indication : not null Program.Elements.Subtype_Indications
         .Subtype_Indication_Access)
      return Formal_Object_Access_Type;

   type Implicit_Formal_Object_Access_Type is
     new Program.Nodes.Node
         and Program.Elements.Formal_Object_Access_Types
           .Formal_Object_Access_Type
     with private;

   function Create
    (Subtype_Indication   : not null Program.Elements.Subtype_Indications
         .Subtype_Indication_Access;
     Is_Part_Of_Implicit  : Boolean := False;
     Is_Part_Of_Inherited : Boolean := False;
     Is_Part_Of_Instance  : Boolean := False;
     Has_Not_Null         : Boolean := False;
     Has_All              : Boolean := False;
     Has_Constant         : Boolean := False)
      return Implicit_Formal_Object_Access_Type
     with Pre =>
       Is_Part_Of_Implicit or Is_Part_Of_Inherited or Is_Part_Of_Instance;
private

   type Base_Formal_Object_Access_Type is
     abstract new Program.Nodes.Node
       and Program.Elements.Formal_Object_Access_Types
         .Formal_Object_Access_Type
     with record
        Subtype_Indication : not null Program.Elements.Subtype_Indications
          .Subtype_Indication_Access;
     end record;

   procedure Initialize
    (Self : aliased in out Base_Formal_Object_Access_Type'Class);

   overriding procedure Visit
    (Self    : not null access Base_Formal_Object_Access_Type;
     Visitor : in out Program.Element_Visitors.Element_Visitor'Class);

   overriding function Subtype_Indication
    (Self : Base_Formal_Object_Access_Type)
      return not null Program.Elements.Subtype_Indications
          .Subtype_Indication_Access;

   overriding function Is_Formal_Object_Access_Type_Element
    (Self : Base_Formal_Object_Access_Type)
      return Boolean;

   overriding function Is_Formal_Access_Type_Element
    (Self : Base_Formal_Object_Access_Type)
      return Boolean;

   overriding function Is_Formal_Type_Definition_Element
    (Self : Base_Formal_Object_Access_Type)
      return Boolean;

   overriding function Is_Definition_Element
    (Self : Base_Formal_Object_Access_Type)
      return Boolean;

   type Formal_Object_Access_Type is
     new Base_Formal_Object_Access_Type
       and Program.Elements.Formal_Object_Access_Types
         .Formal_Object_Access_Type_Text
     with record
        Not_Token      : Program.Lexical_Elements.Lexical_Element_Access;
        Null_Token     : Program.Lexical_Elements.Lexical_Element_Access;
        Access_Token   : not null Program.Lexical_Elements
          .Lexical_Element_Access;
        All_Token      : Program.Lexical_Elements.Lexical_Element_Access;
        Constant_Token : Program.Lexical_Elements.Lexical_Element_Access;
     end record;

   overriding function To_Formal_Object_Access_Type_Text
    (Self : aliased in out Formal_Object_Access_Type)
      return Program.Elements.Formal_Object_Access_Types
          .Formal_Object_Access_Type_Text_Access;

   overriding function Not_Token
    (Self : Formal_Object_Access_Type)
      return Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Null_Token
    (Self : Formal_Object_Access_Type)
      return Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Access_Token
    (Self : Formal_Object_Access_Type)
      return not null Program.Lexical_Elements.Lexical_Element_Access;

   overriding function All_Token
    (Self : Formal_Object_Access_Type)
      return Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Constant_Token
    (Self : Formal_Object_Access_Type)
      return Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Has_Not_Null
    (Self : Formal_Object_Access_Type)
      return Boolean;

   overriding function Has_All
    (Self : Formal_Object_Access_Type)
      return Boolean;

   overriding function Has_Constant
    (Self : Formal_Object_Access_Type)
      return Boolean;

   type Implicit_Formal_Object_Access_Type is
     new Base_Formal_Object_Access_Type
     with record
        Is_Part_Of_Implicit  : Boolean;
        Is_Part_Of_Inherited : Boolean;
        Is_Part_Of_Instance  : Boolean;
        Has_Not_Null         : Boolean;
        Has_All              : Boolean;
        Has_Constant         : Boolean;
     end record;

   overriding function To_Formal_Object_Access_Type_Text
    (Self : aliased in out Implicit_Formal_Object_Access_Type)
      return Program.Elements.Formal_Object_Access_Types
          .Formal_Object_Access_Type_Text_Access;

   overriding function Is_Part_Of_Implicit
    (Self : Implicit_Formal_Object_Access_Type)
      return Boolean;

   overriding function Is_Part_Of_Inherited
    (Self : Implicit_Formal_Object_Access_Type)
      return Boolean;

   overriding function Is_Part_Of_Instance
    (Self : Implicit_Formal_Object_Access_Type)
      return Boolean;

   overriding function Has_Not_Null
    (Self : Implicit_Formal_Object_Access_Type)
      return Boolean;

   overriding function Has_All
    (Self : Implicit_Formal_Object_Access_Type)
      return Boolean;

   overriding function Has_Constant
    (Self : Implicit_Formal_Object_Access_Type)
      return Boolean;

end Program.Nodes.Formal_Object_Access_Types;
