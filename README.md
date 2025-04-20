# dldri.config
Personal Configuration Files
> Open cmd and run the following
> ```gh repo clone dldri/dldri.config ./.config```

# Current Applications
- Komorebi
  - Set ```KOMOREBI_CONFIG_HOME``` = ```%USERPROFILE%/.config/komorebi```
  - Also update the ```app_specific_configuration_path``` inside the main komorebi.json to use ```$Env:KOMOREBI_CONFIG_HOME```/applications.json
- whkd
- Kanata
  - Includes ```run_kanata.bat``` that runs Kanata minimised - reading the configuration file from the local repo.
