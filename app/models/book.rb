class Book < ApplicationRecord

    belongs_to :user
    has_many :book_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    has_many :favorited_users, through: :favorites, source: :user
    
    def Book.search(search_word)
      Book.where(['category LIKE ?', "#{search_word}"])
    end
    #LIKE句はSQLの検索を行うための演算子
    #category LIKE? = categoryカラムを検索という意味
    

    validates :title, presence: true

    validates :body, presence: true,
                     length: { maximum: 200 }


    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    



end
