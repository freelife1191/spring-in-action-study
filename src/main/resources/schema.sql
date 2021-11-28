-- 식자재 정보를 저장한다
create table if not exists Ingredient (
  id varchar(4) not null,
  name varchar(25) not null,
  type varchar(10) not null
);

-- 사용자가 식자재를 선택하여 생성한 타코 디자인에 관한 정보를 저장한다
create table if not exists Taco (
  id identity,
  name varchar(50) not null,
  createdAt timestamp not null
);

-- Taco와 Ingredient 테이블 간의 관계를 나타내며, Taco 테이블의 각 행에 대해 하나 이상의 행(타코를 식자재와 연관시키는)을 포함한다(하나의 타코에는 하나 이상의 식자재가 포함될 수 있다)
create table if not exists Taco_Ingredients (
  taco bigint not null,
  ingredient varchar(4) not null
);

alter table Taco_Ingredients
    add foreign key (taco) references Taco(id);
alter table Taco_Ingredients
    add foreign key (ingredient) references Ingredient(id);

-- 주문 정보를 저장한다
create table if not exists Taco_Order (
  id identity,
    deliveryName varchar(50) not null,
    deliveryStreet varchar(50) not null,
    deliveryCity varchar(50) not null,
    deliveryState varchar(2) not null,
    deliveryZip varchar(10) not null,
    ccNumber varchar(16) not null,
    ccExpiration varchar(5) not null,
    ccCVV varchar(3) not null,
    placedAt timestamp not null
);

-- Taco_Order와 Taco 테이블 간의 관계를 나타내며, Taco_Order 테이블의 각 행에 대해 하나 이상의 행(주문을 타코와 연관시키는)을 포함한다(한 건의 주문에는 하나 이상의 타코가 포함될 수 있다)
create table if not exists Taco_Order_Tacos (
  tacoOrder bigint not null,
  taco bigint not null
);

alter table Taco_Order_Tacos
    add foreign key (tacoOrder) references Taco_Order(id);
alter table Taco_Order_Tacos
    add foreign key (taco) references Taco(id);
