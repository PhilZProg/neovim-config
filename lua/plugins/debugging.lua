return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		-- DAP UI setup
		require("dapui").setup()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- DAP adapter setup
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { '--quiet', '--interpreter=dap' },
		}

    -- DAP configurations
		dap.configurations.c = {
    {
        name = 'Run executable (GDB)',
        type = 'gdb',
        request = 'launch',
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
    },
    {
        name = 'Run executable with arguments (GDB)',
        type = 'gdb',
        request = 'launch',
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
        args = function()
            local args_str = vim.fn.input({
                prompt = 'Arguments: ',
            })
            return vim.split(args_str, ' +')
        end,
    },
    {
        name = 'Attach to process (GDB)',
        type = 'gdb',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },
}

		-- DAP keymaps
		vim.keymap.set("n", "<F10>", dap.step_over, {})
		vim.keymap.set("n", "<F11>", dap.step_into, {})
		vim.keymap.set("n", "<F12>", dap.step_out, {})
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
	end,
}
