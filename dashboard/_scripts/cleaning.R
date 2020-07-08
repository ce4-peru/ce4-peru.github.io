#### Procesamiento de los datos por región. ####


nac <- nac %>% dplyr::rename(	Total_Pruebas = PCR,
                Descartados=PCR_descartados ,
                Positivos	=PCR_positivos ,
                Nuevos_Positivos=PCR_diario_positivo ,
                TasaPositivos=PCR_tasa ,
                Pruebas_dia=PCR_diario,
                PruebasRapidas =PR	,
                RapidasPositivos=PR_positivos ,
                Pruebas_diaPR	=PR_diario ,
                PR_nuevos=PR_diario_positivos
               )

dep <- 
  dep %>% 
  dplyr::select(dat = Fecha,
                dep = REGION, 
                pos = Positivos_totales, 
                pos.imp = PositivosImputados_totales,
                pas =Fallecidos, 
                smp =Total_muestras,
                smp.imp =MuestrasImputadas_totales
  ) %>% 
  dplyr::mutate(dep = if_else(dep == "LIMA METROPOLITANA" | dep==  "LIMA REGIÓN","LIMA",dep)) %>%
  group_by(dat,dep) %>% summarise_all( sum, na.rm = F) %>% ungroup() %>%
  dplyr::mutate(pas = pas %>% if_else(is.na(.), 0, .),
                dat = as.Date(dat)
  ) %>% 
  group_by(dep
  ) %>% 
  dplyr::mutate(pos.new = pos - lag(pos, n = 1),
                pos.imp.new = ifelse(!is.na(pos.imp), 
                                     pos.imp - lag(pos.imp, n = 1),
                                     pos - lag(pos, n = 1)),
                pas.new = pas -lag(pas, n = 1),
                smp.new = smp - lag(smp, n = 1),
                smp.neg.new = smp.new - pos.new,
                smp.imp.new = ifelse(!is.na(smp.imp), 
                                     smp.imp - lag(smp.imp, n = 1),
                                     smp - lag(smp, n = 1)),
               #smp.imp.new.nozero = ifelse(smp.imp.new<0,0,smp.imp.new),
                ratio.new = signif(pos.imp.new/smp.imp.new), digits = 3,
                ratio.new = ifelse(is.finite(ratio.new),ratio.new,0),#Esta utilizando imputados para evitar negativos y reemplazando smaples con menos de 0
                pos.new.log = replace(log(pos.new), pos.new == 0, 0),
                pas.new.log = replace(log(pas.new), pas.new == 0, 0),
                days.start =as.numeric(dat-first(dat), unit="days"),
                dummy = days.start+20,
                dup.1 = exp((log(2)/1)*days.start),
                dup.2 = exp((log(2)/2)*days.start),
                dup.3 = exp((log(2)/3)*days.start),
                dup.4 = exp((log(2)/4)*days.start),
                days.end = difftime(today, dat , units = c("days")),
                mav.pos.new = slide_dbl(pos.imp.new, ~mean(.x, na.rm = TRUE), .before = 6) #  Media móvil esta usando Imputados 
  ) %>%
  merge(pop %>% 
          select(dep = REGION, pop)
  ) %>% 
  dplyr::mutate(pos.hab = pos/pop*100000,
                smp.hab = smp/pop*100000,
                pos.new.hab = pos.new/pop*100000,
                pas.hab = pas/pop*100000,
                pas.new.hab = pas.new/pop*100000,
                smp.new.hab = smp.new/pop*100000,
                mav.pos.new.hab = mav.pos.new/pop*1000000)

dup.dep <- data.frame(dat = as.Date(seq(1,30, 1)+as.Date(c.date))) %>%
  dplyr::mutate(days.start = as.numeric(difftime(dat,f.date), units="days"),
                dummy = days.start+20,
                dup.1 = exp((log(2)/1)*days.start),
                dup.2 = exp((log(2)/2)*days.start),
                dup.3 = exp((log(2)/3)*days.start),
                dup.4 = exp((log(2)/4)*days.start),
                dep= "LIMA",
                days.end = difftime(today, dat , units = c("days"))
  ) %>%
  bind_rows(dep)


#### Poligonos y data regional - Mapas #### 

geom.dep <- dep %>% 
  merge(shp, by.y = 'Departamento', by.x = 'dep', all.x = T) %>%
  st_as_sf(sf_column_name = 'geometry') 

rm(shp) # shp no es necesario

#### Datos a nivel Nacional #### 
nac_2 <- nac%>%
  dplyr::mutate(RapidasPositivos = replace_na(RapidasPositivos,0),
                Descartados = replace_na(Descartados,0),
                PruebasRapidas = replace_na(PruebasRapidas,0),
                total_pos = Positivos + RapidasPositivos,
                pos_new = total_pos -lag(total_pos,default = 0),
                Dia = ymd(Dia),
                Recuperados = ifelse(is.na(Recuperados),0,Recuperados),
                Fallecidos = ifelse(is.na(Fallecidos),0,Fallecidos),
                Activos = cumsum(pos_new)-(Recuperados+Fallecidos),
                Total = Recuperados + Fallecidos + Activos,
                per_recuperados =Recuperados/Total,
                per_fallecidos =Fallecidos/Total,
                per_activos = Activos/Total)%>% 
  dplyr::select(Dia,pos_new,Recuperados,Fallecidos,Activos,Total,per_recuperados,per_fallecidos,per_activos)

nac <- dep %>%
  select(-c("dep")) %>%
  group_by(dat) %>%
  dplyr::mutate_at(vars(-c("dat","dup.1","dup.2","dup.3","dup.4")),sum, na.rm = T) %>%
  dplyr::summarize_all(list(max)) %>%
  dplyr::mutate(days.end = difftime(today, dat , units = c("days")),
                days.start = as.numeric(difftime(dat,f.date), units="days"))

