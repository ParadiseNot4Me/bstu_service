class LessonTime < ActiveRecord::Base
  def name
    return n.to_s + "-ая пара";
  end
end
