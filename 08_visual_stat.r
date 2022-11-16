#--------------------------------
# 8-1 관심 지역 데이터만 추출하기
#--------------------------------

#---# [1단계: 데이터 준비]

library(sf) 
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
load("./06_geodataframe/06_apt_price.rdata")   # 실거래가
load("./07_map/07_kde_high.rdata")     # 최고가 레스터 이미지
grid <- st_read("./01_code/sigun_grid/seoul.shp") # 서울시그리드

#---# [2단계: 관심지역 그리드 찾기]  

install.packages("tmap") 
library(tmap)
tmap_mode('view')
#---# 그리드 그리기 
tm_shape(grid) + tm_borders() + tm_text("ID", col = "red") + 
  #---# 레스터 이미지 그리기
  tm_shape(raster_high) + 
  #---# 레스터 이미지 컬러패턴 설정
  tm_raster(palette = c("blue", "green", "yellow","red"), alpha =.4) + 
  #---# 배경지도 선택하기
  tm_basemap(server = c('OpenStreetMap'))
