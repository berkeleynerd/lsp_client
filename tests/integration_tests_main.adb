with AUnit.Test_Suites;
with AUnit.Reporter.Text;
with AUnit.Run;

with Integration_Tests;

procedure Integration_Tests_Main is
   function All_Tests return AUnit.Test_Suites.Access_Test_Suite is
     (Integration_Tests.Suite);

   procedure Run_All is new AUnit.Run.Test_Runner (All_Tests);

   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Run_All (Reporter);
end Integration_Tests_Main;

