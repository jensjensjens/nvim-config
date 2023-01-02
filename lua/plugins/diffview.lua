local diffview_call, diffview = pcall(require, "diffview")

if not diffview_call then
	return
end

diffview.setup({})
