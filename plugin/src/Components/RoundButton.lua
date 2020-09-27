local Root = script:FindFirstAncestor('MazeGenerator')
local Plugin = Root.Plugin

local Roact = require(Root.Roact)
local M = require(Root.M)

local UICorner = require(Plugin.Components.UICorner)
local createElement = Roact.createElement

local materialIconsAsset = 'rbxassetid://3926305904'
local materialIconsAsset2 = 'rbxassetid://3926307971'

local MaterialIcons = {
	close = {
		Image = materialIconsAsset,
		ImageRectOffset = Vector2.new(284, 4),
		ImageRectSize = Vector2.new(24, 24),
	},
	inbox = {
		Image = materialIconsAsset,
		ImageRectOffset = Vector2.new(404, 484),
		ImageRectSize = Vector2.new(36, 36),
	},
	shop = {
		Image = materialIconsAsset2,
		ImageRectOffset = Vector2.new(684, 44),
		ImageRectSize = Vector2.new(36, 36),
	},
}

local function RoundButton(props)
	local image
	local aspect

	local size = UDim2.new(0.5, 0, 0, 50)

	if props.icon then
		size = UDim2.new(0.7, 0, 0.7, 0)
		aspect = createElement('UIAspectRatioConstraint')
		image = createElement(
			'ImageButton',
			M.extend(
				{
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0, 25, 0, 25),
					BackgroundTransparency = 1,
					ZIndex = 2,
					[Roact.Event.MouseButton1Click] = function()
						props.onClicked()
					end,
				},
				MaterialIcons[props.icon]
			)
		)
	end

	return createElement(
		'TextButton',

		M.extend(
			{
				Font = Enum.Font.SourceSans,
				Size = size,
				BackgroundColor3 = Color3.fromRGB(124, 0, 215),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 26,
				Text = '',
				[Roact.Event.MouseButton1Click] = function()
					props.onClicked()
				end,
			},
			M.omit(props, 'icon', 'onClicked')
		),
		{
			UICorner = createElement(UICorner),
			aspect,
			image,
		}
	)
end

return RoundButton