dup.nac <- data.frame(dat = as.Date(seq(1,30, 1)+today)) %>%
  dplyr::mutate(days.start = as.numeric(difftime(dat,f.date), units="days"),
                dummy = days.start+20,
                dup.1 = exp((log(2)/1)*days.start),
                dup.2 = exp((log(2)/2)*days.start),
                dup.3 = exp((log(2)/3)*days.start),
                dup.4 = exp((log(2)/4)*days.start)
  ) %>%
  bind_rows(nac)


#### Datos del día de hoy y ayer #### 
c.dep <- geom.dep %>%
  dplyr::filter(dat == c.date)%>%
  mutate(smp.imp.new.log = replace(log(smp.imp.new), smp.imp.new <= 0, 0))

y.dep <- geom.dep %>%
  dplyr::filter(dat == y.date)
####  Formato Regiones Wide #### 
dep.pos <-  dep %>%
  select(dat,dep,pos,days.end) %>%
  spread(dep, pos) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 

dep.pos2 <-  dep %>%
  select(dat,dep,pos,days.end,days.start) %>%
  spread(dep, pos) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 

dep.mav.pos.new<-  dep %>%
  dplyr::select(dat,dep,days.end,mav.pos.new) %>%
  spread(dep, mav.pos.new) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 


dep.pos.imp.new <- dep %>%
  select(dat,dep,days.end,pos.imp.new) %>%
  spread(dep, pos.imp.new) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 
######################################
y<- dep.pos.imp.new 
colnames(y) <- paste(colnames(y), "2", sep = "_")

dep.pos_dep.pos.imp.new<- y %>% 
  select(-c("dat_2","days.end_2")) %>% 
  cbind(dep.pos)


y<- dep.pos.imp.new 
colnames(y) <- paste(colnames(y), "2", sep = "_")

dep.mav.pos.new_pos.imp.new<- y %>% 
  select(-c("dat_2","days.end_2")) %>% 
  cbind(dep.mav.pos.new)

######################################

### Wide dup 1 inicial
dep.pos2[nrow(dep.pos2)+30,] <- NA
dup.dep.1 <- dup.dep %>%
  select(dat,dep,days.end,days.start,dup.1) %>%
  spread(dep, dup.1) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 

y<- dup.dep.1
colnames(y) <- paste(colnames(y), "2", sep = "_")

dup.dep.wide <- y %>% 
  select(-c("dat_2","days.end_2","days.start_2")) %>% 
  cbind(dep.pos2)

rm(dep.pos2)
### Wide dup 2
dup.dep.2 <- dup.dep %>%
  select(dat,dep,days.end,days.start,dup.2) %>%
  spread(dep, dup.2) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 

y<- dup.dep.2
colnames(y) <- paste(colnames(y), "3", sep = "_")

dup.dep.wide <- y %>% 
  select(-c("dat_3","days.end_3","days.start_3")) %>% 
  cbind(dup.dep.wide)

### Wide dup 3
dup.dep.3 <- dup.dep %>%
  select(dat,dep,days.end,days.start,dup.3) %>%
  spread(dep, dup.3) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 

y<- dup.dep.3
colnames(y) <- paste(colnames(y), "4", sep = "_")

dup.dep.wide <- y %>% 
  select(-c("dat_4","days.end_4","days.start_4")) %>% 
  cbind(dup.dep.wide)
### Wide dup 4
dup.dep.4 <- dup.dep %>%
  select(dat,dep,days.end,days.start,dup.4) %>%
  spread(dep, dup.4) %>% 
  dplyr::rename(LA_LIBERTAD = `LA LIBERTAD`,
                MADRE_DE_DIOS = `MADRE DE DIOS`,
                SAN_MARTIN = `SAN MARTIN`) 

y<- dup.dep.4
colnames(y) <- paste(colnames(y), "5", sep = "_")

dup.dep.wide <- y %>% 
  select(-c("dat_5","days.end_5","days.start_5")) %>% 
  cbind(dup.dep.wide)

#### LATAM #### 
Paises_LATAM <- c("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Mexico","Peru","Uruguay","Venezuela")

LATAM <- LATAM %>%
  dplyr::filter(location %in% Paises_LATAM) %>%
  dplyr::mutate()%>% 
  group_by(location)%>% 
  dplyr::mutate(new_cases = total_cases - lag(total_cases, n = 1),
                mav_new = slide_dbl(new_cases, ~mean(.x, na.rm = TRUE), .before = 6),
                days.end = difftime(today, date , units = c("days")),
                days.start = as.numeric(difftime(date,f.date), units="days"),
                dummy = days.start+20,
                dup.1 = exp((log(2)/1)*days.start),
                dup.2 = exp((log(2)/2)*days.start),
                dup.3 = exp((log(2)/3)*days.start),
                dup.4 = exp((log(2)/4)*days.start),
                mav.pos.new = slide_dbl(new_cases, ~mean(.x, na.rm = TRUE), .before = 6),
  )


dup.LATAM <- data.frame(date = as.Date(seq(1,30, 1)+as.Date(c.date))) %>%
  dplyr::mutate(days.start = as.numeric(difftime(date,f.date), units="days"),
                dummy = days.start+20,
                dup.1 = exp((log(2)/1)*days.start),
                dup.2 = exp((log(2)/2)*days.start),
                dup.3 = exp((log(2)/3)*days.start),
                dup.4 = exp((log(2)/4)*days.start),
                location= "Peru"
  ) %>%
  bind_rows(LATAM)
