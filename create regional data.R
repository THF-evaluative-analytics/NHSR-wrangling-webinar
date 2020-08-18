regions <- data.frame(
   stringsAsFactors = FALSE,
             Region = c(NA,"North","North","North",
                        "Midlands & East","Midlands & East",
                        "Midlands & East","Midlands & East","Midlands & East",
                        "Midlands & East","Midlands & East","Midlands & East",
                        "Midlands & East","Midlands & East","Midlands & East",
                        "Midlands & East","Midlands & East","Midlands & East",
                        "Midlands & East","London","London","London","London","London",
                        "London","London","London","South","South","South",
                        "South","South","South","South","South","South",
                        "South","South","South","South","South","South"),
               Code = c(NA,"111AA1","111AF8",
                        "111AD9","111AA2","111AG7","111AA4","111AA5","111AB2",
                        "111AG8","111AC2","111AC3","111AC4","111AC5",
                        "111AC6","111AC7","111AC8","111AF4","111AC9","111AA7",
                        "111AA9","111AG5","111AD4","111AD5","111AD6","111AD7",
                        "111AD8","111AA6","111AG9","111AB4","111AE1",
                        "111AE2","111AE3","111AG6","111AG4","111AE5","111AE6",
                        "111AE7","111AE8","111AE9","111AF1","111AF2"),
  NHS_111_area_name = c(NA,
                        "North East England NHS 111","North West inc Blackpool NHS 111",
                        "Yorkshire And Humber NHS 111","Lincolnshire NHS 111",
                        "Luton & Bedfordshire NHS 111","Nottinghamshire NHS 111",
                        "Derbyshire NHS 111","Hertfordshire NHS 111",
                        "Norfolk including Great Yarmouth and Waveney NHS 111","Suffolk NHS 111",
                        "North Essex NHS 111","South Essex NHS 111",
                        "Cambridgeshire & Peterborough NHS 111","Northamptonshire NHS 111",
                        "Milton Keynes NHS 111",
                        "Leicestershire & Rutland NHS 111","Staffordshire NHS 111","West Midlands NHS 111",
                        "Inner North West London NHS 111",
                        "Hillingdon London NHS 111","South West London NHS 111",
                        "North West London NHS 111","North Central London NHS 111",
                        "Outer North East London NHS 111","South East London NHS 111",
                        "East London & City NHS 111","Isle Of Wight NHS 111",
                        "Thames Valley NHS 111","Oxfordshire NHS 111",
                        "Mainland Ship NHS 111","Buckinghamshire NHS 111","Berkshire NHS 111",
                        "South East Coast exc East Kent NHS 111",
                        "East Kent NHS 111","Dorset NHS 111","Banes & Wiltshire NHS 111",
                        "Bristol, North Somerset & South Gloucestershire NHS 111","Gloucestershire & Swindon NHS 111",
                        "Somerset NHS 111","Cornwall NHS 111","Devon NHS 111")
)
regions <- drop_na(regions)
# drop a few areas
regions <- regions %>% 
  filter(!str_detect(NHS_111_area_name, 'South*')) %>% 
  janitor::clean_names()

saveRDS(regions, here::here('data', 'regions.rds'))

areas_of_interest <- regions %>% 
  filter(str_detect(nhs_111_area_name, 'North*')) 

saveRDS(areas_of_interest, here::here('data', 'areas_of_interest.rds'))
