class Patient < ApplicationRecord
    has_many :surgeries_and_immunizations
    has_many :medications
    has_many :family_histories
    has_many :subjectives
    has_many :comments

end
