--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Lexical_Elements;
with Program.Elements.Expressions;
with Program.Elements.Attribute_Definition_Clauses;
with Program.Element_Visitors;

package Program.Nodes.Attribute_Definition_Clauses is

   pragma Preelaborate;

   type Attribute_Definition_Clause is
     new Program.Nodes.Node
         and Program.Elements.Attribute_Definition_Clauses
           .Attribute_Definition_Clause
         and Program.Elements.Attribute_Definition_Clauses
           .Attribute_Definition_Clause_Text
     with private;

   function Create
    (For_Token       : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Name            : not null Program.Elements.Expressions.Expression_Access;
     Use_Token       : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Expression      : not null Program.Elements.Expressions.Expression_Access;
     Semicolon_Token : not null Program.Lexical_Elements
         .Lexical_Element_Access)
      return Attribute_Definition_Clause;

   type Implicit_Attribute_Definition_Clause is
     new Program.Nodes.Node
         and Program.Elements.Attribute_Definition_Clauses
           .Attribute_Definition_Clause
     with private;

   function Create
    (Name                 : not null Program.Elements.Expressions
         .Expression_Access;
     Expression           : not null Program.Elements.Expressions
         .Expression_Access;
     Is_Part_Of_Implicit  : Boolean := False;
     Is_Part_Of_Inherited : Boolean := False;
     Is_Part_Of_Instance  : Boolean := False)
      return Implicit_Attribute_Definition_Clause
     with Pre =>
       Is_Part_Of_Implicit or Is_Part_Of_Inherited or Is_Part_Of_Instance;
private

   type Base_Attribute_Definition_Clause is
     abstract new Program.Nodes.Node
       and Program.Elements.Attribute_Definition_Clauses
         .Attribute_Definition_Clause
     with record
        Name       : not null Program.Elements.Expressions.Expression_Access;
        Expression : not null Program.Elements.Expressions.Expression_Access;
     end record;

   procedure Initialize
    (Self : aliased in out Base_Attribute_Definition_Clause'Class);

   overriding procedure Visit
    (Self    : not null access Base_Attribute_Definition_Clause;
     Visitor : in out Program.Element_Visitors.Element_Visitor'Class);

   overriding function Name
    (Self : Base_Attribute_Definition_Clause)
      return not null Program.Elements.Expressions.Expression_Access;

   overriding function Expression
    (Self : Base_Attribute_Definition_Clause)
      return not null Program.Elements.Expressions.Expression_Access;

   overriding function Is_Attribute_Definition_Clause_Element
    (Self : Base_Attribute_Definition_Clause)
      return Boolean;

   overriding function Is_Representation_Clause_Element
    (Self : Base_Attribute_Definition_Clause)
      return Boolean;

   overriding function Is_Clause_Element
    (Self : Base_Attribute_Definition_Clause)
      return Boolean;

   type Attribute_Definition_Clause is
     new Base_Attribute_Definition_Clause
       and Program.Elements.Attribute_Definition_Clauses
         .Attribute_Definition_Clause_Text
     with record
        For_Token       : not null Program.Lexical_Elements
          .Lexical_Element_Access;
        Use_Token       : not null Program.Lexical_Elements
          .Lexical_Element_Access;
        Semicolon_Token : not null Program.Lexical_Elements
          .Lexical_Element_Access;
     end record;

   overriding function To_Attribute_Definition_Clause_Text
    (Self : aliased in out Attribute_Definition_Clause)
      return Program.Elements.Attribute_Definition_Clauses
          .Attribute_Definition_Clause_Text_Access;

   overriding function For_Token
    (Self : Attribute_Definition_Clause)
      return not null Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Use_Token
    (Self : Attribute_Definition_Clause)
      return not null Program.Lexical_Elements.Lexical_Element_Access;

   overriding function Semicolon_Token
    (Self : Attribute_Definition_Clause)
      return not null Program.Lexical_Elements.Lexical_Element_Access;

   type Implicit_Attribute_Definition_Clause is
     new Base_Attribute_Definition_Clause
     with record
        Is_Part_Of_Implicit  : Boolean;
        Is_Part_Of_Inherited : Boolean;
        Is_Part_Of_Instance  : Boolean;
     end record;

   overriding function To_Attribute_Definition_Clause_Text
    (Self : aliased in out Implicit_Attribute_Definition_Clause)
      return Program.Elements.Attribute_Definition_Clauses
          .Attribute_Definition_Clause_Text_Access;

   overriding function Is_Part_Of_Implicit
    (Self : Implicit_Attribute_Definition_Clause)
      return Boolean;

   overriding function Is_Part_Of_Inherited
    (Self : Implicit_Attribute_Definition_Clause)
      return Boolean;

   overriding function Is_Part_Of_Instance
    (Self : Implicit_Attribute_Definition_Clause)
      return Boolean;

end Program.Nodes.Attribute_Definition_Clauses;
