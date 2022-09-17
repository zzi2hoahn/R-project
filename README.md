

============================================================

09월 14일

[03-1 클로링 준비]

1. 작업 폴더 설정하기

#install.packages("rstudioapi")   # rstudioapi 설치                         
setwd(dirname(rstudioapi::getSourceEditorContext()$path)) # 작업폴더 설정
getwd()   # 확인

2. 수집 대상 지역 설정하기

+ read.csv() 함수는 지역코드 불러옴.
+ as.character() 함수는 행정구역 (loc$code)을 문자 변환.
+ head() 함수 결과 출력함

loc <- read.csv("./sigun_code.csv", fileEncoding="UTF-8")  #  지역코드
loc$code <- as.character(loc$code) # 행정구역명 문자 변환     
head(loc, 2) # 확인

3. 수집 기간 설정하기

datelist <- seq(from = as.Date('2021-01-01'), # 시작
                to   = as.Date('2021-12-31'), # 종료
                by    = '1 month')            # 단위
datelist <- format(datelist, format = '%Y%m') # 형식변환(YYYY-MM-DD => YYYYMM) 
datelist[1:3]          # 확인

+ format(format = '%Y%m') 코드로 형식변환 -> YYYY-MM-DD

============================================================

09월 07일

[02-2 API 인증키 얻기]

공공데이터 포털에서 안증키 발급 (data.go.kr) 접속

교통교통부에서 제공하는 "아파트매매 실거래자료" 활용 신청

일반인증키(Encoding) 인증키 발급 확인 url 복사 데이터분석 확인

