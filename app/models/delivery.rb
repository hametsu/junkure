# -*- coding: utf-8 -*-
class Delivery < ActiveRecord::Base
   has_many :user
end

