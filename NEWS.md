# rjwsacruncher 0.2.1

- parameters `rename_multi_documents` and `renaming_existing_files` added in `cruncher()` function.

- parameter `cruncher_bin_directory` added in `default_parameter_file()` to get the default parameter from a local installation of the JWSACruncher.

- parameter `file_param` added in `create_param_file()` and `list2param_file()` to be able to change the name of the parameter file.

- documentation update to add new policies.

# rjwsacruncher 0.2.0

- correction in export of the log file when relative path are given.

- `cruncher_and_param()` correction in linux when `rename_multi_documents = TRUE`.

- `download_cruncher()` now compatible with version higher than 3.0.0.

- new parameters in `create_param_file()`.

- new functions `read_param_file()`, `default_param_file()` and `list2param_file()`. 

# rjwsacruncher 0.1.3

- `cruncher()` correction for `param_file_path`.

- documentation update.

# rjwsacruncher 0.1.2

- Linux compatible path (PR #2).

# rjwsacruncher 0.1.1

- `download_cruncher()` correction.

- functions now compatible with MAC OS and Linux environment.