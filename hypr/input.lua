-- https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input {
    kb_layout = "us,il",
    kb_options = "grp:alt_shift_toggle",  -- Switch languages with Alt+Shift
    repeat_rate = 40,                     -- When holding a key, it will repeat 40 times per second
  },

  misc {
      key_press_enables_dpms = true,       -- key press will trigger wake
      mouse_move_enables_dpms = true,      -- mouse move will trigger wake
  },
})
