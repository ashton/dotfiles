require "lightspeed".setup {
  jump_to_unique_chars = {safety_timeout = 400},
  match_only_the_start_of_same_char_seqs = true,
  limit_ft_matches = 5,
  labels = nil,
  cycle_group_fwd_key = nil,
  cycle_group_bwd_key = nil
}
