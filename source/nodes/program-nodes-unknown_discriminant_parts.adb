--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

package body Program.Nodes.Unknown_Discriminant_Parts is

   function Create
    (Left_Bracket_Token  : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Box_Token           : not null Program.Lexical_Elements
         .Lexical_Element_Access;
     Right_Bracket_Token : not null Program.Lexical_Elements
         .Lexical_Element_Access)
      return Unknown_Discriminant_Part is
   begin
      return Result : Unknown_Discriminant_Part :=
        (Left_Bracket_Token => Left_Bracket_Token, Box_Token => Box_Token,
         Right_Bracket_Token => Right_Bracket_Token, Enclosing_Element => null)
      do
         Initialize (Result);
      end return;
   end Create;

   function Create
    (Is_Part_Of_Implicit  : Boolean := False;
     Is_Part_Of_Inherited : Boolean := False;
     Is_Part_Of_Instance  : Boolean := False)
      return Implicit_Unknown_Discriminant_Part is
   begin
      return Result : Implicit_Unknown_Discriminant_Part :=
        (Is_Part_Of_Implicit => Is_Part_Of_Implicit,
         Is_Part_Of_Inherited => Is_Part_Of_Inherited,
         Is_Part_Of_Instance => Is_Part_Of_Instance, Enclosing_Element => null)
      do
         Initialize (Result);
      end return;
   end Create;

   overriding function Left_Bracket_Token
    (Self : Unknown_Discriminant_Part)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Left_Bracket_Token;
   end Left_Bracket_Token;

   overriding function Box_Token
    (Self : Unknown_Discriminant_Part)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Box_Token;
   end Box_Token;

   overriding function Right_Bracket_Token
    (Self : Unknown_Discriminant_Part)
      return not null Program.Lexical_Elements.Lexical_Element_Access is
   begin
      return Self.Right_Bracket_Token;
   end Right_Bracket_Token;

   overriding function Is_Part_Of_Implicit
    (Self : Implicit_Unknown_Discriminant_Part)
      return Boolean is
   begin
      return Self.Is_Part_Of_Implicit;
   end Is_Part_Of_Implicit;

   overriding function Is_Part_Of_Inherited
    (Self : Implicit_Unknown_Discriminant_Part)
      return Boolean is
   begin
      return Self.Is_Part_Of_Inherited;
   end Is_Part_Of_Inherited;

   overriding function Is_Part_Of_Instance
    (Self : Implicit_Unknown_Discriminant_Part)
      return Boolean is
   begin
      return Self.Is_Part_Of_Instance;
   end Is_Part_Of_Instance;

   procedure Initialize
    (Self : aliased in out Base_Unknown_Discriminant_Part'Class) is
   begin
      null;
   end Initialize;

   overriding function Is_Unknown_Discriminant_Part_Element
    (Self : Base_Unknown_Discriminant_Part)
      return Boolean is
      pragma Unreferenced (Self);
   begin
      return True;
   end Is_Unknown_Discriminant_Part_Element;

   overriding function Is_Definition_Element
    (Self : Base_Unknown_Discriminant_Part)
      return Boolean is
      pragma Unreferenced (Self);
   begin
      return True;
   end Is_Definition_Element;

   overriding procedure Visit
    (Self    : not null access Base_Unknown_Discriminant_Part;
     Visitor : in out Program.Element_Visitors.Element_Visitor'Class) is
   begin
      Visitor.Unknown_Discriminant_Part (Self);
   end Visit;

   overriding function To_Unknown_Discriminant_Part_Text
    (Self : aliased in out Unknown_Discriminant_Part)
      return Program.Elements.Unknown_Discriminant_Parts
          .Unknown_Discriminant_Part_Text_Access is
   begin
      return Self'Unchecked_Access;
   end To_Unknown_Discriminant_Part_Text;

   overriding function To_Unknown_Discriminant_Part_Text
    (Self : aliased in out Implicit_Unknown_Discriminant_Part)
      return Program.Elements.Unknown_Discriminant_Parts
          .Unknown_Discriminant_Part_Text_Access is
      pragma Unreferenced (Self);
   begin
      return null;
   end To_Unknown_Discriminant_Part_Text;

end Program.Nodes.Unknown_Discriminant_Parts;
