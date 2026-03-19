classdef LaunchAppTest < matlab.uitest.TestCase
    properties
        Filename = 'input.txt'
    end
    methods(TestClassSetup)
        function checkFile(testCase)
            import matlab.unittest.constraints.IsFile
            testCase.assertThat(testCase.Filename,IsFile)
        end
    end
    methods (Test)
        function testInput(testCase)
            app = launchApp;
            testCase.addTeardown(@close,app.UIFigure)

            testCase.press(app.Button)

            testCase.verifyEqual(app.Label.Text,testCase.Filename)
        end
    end
end