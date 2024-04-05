let
  lib = import <nixpkgs/lib>;

  boolToString = value:
    if value
    then "true"
    else "false";

  # Fix-point function
  postgresSettingsTemplate = self: {
    User = "root";
    Password = "myPassword";
    Host = "localhost";
    Port = 5431;
    Database = "myDataBase";
    MinPoolSize = 0;
    MaxPoolSize = 100;
    ConnectionLifetime = 0;

    ConnectionString = "User ID=${self.User};Password=${self.Password};Host=${self.Host};Port=${builtins.toString self.Port};Database=${self.Database};Min Pool Size=${builtins.toString self.MinPoolSize};Max Pool Size=${builtins.toString self.MaxPoolSize};Connection Lifetime=${builtins.toString self.ConnectionLifetime};";
  };

  # Overlay function
  myPostgresSettingsOverlay = final: prev: {
    Port = 123123123;
    ConnectionString = prev.ConnectionString + " Pooling = true;";
  };

  myPostgresSettings = lib.extends myPostgresSettingsOverlay postgresSettingsTemplate;
in (lib.fix myPostgresSettings)
