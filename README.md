# 9월14일

[03-1 클로링 준비]

1. 작업 폴더 설정하기

rstudioapi라는 라이브러리를 이용하면, 스크립트가 저장된 위츠를 작업 폴더로 쉽게 설정 가능.
install.package() 함수로 라이브러리 패키지 설치 가능

setwd() 함수 현재위치 설정
getwd() 함수 설정된 작업 폴더 출력

2. 수집 대상 지역 설정하기

read.csv() 함수는 지역코드 출력
as.character() 함수는 행정구역 출력 문자변환
head() 함수 코드 추출 결과 출력.

3. 수집 기간 설정하기

seq (from : 시작 to : 종료 by : 단위)
format() 함수 형식변환 가능


# 09월 07일

[02-2 API 인증키 얻기]

공공데이터 포털에서 안증키 발급 (data.go.kr) 접속

교통교통부에서 제공하는 "아파트매매 실거래자료" 활용 신청

일반인증키(Encoding) 인증키 발급 확인 url 복사 데이터분석 확인

