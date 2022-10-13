602277110 안지호
# 10월 12일

05. 카카오맵 API로 지오 코딩하기

[05-01 지오 코딩 준비하기]

1. 카카오 로컬 API 발급받기

카카오 개발자 사이트(developers.kakao.com 접속)
내 애플리케이션 추가하기 REST API 키 값 확인

2. 중복된 주소 제거하기

지오코딩에 수집된 자료에서 주소만 추출
duplicated() 함수로 중복된 주소 제거하고 고유 주소 값 추출함

[05-02 주소를 좌표로 변환하는 지오 코딩]

1. 지오 코딩 준비하기
kakao_key = "f3775807c814573fb9cfd3dd3e7efa7c" REST API 키 입력


2. 지오 코딩하기
카카오맵 API로 주소를 좌표 값으로 변환 시 4가지 패키지 사용 (library 함수 사용 후 주석처리)
- httr : 웹 자료 요청
- rjson : 응답 결과인 JSON형 자료 처리
- data.table : 좌표를 테이블로 저장
- dplyr : 파이프라인 사용

for()반복문을 활용 전체 주소를 좌표로 반환 tryCatch({})로 예외처리

kakao key를 헤더에 담아 GET()함수로 3가지 요청 url 구성 


3. 지오 코딩 결과 저장하기
리스트를 데이터프레임 변환 좌표값 숫자형 변환 결측치 제거 후 .csv, rdata 파일로 저장

06. 지오 데이터프레임 만들기

[06-01 좌표계와 지오 데이터 포맷]

- 좌표계 : 타원체의 실체 좌푯값을 표현하기 위해 투영 과정을 거쳐 하는 보정의 기준
- EPSG : 표준화 코드
- 데이터 프레임 : 다양한 유형의 정보를 통합하여 저장하는 포맷 공간 속성을 가진 칼럼을 추가해 공간 데이터를 일반 데이터프라임과 비슷하게 편집 및 수정 가능
- 지오데이터 포맷 : 
sp : 데이터 전체의 기하학 정보 처리할 때 유리 좌푯값을 할당 및 기준 좌표계를 정의할 때 사용
sf : 부분적인 바이너리 정보처리가 빠르고 특정 부분 추출/삭제/변형 시 사용


# 10월 05일

04 전처리 : 데이터를 알맞게 다듬기


[04-01 수집한 데이터 불러오기]

데이터 불러오기 load() 함수 사용

경고 메세지 제거 하려면 > options(warn=1) 코드 작성

[04-02 결측값과 공백 제거하기]

is.na 함수를 사용하여, table 함수와 함께 몇개 포함하는지 알수있음.

NA가 있는지 없는지 확인 후 제거
NA가 잘 제거됬는지 확인 하기
시계열 데이터 : 주식이나 환율처럼 실시간으로 변화하는 데이터 분석에 사용


# 9월 28일

[03-03 클로러 제작 : 자동으로 자료 수집하기]

2. 자료 요청하고 응답받기

url_list xmlTreeParse() 함수로 보내고 응답 결과 raw_data[i] 에 저장함.
*300건수 csv 자료 수집 완료 인코딩 문제 있음.

3. 전제 거래 건수 확인하기

xmlSize() 함수로 전체 거래 건수가 몇개 인지 카운트 (300건)

4. 개별 거래 내역 추출하기

list() 전체 거래 내역 items 임시 저장할 저장소 생성 data.table() 함수로 세부 거래 내역을 저장할 임시 저장소 생성.

for문 코드로 전체 거래 건수만큼 반복함.

5. 응답 내역 저장하기

subset() 함수로 지역명 추출함 str_sub() 함수로 문자열 추출 paste() 함수로 저장 위치 path를 설정

write() 함수로 .csv 로 실 거래 데이터 저장함.

# 9월 21일

[03-3 크롤러 제작]

1. 임시 저장 리스트 만들기
클로링 라이브러리 설치 install.package()로 XML, data.table, stringr 설치.
library()함수로 사용할 라이브러리 불러옴.

각 항목에 맞는 함수 적용하여, total 리스트에 저장.

dir.create() 함수로 수집된 자료를 저장할 폴더 생성 완료.


[03-2 요청목록 생성]

*paste() 함수

원소가 묶어 있지 않으면, 공백을 넣어 묶어 줍니다.

원소 원소 사이에 스페이스가 하나씩 들어감.


1. 요청 목록 만들기

list()함수 사용하여, 빈 요청 목록 url_list 항목 만들기.
cnt() 함수 반복문 반복 횟수를 세는 함수. 초깃값 0으로 설정이 중요.


2. 요청 목록 채우기

url_list()함수는 요청 목록으로 "프로토콜, 주소, 포트번호, 리소스 경로, 요청 내역" 등 5가지 정보로 구성.
반복문 for()문 함수 사용 cnt가 1씩 증가하고 마지막에는 300까지 누적됨.

3. 요청 목록 확인 하기

length()함수는 전체 url_list가 몇 개인지 알려줌.
borwseURL()함수 웹페이지 요청 함수 "normal service" 상태 체크


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

