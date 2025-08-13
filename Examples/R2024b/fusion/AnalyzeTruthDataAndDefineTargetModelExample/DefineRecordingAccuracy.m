classdef DefineRecordingAccuracy < matlab.task.LiveTask
    properties(Access = private, Transient)
        SliderLabel matlab.ui.control.Label
        Slider matlab.ui.control.Slider
        SliderHelper matlab.ui.control.NumericEditField
        SliderLabel1 matlab.ui.control.Label
        Slider1 matlab.ui.control.Slider
        Slider1Helper matlab.ui.control.NumericEditField
        SliderLabel2 matlab.ui.control.Label
        Slider2 matlab.ui.control.Slider
        Slider2Helper matlab.ui.control.NumericEditField
        SliderLabel3 matlab.ui.control.Label
        Slider3 matlab.ui.control.Slider
        Slider3Helper matlab.ui.control.NumericEditField
        SliderLabel4 matlab.ui.control.Label
        Slider4 matlab.ui.control.Slider
        Slider4Helper matlab.ui.control.NumericEditField
    end
    
    properties(Dependent)
        State
        Summary
    end
    
    methods(Access = protected)
        function setup(task)
            createComponents(task);
        end
    end
    
    methods
        function createComponents(task)
            grid = uigridlayout(task.LayoutManager);
            grid.RowHeight = repmat({'fit'}, 1, 5);
            grid.ColumnWidth = repmat({'fit'}, 1, 2);
            
            % Create SliderLabel
            task.SliderLabel = uilabel(grid, 'Text', 'sampleRate');
            task.SliderLabel.Layout.Row = 1;
            task.SliderLabel.Layout.Column = 1;
            
            % Create Slider
            nestedGrid = uigridlayout(grid);
            nestedGrid.Layout.Row = 1;
            nestedGrid.Layout.Column = 2;
            nestedGrid.ColumnWidth = {'1x', 40};
            nestedGrid.RowHeight = {'1x'};
            nestedGrid.ColumnSpacing = 5;
            nestedGrid.RowSpacing = 0;
            nestedGrid.Padding = [0 0 0 0];
            task.Slider = uislider(nestedGrid);
            task.Slider.Layout.Row = 1;
            task.Slider.Layout.Column = 1;
            task.Slider.Limits = [0 2];
            task.Slider.Value = 1;
            task.Slider.MajorTicks = [];
            task.Slider.MinorTicks = [];
            task.SliderHelper = uieditfield(nestedGrid, 'numeric');
            task.SliderHelper.Limits = task.Slider.Limits;
            task.SliderHelper.Value = task.Slider.Value;
            task.SliderHelper.Layout.Row = 1;
            task.SliderHelper.Layout.Column = 2;
            task.SliderHelper.ValueChangedFcn = @(app, event) set(task.Slider, 'Value', event.Value);
            task.Slider.ValueChangingFcn = @(app, event) task.sliderStep(task.Slider, task.SliderHelper, event, 0.1);
            task.Slider.ValueChangedFcn = task.Slider.ValueChangingFcn;
            
            % Create SliderLabel1
            task.SliderLabel1 = uilabel(grid, 'Text', 'horizontalPositionAccuracy');
            task.SliderLabel1.Layout.Row = 2;
            task.SliderLabel1.Layout.Column = 1;
            
            % Create Slider1
            nestedGrid = uigridlayout(grid);
            nestedGrid.Layout.Row = 2;
            nestedGrid.Layout.Column = 2;
            nestedGrid.ColumnWidth = {'1x', 40};
            nestedGrid.RowHeight = {'1x'};
            nestedGrid.ColumnSpacing = 5;
            nestedGrid.RowSpacing = 0;
            nestedGrid.Padding = [0 0 0 0];
            task.Slider1 = uislider(nestedGrid);
            task.Slider1.Layout.Row = 1;
            task.Slider1.Layout.Column = 1;
            task.Slider1.Limits = [0 3.2];
            task.Slider1.Value = 1.6;
            task.Slider1.MajorTicks = [];
            task.Slider1.MinorTicks = [];
            task.Slider1Helper = uieditfield(nestedGrid, 'numeric');
            task.Slider1Helper.Limits = task.Slider1.Limits;
            task.Slider1Helper.Value = task.Slider1.Value;
            task.Slider1Helper.Layout.Row = 1;
            task.Slider1Helper.Layout.Column = 2;
            task.Slider1Helper.ValueChangedFcn = @(app, event) set(task.Slider1, 'Value', event.Value);
            task.Slider1.ValueChangingFcn = @(app, event) task.sliderStep(task.Slider1, task.Slider1Helper, event, 0.1);
            task.Slider1.ValueChangedFcn = task.Slider1.ValueChangingFcn;
            
            % Create SliderLabel2
            task.SliderLabel2 = uilabel(grid, 'Text', 'verticalPositionAccuracy');
            task.SliderLabel2.Layout.Row = 3;
            task.SliderLabel2.Layout.Column = 1;
            
            % Create Slider2
            nestedGrid = uigridlayout(grid);
            nestedGrid.Layout.Row = 3;
            nestedGrid.Layout.Column = 2;
            nestedGrid.ColumnWidth = {'1x', 40};
            nestedGrid.RowHeight = {'1x'};
            nestedGrid.ColumnSpacing = 5;
            nestedGrid.RowSpacing = 0;
            nestedGrid.Padding = [0 0 0 0];
            task.Slider2 = uislider(nestedGrid);
            task.Slider2.Layout.Row = 1;
            task.Slider2.Layout.Column = 1;
            task.Slider2.Limits = [0 6];
            task.Slider2.Value = 3;
            task.Slider2.MajorTicks = [];
            task.Slider2.MinorTicks = [];
            task.Slider2Helper = uieditfield(nestedGrid, 'numeric');
            task.Slider2Helper.Limits = task.Slider2.Limits;
            task.Slider2Helper.Value = task.Slider2.Value;
            task.Slider2Helper.Layout.Row = 1;
            task.Slider2Helper.Layout.Column = 2;
            task.Slider2Helper.ValueChangedFcn = @(app, event) set(task.Slider2, 'Value', event.Value);
            task.Slider2.ValueChangingFcn = @(app, event) task.sliderStep(task.Slider2, task.Slider2Helper, event, 0.1);
            task.Slider2.ValueChangedFcn = task.Slider2.ValueChangingFcn;
            
            % Create SliderLabel3
            task.SliderLabel3 = uilabel(grid, 'Text', 'velocityAccuracy');
            task.SliderLabel3.Layout.Row = 4;
            task.SliderLabel3.Layout.Column = 1;
            
            % Create Slider3
            nestedGrid = uigridlayout(grid);
            nestedGrid.Layout.Row = 4;
            nestedGrid.Layout.Column = 2;
            nestedGrid.ColumnWidth = {'1x', 40};
            nestedGrid.RowHeight = {'1x'};
            nestedGrid.ColumnSpacing = 5;
            nestedGrid.RowSpacing = 0;
            nestedGrid.Padding = [0 0 0 0];
            task.Slider3 = uislider(nestedGrid);
            task.Slider3.Layout.Row = 1;
            task.Slider3.Layout.Column = 1;
            task.Slider3.Limits = [0 0.2];
            task.Slider3.Value = 0.1;
            task.Slider3.MajorTicks = [];
            task.Slider3.MinorTicks = [];
            task.Slider3Helper = uieditfield(nestedGrid, 'numeric');
            task.Slider3Helper.Limits = task.Slider3.Limits;
            task.Slider3Helper.Value = task.Slider3.Value;
            task.Slider3Helper.Layout.Row = 1;
            task.Slider3Helper.Layout.Column = 2;
            task.Slider3Helper.ValueChangedFcn = @(app, event) set(task.Slider3, 'Value', event.Value);
            task.Slider3.ValueChangingFcn = @(app, event) task.sliderStep(task.Slider3, task.Slider3Helper, event, 0.1);
            task.Slider3.ValueChangedFcn = task.Slider3.ValueChangingFcn;
            
            % Create SliderLabel4
            task.SliderLabel4 = uilabel(grid, 'Text', 'df');
            task.SliderLabel4.Layout.Row = 5;
            task.SliderLabel4.Layout.Column = 1;
            
            % Create Slider4
            nestedGrid = uigridlayout(grid);
            nestedGrid.Layout.Row = 5;
            nestedGrid.Layout.Column = 2;
            nestedGrid.ColumnWidth = {'1x', 40};
            nestedGrid.RowHeight = {'1x'};
            nestedGrid.ColumnSpacing = 5;
            nestedGrid.RowSpacing = 0;
            nestedGrid.Padding = [0 0 0 0];
            task.Slider4 = uislider(nestedGrid);
            task.Slider4.Layout.Row = 1;
            task.Slider4.Layout.Column = 1;
            task.Slider4.Limits = [0.8 1];
            task.Slider4.Value = 0.999;
            task.Slider4.MajorTicks = [];
            task.Slider4.MinorTicks = [];
            task.Slider4Helper = uieditfield(nestedGrid, 'numeric');
            task.Slider4Helper.Limits = task.Slider4.Limits;
            task.Slider4Helper.Value = task.Slider4.Value;
            task.Slider4Helper.Layout.Row = 1;
            task.Slider4Helper.Layout.Column = 2;
            task.Slider4Helper.ValueChangedFcn = @(app, event) set(task.Slider4, 'Value', event.Value);
            task.Slider4.ValueChangingFcn = @(app, event) task.sliderStep(task.Slider4, task.Slider4Helper, event, 0.001);
            task.Slider4.ValueChangedFcn = task.Slider4.ValueChangingFcn;
        end
        
        function [code,outputs] = generateCode(task)
            outputs = {'gps'};
            codeTemplate = ["sampleRate = " + string(task.Slider.Value) + " ; % Sampling rate of the instrumentation systems"
                "horizontalPositionAccuracy =  " + string(task.Slider1.Value) + "; % Horizontal accuracy of the instrumentation systems"
                "verticalPositionAccuracy =  " + string(task.Slider2.Value) + "; % Vertical accuracy of the instrumentation systems"
                "velocityAccuracy =  " + string(task.Slider3.Value) + "; % Velocity accuracy of the instrumentation systems"
                "df = " + string(task.Slider4.Value) + "; % Decay factor of the instrumentation systems"
                "gps = gpsSensor(SampleRate=sampleRate ,..."
                "    HorizontalPositionAccuracy=horizontalPositionAccuracy, ..."
                "    VerticalPositionAccuracy=verticalPositionAccuracy, VelocityAccuracy=velocityAccuracy, ..."
                "    DecayFactor=df);"];
            code = join(string(codeTemplate), newline);
        end
        
        function summary = get.Summary(~)
            summary = "";
        end
        
        function state = get.State(task)
            state = struct;
            state.Slider = task.Slider.Value;
            state.Slider1 = task.Slider1.Value;
            state.Slider2 = task.Slider2.Value;
            state.Slider3 = task.Slider3.Value;
            state.Slider4 = task.Slider4.Value;
        end
        
        function set.State(task, state)
            task.Slider.Value = state.Slider;
            task.SliderHelper.Value = state.Slider;
            task.Slider1.Value = state.Slider1;
            task.Slider1Helper.Value = state.Slider1;
            task.Slider2.Value = state.Slider2;
            task.Slider2Helper.Value = state.Slider2;
            task.Slider3.Value = state.Slider3;
            task.Slider3Helper.Value = state.Slider3;
            task.Slider4.Value = state.Slider4;
            task.Slider4Helper.Value = state.Slider4;
        end
        
        function reset(task)
            task.Slider.Value = 1;
            task.Slider1.Value = 1.600000e+00;
            task.Slider2.Value = 3;
            task.Slider3.Value = 1.000000e-01;
            task.Slider4.Value = 9.990000e-01;
        end
    end
    
    
    methods (Access=private)
        function sliderStep(~, slider, helper, event, stepSize)
            minVal = slider.Limits(1);
            maxVal = slider.Limits(2);
            sliderVal = event.Value;
            sliderVal = round(sliderVal/stepSize) * stepSize;
            sliderVal = min(max(sliderVal, minVal), maxVal);
            set(slider, 'Value', sliderVal);
            set(helper, 'Value', sliderVal);
        end
    end
    
    methods(Access = private)
        function out = extractValue(~, widget)
            value = widget.Value;
            type = class(value);
            
            if isfield(widget.UserData, 'sourceLiveControlData')
                type = widget.UserData.sourceLiveControlData.valueType;
            end
            
            switch (type)
                case "string"
                    out = append('"', replace(value, '"', '""'), '"');
                case "double"
                    out = string(value);
                case "char"
                    out = append("'", replace(value, "'", "''"), "'");
                otherwise
                    out = value;
            end
        end
    end
end