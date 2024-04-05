{
  name = "John";
  age = 30;
  city = "New York";
  district_description = {
    poor_towns_population = rec {
      bronx = rec {
        riverdale = 47000;
        kingsbridge = 45000;
        total = riverdale + kingsbridge;
      };
      alvira = rec {
        east = 17000;
        west = 15000;
        total = east + west;
      };
      total_population = bronx.total + alvira.total;
      population_difference = bronx.total - alvira.total;
    };
    rich_towns_streets = {
      manhattan = rec {
        cinema_street = rec {
          theatre_street = "Broadway";
          boxing_street = "Madison";
        };
        business_street = rec {
          world_banking = "Wallstreet";
          local_banking = "Washington";
        };
      };
      greenville = rec {
        damn_good_street = "Abraham";
        also_good_street = "Alberta";
      };
    };
  };
}
