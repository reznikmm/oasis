--  Copyright (c) 2019 Maxim Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: MIT
--  License-Filename: LICENSE
-------------------------------------------------------------

with Program.Compilation_Unit_Vectors;
with Program.Contexts;
with Program.Source_Buffers;
with Program.Symbols;
with Program.Visibility;

private with Ada.Containers.Hashed_Maps;
private with Ada.Containers.Vectors;
private with Program.Compilation_Units;
private with Program.Compilations;
private with Program.Symbols.Tables;

package Program.Plain_Contexts is
   pragma Preelaborate;

   type Context is limited new Program.Contexts.Context with private;

   procedure Initialize (Self : in out Context'Class);

   procedure Find_Or_Create_Symbol
     (Self   : in out Context'Class;
      Buffer : not null Program.Source_Buffers.Source_Buffer_Access;
      Span   : Program.Source_Buffers.Span;
      Result : out Program.Symbols.Symbol);

   function Find
     (Self  : Context'Class;
      Value : Program.Text) return Program.Symbols.Symbol;

   procedure Parse_File
     (Self      : aliased in out Context'Class;
      Text_Name : Text;
      Env       : aliased in out Program.Visibility.Context);

   overriding function Library_Unit_Declarations (Self : Context)
     return Program.Compilation_Unit_Vectors.Compilation_Unit_Vector_Access;

   overriding function Compilation_Unit_Bodies (Self : Context)
     return Program.Compilation_Unit_Vectors.Compilation_Unit_Vector_Access;

private

   type Symbol_List_Index is range 0 .. Integer'Last;

   function Hash (Value : Symbol_List_Index) return Ada.Containers.Hash_Type is
     (Ada.Containers.Hash_Type'Mod (Value));

   type Symbol_List_Item is record
      Prefix : Symbol_List_Index;
      Symbol : Program.Symbols.Symbol;
   end record;

   function Hash (Value : Symbol_List_Item) return Ada.Containers.Hash_Type;

   package Symbol_List_Maps is new Ada.Containers.Hashed_Maps
     (Key_Type        => Symbol_List_Item,
      Element_Type    => Symbol_List_Index,
      Hash            => Hash,
      Equivalent_Keys => "=");

   package Unit_Maps is new Ada.Containers.Hashed_Maps
     (Key_Type        => Symbol_List_Index,
      Element_Type    => Program.Compilation_Units.Compilation_Unit_Access,
      Hash            => Hash,
      Equivalent_Keys => "=",
      "="             => Program.Compilation_Units."=");

   package Unit_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Program.Compilation_Units.Compilation_Unit_Access,
      "="          => Program.Compilation_Units."=");

   type Unit_Vector (Context : access Program.Plain_Contexts.Context) is
     limited new Program.Compilation_Unit_Vectors.Compilation_Unit_Vector with
   record
      Map  : Unit_Maps.Map;
      List : Unit_Vectors.Vector;
   end record;

   overriding function Get_Length (Self : Unit_Vector) return Positive;

   overriding function Element
     (Self  : Unit_Vector;
      Index : Positive)
        return not null Program.Compilation_Units.Compilation_Unit_Access;

   overriding function Find_Unit
     (Self  : Unit_Vector;
      Name  : Text)
        return Program.Compilation_Units.Compilation_Unit_Access;

   package Compilation_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Program.Compilations.Compilation_Access,
      "="          => Program.Compilations."=");

   type Context is limited new Program.Contexts.Context with record
      Symbols      : Program.Symbols.Tables.Symbol_Table;
      Symbol_Lists : Symbol_List_Maps.Map;
      Declarations : aliased Unit_Vector (Context'Unchecked_Access);
      Bodies       : aliased Unit_Vector (Context'Unchecked_Access);
      Compilations : Compilation_Vectors.Vector;
   end record;

end Program.Plain_Contexts;
