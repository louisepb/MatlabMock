classdef LaunchAppTest < matlab.uitest.TestCase & matlab.mock.TestCase
    methods (Test)
        function testInput(testCase)
            import matlab.mock.actions.AssignOutputs
            filename = 'input.txt';

            [mockChooser,behavior] = testCase.createMock(?FileChooser);
            when(behavior.chooseFile("*.*"),AssignOutputs(filename,pwd,1))

            app = launchApp(mockChooser);
            testCase.addTeardown(@close,app.UIFigure)

            testCase.press(app.Button)

            testCase.verifyEqual(app.Label.Text,filename)
        end

        function testCancel(testCase)
            import matlab.mock.actions.AssignOutputs

            [mockChooser,behavior] = testCase.createMock(?FileChooser);
            when(behavior.chooseFile("*.*"),AssignOutputs('input.txt',pwd,0))

            app = launchApp(mockChooser);
            testCase.addTeardown(@close,app.UIFigure)

            testCase.press(app.Button)

            testCase.verifyCalled(behavior.chooseFile("*.*"))
            testCase.verifyEqual(app.Label.Text,'No file selected')
        end
    end
end