with AUnit.Test_Suites;
with AUnit.Reporter.Text;
with AUnit.Run;

with Utilities_Tests;
with Text_Documents_Tests;
with Callbacks_Tests;

procedure Tests is
   function All_Tests return AUnit.Test_Suites.Access_Test_Suite;

   function All_Tests return AUnit.Test_Suites.Access_Test_Suite is
      Ret : constant AUnit.Test_Suites.Access_Test_Suite :=
        AUnit.Test_Suites.New_Suite;
   begin
      AUnit.Test_Suites.Add_Test (Ret, Utilities_Tests.Suite);
      AUnit.Test_Suites.Add_Test (Ret, Text_Documents_Tests.Suite);
      AUnit.Test_Suites.Add_Test (Ret, Callbacks_Tests.Suite);
      return Ret;
   end All_Tests;

   procedure Run_All is new AUnit.Run.Test_Runner (All_Tests);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Run_All (Reporter);
end Tests;

