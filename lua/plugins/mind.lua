local mind_call, mind = pcall(require, "mind")

if not mind_call then
	return
end

mind.setup()
