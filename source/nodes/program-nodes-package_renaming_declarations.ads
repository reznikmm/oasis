--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Lexical_Elements;
with Program.Elements.Defining_Names;
with Program.Elements.Expressions;
with Program.Elements.Aspect_Specifications;
with Program.Elements.Package_Renaming_Declarations;
with Program.Element_Visitors;

package Program.Nodes.Package_Renaming_Declarations is

   pragma Pure (Program.Nodes.Package_Renaming_Declarations);

   type Package_Renaming_Declaration is
     new Program.Nodes.Node
         and Program.Elements.Package_Renaming_Declarations
           .Package_Renaming_Declaration
         and Program.Elements.Package_Renaming_Declarations
           .Package_Renaming_Declaration_Text
     with private;

   function Create
    (Package_Token   : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Name            : not null Program.Elements.Defining_Names
         .Defining_Name_Access;
     Renames_Token   : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Renamed_Package : not null Program.Elements.Expressions.Expression_Access;
     With_Token      : Program.Lexical_Elements.Lexical_Element_Access;
     Aspects         : Program.Elements.Aspect_Specifications
         .Aspect_Specification_Vector_Access;
     Semicolon_Token : not null Program.Lexical_Elements
         .Lexical_Element_Access)
      return Package_Renaming_Declaration;

   type Implicit_Package_Renaming_Declaration is
     new Program.Nodes.Node
         and Program.Elements.Package_Renaming_Declarations
           .Package_Renaming_Declaration
     with private;

   function Create
    (Name                 : not null Program.Elements.Defining_Names
         .Defining_Name_Access;
     Renamed_Package      : not null Program.Elements.Expressions
         .Expression_Access;
     Aspects              : Program.Elements.Aspect_Specifications
         .Aspect_Specification_Vector_Access;
     Is_Part_Of_Implicit  : Boolean := False;
     Is_Part_Of_Inherited : Boolean := False;
     Is_Part_Of_Instance  : Boolean := False)
      return Implicit_Package_Renaming_Declaration
     with Pre =>
       Is_Part_Of_Implicit or Is_Part_Of_Inherited or Is_Part_Of_Instance;
private

   type Base_Package_Renaming_Declaration is
     abstract new Program.Nodes.Node
       and Program.Elements.Package_Renaming_Declarations
         .Package_Renaming_Declaration
     with record
        Name            : not null Program.Elements.Defining_Names
          .Defining_Name_Access;
        Renamed_Package : not null Program.Elements.Expressions
          .Expression_Access;
        Aspects         : Program.Elements.Aspect_Specifications
          .Aspect_Specification_Vector_Access;
     end record;

   procedure Initialize
    (Self : aliased in out Base_Package_Renaming_Declaration'Class);

   overriding procedure Visit
    (Self    : not null access Base_Package_Renaming_Declaration;
     Visitor : in out Program.Element_Visitors.Element_Visitor'Class);

   overriding function Name
    (Self : Base_Package_Renaming_Declaration)
      return not null Program.Elements.Defining_Names.Defining_Name_Access;

   overriding function Renamed_Package
    (Self : Base_Package_Renaming_Declaration)
      return not null Program.Elements.Expressions.Expression_Access;

   overriding function Aspects
    (Self : Base_Package_Renaming_Declaration)
      return Program.Elements.Aspect_Specifications
          .Aspect_Specification_Vector_Access;

   overriding function Is_Package_Renaming_Declaration
    (Self : Base_Package_Renaming_Declaration)
      return Boolean;

   overriding function Is_Declaration
    (Self : Base_Package_Renaming_Declaration)
      return Boolean;

   type Package_Renaming_Declaration is
     new Base_Package_Renaming_Declaration
       and Program.Elements.Package_Renaming_Declarations
         .Package_Renaming_Declaration_Text
     with record
        Package_Token   : not null Program.Lexical_Elements
          .Lexical_Element_Access;
        Renames_Token   : not null Program.Lexical_Elements
          .Lexical_Element_Access;
        With_Token      : Program.Lexical_Elements.Lexical_Element_Access;
        Semicolon_Token : not null Program.Lexical_Elements
          .Lexical_Element_Access;
     end record;

   overriding function To_Package_Renaming_Declaration_Text
    (Self : aliased in out Package_Renaming_Declaration)
      return Program.Elements.Package_Renaming_Declarations
          .Package_Renaming_Declaration_Text_Access;

   overriding function Package_Token
    (Self : Package_Renaming_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Renames_Token
    (Self : Package_Renaming_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access;

   overriding function With_Token
    (Self : Package_Renaming_Declaration)
      return Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Semicolon_Token
    (Self : Package_Renaming_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access;

   type Implicit_Package_Renaming_Declaration is
     new Base_Package_Renaming_Declaration
     with record
        Is_Part_Of_Implicit  : Boolean;
        Is_Part_Of_Inherited : Boolean;
        Is_Part_Of_Instance  : Boolean;
     end record;

   overriding function To_Package_Renaming_Declaration_Text
    (Self : aliased in out Implicit_Package_Renaming_Declaration)
      return Program.Elements.Package_Renaming_Declarations
          .Package_Renaming_Declaration_Text_Access;

   overriding function Is_Part_Of_Implicit
    (Self : Implicit_Package_Renaming_Declaration)
      return Boolean;

   overriding function Is_Part_Of_Inherited
    (Self : Implicit_Package_Renaming_Declaration)
      return Boolean;

   overriding function Is_Part_Of_Instance
    (Self : Implicit_Package_Renaming_Declaration)
      return Boolean;

end Program.Nodes.Package_Renaming_Declarations;
