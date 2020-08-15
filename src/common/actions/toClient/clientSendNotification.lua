local function clientSendNotification(player, text)
	--assert(typeof(playerId) == 'string')

	return {
		type = script.Name,
		playerId = tostring(player.UserId),
		replicateTo = tostring(player.UserId),
		text = text,
		time = tick(),
	}
end

return clientSendNotification