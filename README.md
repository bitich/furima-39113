# テーブル設計

## users テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|email                     |string                    |null: false,unique:true                 |
|encrypted_password        |string                    |null: false                             |
|nickname                  |string                    |null: false                             |
|lastname                  |string                    |null: false                             |
|firstname                 |string                    |null: false                             |
|lastnamekana              |string                    |null: false                             |
|firstnamekana             |string                    |null: false                             |
|birthday                  |date                      |null: false                             |

### Association
- has_many :item_adds
- has_many :items
- has_many :comments



## items テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|name                      |string                    |null: false                             |
|price                     |integer                   |null: false                             |
|explanation               |text                      |null: false                             |
|category_id               |integer                   |null: false                             |
|conditon_id               |integer                   |null: false                             |
|postage_id                |integer                   |null: false                             |
|prefecture_id             |integer                   |null: false                             |
|shipment_id               |integer                   |null: false                             |
|user                      |references                |null: false, foreign_key: true          |

### Association
- belongs_to :user
- has_one :item_add
- has_many :comments
- belongs_to_active_hash  :category
- belongs_to_active_hash  :conditon
- belongs_to_active_hash  :postage
- belongs_to_active_hash  :prefectures
- belongs_to_active_hash  :shipment


## item_adds テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|user                      |references                |null: false, foreign_key: true          |
|item                      |references                |null: false, foreign_key: true          |


### Association
- belongs_to :user
- belongs_to :item
- has_one :add



## comments テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|content                   |text                      |null: false                             |
|user                      |references                |null: false, foreign_key: true          |
|item                      |references                |null: false, foreign_key: true          |

### Association
- belongs_to :item
- belongs_to :user


## adds テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|post                      |string                    |null: false                             |
|prefecture_id             |integer                   |null: false                             |
|city                      |string                    |null: false                             |
|address                   |string                    |null: false                             |
|build                     |string                    |                                        |
|tel                       |string                    |null: false                             |
|item_add                  |references                |null: false, foreign_key: true          |

### Association
- belongs_to  :item_add
- has_one_active_hash :prefectures