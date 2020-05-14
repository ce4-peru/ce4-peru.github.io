nac <- rio::import("https://github.com/jincio/COVID_19_PERU/blob/master/reportes_minsa.xlsx?raw=true")

deps <- rio::import("https://github.com/jincio/COVID_19_PERU/blob/master/reportes_minsa.xlsx?raw=true", sheet = 2)

pop <- read_csv("data/peru_pop_stratum.csv") %>%
  group_by(dep_adm1) %>%
  dplyr::summarise(pop = sum(N)) %>%
  dplyr::mutate(REGION = toupper(dep_adm1))


Paises_LATAM <- c("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Mexico","Peru","Uruguay","Venezuela")
LATAM <- read_csv ("https://covid.ourworldindata.org/data/owid-covid-data.csv") %>%
  dplyr::filter(location %in% Paises_LATAM) %>%
  dplyr::mutate( mav_new = slide_dbl(new_cases, ~mean(.x, na.rm = TRUE), .before = 6))

