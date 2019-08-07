--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

package body Program.Nodes.Procedure_Body_Declarations is

   function Create
    (Not_Token           : Program.Lexical_Elements.Lexical_Element_Access;
     Overriding_Token    : Program.Lexical_Elements.Lexical_Element_Access;
     Procedure_Token     : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Name                : not null Program.Elements.Defining_Names
         .Defining_Name_Access;
     Left_Bracket_Token  : Program.Lexical_Elements.Lexical_Element_Access;
     Parameters          : Program.Elements.Parameter_Specifications
         .Parameter_Specification_Vector_Access;
     Right_Bracket_Token : Program.Lexical_Elements.Lexical_Element_Access;
     With_Token          : Program.Lexical_Elements.Lexical_Element_Access;
     Aspects             : Program.Elements.Aspect_Specifications
         .Aspect_Specification_Vector_Access;
     Is_Token            : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Declarations        : Program.Element_Vectors.Element_Vector_Access;
     Begin_Token         : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Statements          : not null Program.Element_Vectors
         .Element_Vector_Access;
     Exception_Token     : Program.Lexical_Elements.Lexical_Element_Access;
     Exception_Handlers  : Program.Elements.Exception_Handlers
         .Exception_Handler_Vector_Access;
     End_Token           : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     End_Name            : Program.Elements.Expressions.Expression_Access;
     Semicolon_Token     : not null Program.Lexical_Elements
         .Lexical_Element_Access)
      return Procedure_Body_Declaration is
   begin
      return Result : Procedure_Body_Declaration :=
        (Not_Token => Not_Token, Overriding_Token => Overriding_Token,
         Procedure_Token => Procedure_Token, Name => Name,
         Left_Bracket_Token => Left_Bracket_Token, Parameters => Parameters,
         Right_Bracket_Token => Right_Bracket_Token, With_Token => With_Token,
         Aspects => Aspects, Is_Token => Is_Token,
         Declarations => Declarations, Begin_Token => Begin_Token,
         Statements => Statements, Exception_Token => Exception_Token,
         Exception_Handlers => Exception_Handlers, End_Token => End_Token,
         End_Name => End_Name, Semicolon_Token => Semicolon_Token,
         Enclosing_Element => null)
      do
         Initialize (Result);
      end return;
   end Create;

   function Create
    (Name                 : not null Program.Elements.Defining_Names
         .Defining_Name_Access;
     Parameters           : Program.Elements.Parameter_Specifications
         .Parameter_Specification_Vector_Access;
     Aspects              : Program.Elements.Aspect_Specifications
         .Aspect_Specification_Vector_Access;
     Declarations         : Program.Element_Vectors.Element_Vector_Access;
     Statements           : not null Program.Element_Vectors
         .Element_Vector_Access;
     Exception_Handlers   : Program.Elements.Exception_Handlers
         .Exception_Handler_Vector_Access;
     End_Name             : Program.Elements.Expressions.Expression_Access;
     Is_Part_Of_Implicit  : Boolean := False;
     Is_Part_Of_Inherited : Boolean := False;
     Is_Part_Of_Instance  : Boolean := False;
     Has_Not              : Boolean := False;
     Has_Overriding       : Boolean := False)
      return Implicit_Procedure_Body_Declaration is
   begin
      return Result : Implicit_Procedure_Body_Declaration :=
        (Name => Name, Parameters => Parameters, Aspects => Aspects,
         Declarations => Declarations, Statements => Statements,
         Exception_Handlers => Exception_Handlers, End_Name => End_Name,
         Is_Part_Of_Implicit => Is_Part_Of_Implicit,
         Is_Part_Of_Inherited => Is_Part_Of_Inherited,
         Is_Part_Of_Instance => Is_Part_Of_Instance, Has_Not => Has_Not,
         Has_Overriding => Has_Overriding, Enclosing_Element => null)
      do
         Initialize (Result);
      end return;
   end Create;

   overriding function Name
    (Self : Base_Procedure_Body_Declaration)
      return not null Program.Elements.Defining_Names.Defining_Name_Access is
   begin
      return Self.Name;
   end Name;

   overriding function Parameters
    (Self : Base_Procedure_Body_Declaration)
      return Program.Elements.Parameter_Specifications
          .Parameter_Specification_Vector_Access is
   begin
      return Self.Parameters;
   end Parameters;

   overriding function Aspects
    (Self : Base_Procedure_Body_Declaration)
      return Program.Elements.Aspect_Specifications
          .Aspect_Specification_Vector_Access is
   begin
      return Self.Aspects;
   end Aspects;

   overriding function Declarations
    (Self : Base_Procedure_Body_Declaration)
      return Program.Element_Vectors.Element_Vector_Access is
   begin
      return Self.Declarations;
   end Declarations;

   overriding function Statements
    (Self : Base_Procedure_Body_Declaration)
      return not null Program.Element_Vectors.Element_Vector_Access is
   begin
      return Self.Statements;
   end Statements;

   overriding function Exception_Handlers
    (Self : Base_Procedure_Body_Declaration)
      return Program.Elements.Exception_Handlers
          .Exception_Handler_Vector_Access is
   begin
      return Self.Exception_Handlers;
   end Exception_Handlers;

   overriding function End_Name
    (Self : Base_Procedure_Body_Declaration)
      return Program.Elements.Expressions.Expression_Access is
   begin
      return Self.End_Name;
   end End_Name;

   overriding function Not_Token
    (Self : Procedure_Body_Declaration)
      return Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Not_Token;
   end Not_Token;

   overriding function Overriding_Token
    (Self : Procedure_Body_Declaration)
      return Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Overriding_Token;
   end Overriding_Token;

   overriding function Procedure_Token
    (Self : Procedure_Body_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Procedure_Token;
   end Procedure_Token;

   overriding function Left_Bracket_Token
    (Self : Procedure_Body_Declaration)
      return Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Left_Bracket_Token;
   end Left_Bracket_Token;

   overriding function Right_Bracket_Token
    (Self : Procedure_Body_Declaration)
      return Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Right_Bracket_Token;
   end Right_Bracket_Token;

   overriding function With_Token
    (Self : Procedure_Body_Declaration)
      return Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.With_Token;
   end With_Token;

   overriding function Is_Token
    (Self : Procedure_Body_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Is_Token;
   end Is_Token;

   overriding function Begin_Token
    (Self : Procedure_Body_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Begin_Token;
   end Begin_Token;

   overriding function Exception_Token
    (Self : Procedure_Body_Declaration)
      return Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Exception_Token;
   end Exception_Token;

   overriding function End_Token
    (Self : Procedure_Body_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.End_Token;
   end End_Token;

   overriding function Semicolon_Token
    (Self : Procedure_Body_Declaration)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Semicolon_Token;
   end Semicolon_Token;

   overriding function Has_Not
    (Self : Procedure_Body_Declaration)
      return Boolean is
   begin
      return Self.Not_Token.Assigned;
   end Has_Not;

   overriding function Has_Overriding
    (Self : Procedure_Body_Declaration)
      return Boolean is
   begin
      return Self.Overriding_Token.Assigned;
   end Has_Overriding;

   overriding function Is_Part_Of_Implicit
    (Self : Implicit_Procedure_Body_Declaration)
      return Boolean is
   begin
      return Self.Is_Part_Of_Implicit;
   end Is_Part_Of_Implicit;

   overriding function Is_Part_Of_Inherited
    (Self : Implicit_Procedure_Body_Declaration)
      return Boolean is
   begin
      return Self.Is_Part_Of_Inherited;
   end Is_Part_Of_Inherited;

   overriding function Is_Part_Of_Instance
    (Self : Implicit_Procedure_Body_Declaration)
      return Boolean is
   begin
      return Self.Is_Part_Of_Instance;
   end Is_Part_Of_Instance;

   overriding function Has_Not
    (Self : Implicit_Procedure_Body_Declaration)
      return Boolean is
   begin
      return Self.Has_Not;
   end Has_Not;

   overriding function Has_Overriding
    (Self : Implicit_Procedure_Body_Declaration)
      return Boolean is
   begin
      return Self.Has_Overriding;
   end Has_Overriding;

   procedure Initialize
    (Self : aliased in out Base_Procedure_Body_Declaration'Class) is
   begin
      Set_Enclosing_Element (Self.Name, Self'Unchecked_Access);
      for Item in Self.Parameters.Each_Element loop
         Set_Enclosing_Element (Item.Element, Self'Unchecked_Access);
      end loop;
      for Item in Self.Aspects.Each_Element loop
         Set_Enclosing_Element (Item.Element, Self'Unchecked_Access);
      end loop;
      for Item in Self.Declarations.Each_Element loop
         Set_Enclosing_Element (Item.Element, Self'Unchecked_Access);
      end loop;
      for Item in Self.Statements.Each_Element loop
         Set_Enclosing_Element (Item.Element, Self'Unchecked_Access);
      end loop;
      for Item in Self.Exception_Handlers.Each_Element loop
         Set_Enclosing_Element (Item.Element, Self'Unchecked_Access);
      end loop;
      if Self.End_Name.Assigned then
         Set_Enclosing_Element (Self.End_Name, Self'Unchecked_Access);
      end if;
      null;
   end Initialize;

   overriding function Is_Procedure_Body_Declaration
    (Self : Base_Procedure_Body_Declaration)
      return Boolean is
      pragma Unreferenced (Self);
   begin
      return True;
   end Is_Procedure_Body_Declaration;

   overriding function Is_Declaration
    (Self : Base_Procedure_Body_Declaration)
      return Boolean is
      pragma Unreferenced (Self);
   begin
      return True;
   end Is_Declaration;

   overriding procedure Visit
    (Self    : not null access Base_Procedure_Body_Declaration;
     Visitor : in out Program.Element_Visitors.Element_Visitor'Class) is
   begin
      Visitor.Procedure_Body_Declaration (Self);
   end Visit;

   overriding function To_Procedure_Body_Declaration_Text
    (Self : aliased in out Procedure_Body_Declaration)
      return Program.Elements.Procedure_Body_Declarations
          .Procedure_Body_Declaration_Text_Access is
   begin
      return Self'Unchecked_Access;
   end To_Procedure_Body_Declaration_Text;

   overriding function To_Procedure_Body_Declaration_Text
    (Self : aliased in out Implicit_Procedure_Body_Declaration)
      return Program.Elements.Procedure_Body_Declarations
          .Procedure_Body_Declaration_Text_Access is
      pragma Unreferenced (Self);
   begin
      return null;
   end To_Procedure_Body_Declaration_Text;

end Program.Nodes.Procedure_Body_Declarations;
