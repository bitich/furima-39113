# テーブル設計

## users テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|email                     |string                    |null: false                             |
|encrypted_password        |string                    |null: false                             |
|nickname                  |string                    |null: false                             |
|lastname                  |string                    |null: false                             |
|firstname                 |string                    |null: false                             |
|lastnamekana              |string                    |null: false                             |
|firstnamekana             |string                    |null: false                             |
|birthday                  |string                    |null: false                             |

- has_one :order
- has_many :items

## orders テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|id                        |string                    |null: false                             |
|payprice                  |integer                   |null: false                             |
|date                      |datetime                  |null: false                             |
|name                      |references                |null: false, foreign_key: true          |
|nickname                  |references                |null: false, foreign_key: true          |

- belongs_to :user
- belongs_to :item
- has_many :order_adds
- has_many :adds through:order_adds


## items テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|name                      |string                    |null: false                             |
|price                     |integer                   |null: false                             |
|explan                    |text                      |null: false                             |
|category                  |string                    |null: false,                            |
|status                    |string                    |null: false,                            |
|postage                   |string                    |null: false,                            |
|sender                    |string                    |null: false,                            |
|shipment                  |string                    |null: false,                            |
|comment                   |text                      |null: false,                            |
|nickname                  |references                |null: false, foreign_key: true          |


- has_one :order
- belongs_to :user


## order_adds テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|order_id                  |references                |null: false, foreign_key: true          |
|add_id                    |references                |null: false, foreign_key: true          |


- belongs_to :order
- belongs_to :add


## add テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|id                        |string                    |null: false                             |
|post                      |string                    |null: false                             |
|prefecture                |string                    |null: false                             |
|city                      |string                    |null: false,                            |
|address                   |string                    |null: false,                            |
|build                     |string                    |null: false,                            |
|tel                       |string                    |null: false,                            |

- has_many  :order_adds
- has_many :orders, through: order_adds