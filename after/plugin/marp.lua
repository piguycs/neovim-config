pid = 0

function marp_start()
	if pid ~= 0 then
		vim.fn.jobstop(pid)
	end

	pid = vim.fn.jobstart({ "marp", "-s", vim.fn.getcwd(), "--html" }, {
		on_exit = function(_, code)
			pid = 0
			if code ~= 143 then
				print("marp: exited with code:", code)
			end
		end,
	})
	print("marp: server started")

	os.execute("xdg-open http://localhost:8080")
end

function marp_stop()
	vim.fn.jobstop(M.jobid)
	pid = 0
	print("marp: server stopped")
end

vim.cmd("command! MarpStart lua marp_start()")
vim.cmd("command! MarpStop lua marp_stop()")
