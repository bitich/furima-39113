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
|birthday                  |date                      |null: false  DEFAULT_GENERATED          |

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
|category_id               |integer                   |null: false,                            |
|conditon_id               |integer                   |null: false,                            |
|postage_id                |integer                   |null: false,                            |
|prefectures_id            |integer                   |null: false,                            |
|shipment_id               |integer                   |null: false,                            |
|user                      |references                |null: false, foreign_key: true          |

### Association
- belongs_to :user
- has_many :item_adds
- has_many :comments
- belongs_to_active_hash  :category
- belongs_to_active_hash  :conditon
- belongs_to_active_hash  :postage
- belongs_to_active_hash  :prefectures
- belongs_to_active_hash  :shipment


## item_add テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|user                      |references                |null: false, foreign_key: true          |
|item                      |references                |null: false, foreign_key: true          |
|add                       |references                |null: false, foreign_key: true          |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :add_oder



## comment テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|content                   |text                      |null: false                             |
|user                      |references                |null: false, foreign_key: true          |
|item                      |references                |null: false, foreign_key: true          |

### Association
- belongs_to :item
- belongs_to :user


## add テーブル
|Column                    |Type                      |Option                                  |
|--------------------------|--------------------------|----------------------------------------|
|id                        |string                    |null: false                             |
|post                      |string                    |null: false                             |
|prefecture_id             |integer                   |null: false,                            |
|city                      |string                    |null: false,                            |
|address                   |string                    |null: false,                            |
|build                     |string                    |null: true,                             |
|tel                       |string                    |null: false,                            |
|item                      |references                |null: false, foreign_key: true          |

### Association
- has_many  :order_adds
- has_one_active_hash :prefectures