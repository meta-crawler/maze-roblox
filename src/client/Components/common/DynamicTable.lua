local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Modules = ReplicatedStorage:WaitForChild('Modules')
local logger = require(Modules.src.utils.Logger)
local clientSrc = game:GetService('StarterPlayer'):WaitForChild('StarterPlayerScripts').clientSrc

local Roact = require(Modules.Roact)

local Support = require(Modules.src.utils.SupportLibrary)
local Print = require(Modules.src.utils.Print)

local ScrollingFrame = require(clientSrc.Components.common.ScrollingFrame)

local createElement = Roact.createElement

local function DynamicTable(props)
	local items = props.items or {}
	local rowComponent = props.rowComponent

	local ListItems = {}

	local orderedItems = Support.Values(items)

	for i = 1, #orderedItems do
		local item = orderedItems[i]
		ListItems[i] = createElement(rowComponent, Support.Merge({ item = item }, props or {}))
	end

	return createElement(ScrollingFrame, {
		Layout = 'Table',
		LayoutDirection = 'Vertical',
		CanvasSize = UDim2.new(1, 0, 1, 0),
		Size = UDim2.new(1, 0, 1, 0),
		ScrollBarThickness = 4,
		ScrollBarImageTransparency = 0.6,
		VerticalScrollBarInset = 'ScrollBar',
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0,
		LayoutOrder = 100,
		SortOrder = props.SortOrder,
		[Roact.Children] = ListItems,
	})
end

return DynamicTable