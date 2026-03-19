function app = launchApp(fileChooser)
arguments
    fileChooser (1,1) FileChooser = DefaultFileChooser
end

f = uifigure;
button = uibutton(f,"Text","Input file");
button.ButtonPushedFcn = @(src,event) pickFile(fileChooser);
label = uilabel(f,"Text","No file selected");
label.Position(1) = button.Position(1) + button.Position(3) + 25;
label.Position(3) = 200;

% Add components to app
app.UIFigure = f;
app.Button = button;
app.Label = label;

    function file = pickFile(fileChooser)
        [file,~,status] = fileChooser.chooseFile("*.*");
        if status
            label.Text = file;
        end
    end
end