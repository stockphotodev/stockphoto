class Plan < ApplicationRecord

enum period: { monthly: 0, yearly: 1 }
  
end
