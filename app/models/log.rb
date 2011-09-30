class Log < ActiveRecord::Base
  
  serialize :entry
  
  def self.make(member_id, entry)
    log = Log.new(:time => Time.now, :card_num => member_id)
    log.entry = entry
    log.save!
  end
end
