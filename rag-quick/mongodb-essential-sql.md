# MongoDB 필수 명령어 Cheat Sheet (2025 기준)

## 1. 데이터베이스 관리 명령어

| 명령어                    | 설명              | 예시                                        |
| ---------------------- | --------------- | ----------------------------------------- |
| `db` 또는 `db.getName()` | 현재 데이터베이스 확인    | `db` (현재 DB 이름 출력)                        |
| `show dbs`             | 모든 데이터베이스 목록 확인 | `show dbs` (모든 DB와 크기 나열)                 |
| `use <db_name>`        | 데이터베이스 전환/생성    | `use mydatabase` (mydatabase로 전환, 없으면 생성) |
| `db.dropDatabase()`    | 데이터베이스 삭제       | `db.dropDatabase()` (현재 DB 삭제, 주의!)       |

## 2. 컬렉션 관리 명령어

|명령어|설명|예시|
|---|---|---|
|`show collections` 또는 `db.getCollectionNames()`|모든 컬렉션 목록 확인|`show collections` (현재 DB의 컬렉션 나열)|
|`db.createCollection("<collection_name>")`|컬렉션 생성|`db.createCollection("users")` (users 컬렉션 생성)|
|`db.<collection_name>.drop()`|컬렉션 삭제|`db.users.drop()` (users 컬렉션 삭제)|

## 3. 문서 삽입 명령어

|명령어|설명|예시|
|---|---|---|
|`db.<collection_name>.insertOne({key: "value"})`|단일 문서 삽입|`db.users.insertOne({name: "John", age: 30})` (하나의 문서 추가)|
|`db.<collection_name>.insertMany([{...}, {...}])`|여러 문서 삽입|`db.users.insertMany([{name: "Alice", age: 28}, {name: "Bob", age: 34}])` (여러 문서 추가)|

## 4. 문서 조회 명령어

|명령어|설명|예시|
|---|---|---|
|`db.<collection_name>.find()`|모든 문서 조회|`db.users.find()` (users 컬렉션의 모든 문서 출력)|
|`db.<collection_name>.find({key: "value"})`|특정 조건으로 조회|`db.users.find({age: {$gt: 30}})` (나이 30 초과 문서 조회)|
|`db.<collection_name>.findOne({key: "value"})`|단일 문서 조회|`db.users.findOne({name: "John"})` (첫 번째 일치 문서 출력)|
|`db.<collection_name>.countDocuments({query})`|문서 개수 확인|`db.users.countDocuments({})` (전체 문서 수)|

## 5. 문서 업데이트 명령어

|명령어|설명|예시|
|---|---|---|
|`db.<collection_name>.updateOne({filter}, {$set: {key: "new_value"}})`|단일 문서 업데이트|`db.users.updateOne({name: "John"}, {$set: {age: 31}})` (John의 나이 업데이트)|
|`db.<collection_name>.updateMany({filter}, {$set: {key: "new_value"}})`|여러 문서 업데이트|`db.users.updateMany({age: {$lt: 30}}, {$set: {status: "young"}})` (조건에 맞는 여러 문서 업데이트)|

## 6. 문서 삭제 명령어

|명령어|설명|예시|
|---|---|---|
|`db.<collection_name>.deleteOne({filter})`|단일 문서 삭제|`db.users.deleteOne({name: "Alice"})` (Alice 문서 삭제)|
|`db.<collection_name>.deleteMany({filter})`|여러 문서 삭제|`db.users.deleteMany({age: {$gt: 50}})` (나이 50 초과 문서 모두 삭제)|

## 7. 기타 유용한 명령어

|명령어|설명|예시|
|---|---|---|
|`db.help()` 또는 `db.<collection_name>.help()`|도움말 확인|`db.users.help()` (users 컬렉션 관련 도움말)|
|`db.stats()`|통계 확인|`db.stats()` (현재 DB 통계 출력)|
|`{ $comment: "comment text" }`를 쿼리에 추가|쿼리와 함께 주석 추가|(로그 추적에 유용, 쿼리 내 삽입)|

## 현재 시간의 유닉스 타임스탬프 변환 결과 (표 형태)

이전 쿼리("timestamp to epoch second current"로 해석)를 기반으로, 2025년 7월 28일 오후 2시 KST의 유닉스 타임스탬프(Epoch 초)를 표 형태로 정리했습니다. 예시로 MongoDB에서 이 값을 사용하는 방법을 추가했습니다. (1970년 1월 1일 00:00:00 UTC부터의 경과 초를 나타냅니다.)

|항목|값/설명|예시 (MongoDB 사용)|
|---|---|---|
|KST 시간|2025-07-28 14:00:00 KST|`db.events.insertOne({event: "meeting", timestamp: ISODate("2025-07-28T05:00:00Z")})` (UTC로 삽입)|
|UTC 변환|2025-07-28 05:00:00 UTC|`db.events.find({timestamp: {$gt: ISODate("2025-07-28T05:00:00Z")}})` (UTC 기준 쿼리)|
|Epoch 초 (Unix Timestamp)|1756347600|`db.events.insertOne({event: "log", epoch: 1756347600})` (Epoch 값 직접 삽입)|
