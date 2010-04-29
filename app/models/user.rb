class User < TwitterAuth::GenericUser
  belongs_to :delivery
  # Extend and define your user model as you see fit.
  # All of the authentication logic is handled by the 
  # parent TwitterAuth::GenericUser class.

  def trans_address()
  # Google Geocoderで住所をGPS座標に変換する
  # GPS座標変換に失敗した場合は、住所を削って再試行する
  end
end
