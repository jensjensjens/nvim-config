local comment_call, comment = pcall(require, "Comment")
if not comment_call then
	return
end

comment.setup()
